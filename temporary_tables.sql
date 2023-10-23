use employees;
create temporary table ursula_2330.employees_with_departments(first_name varchar(50),last_name varchar(50),dept_name int) AS 
SELECT * FROM employees JOIN salaries USING(emp_no);
use ursula_2330;
select database();
select * from employees_with_departments;
alter table employees_with_departments drop birth_date;

alter table employees_with_departments add full_name varchar(100);

use sakila;
select * from payment;

create temporary table ursula_2330.payment(payment_id int primary key,customer_id int, staff_id int, amount float,payment_date date, last_update date);

-- 1
create temporary table employees_with_departments2(select first_name,last_name,dept_name 
from employees.employees join employees.dept_emp using(emp_no)join employees.departments using(dept_no)where todate > now());
alter table employees_with_departments2 add column full_name varchar(30);
update employees_with_departments2  set full_name = concat(first_name,'',last_name);
-- drop
select * from employees_with_departments2;

-- cast(amount * 100 signed)
-- 2
create temporary table paying
(select payment_id,customer_id,staff_id,rental_id,cast(amount*100 as signed),payment_date,last_update from sakila.payment);
select * from paying; 

create temporary table ursula_2330.payment as
select * from sakila join film using(payment_id);



select * from payment;


-- 3
-- 3. Go back to the employees database. Find out how the current average pay in each department
-- compares to the overall current pay for everyone at the company. For this comparison, you will 
-- calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? 
-- The worst?


select 
	avg(salary), 
    std(salary)
from employees.salaries 
where to_date > now();

use employees;

drop table overall_aggregates;
-- get overall std 
create temporary table overall_aggregates as (
    select 
		avg(salary) as avg_salary,
        std(salary) as overall_std
    from employees.salaries  where to_date > now()
);

select * from overall_aggregates;


drop table current_info;
-- get current average salaries for each department
create temporary table current_info as (
    select 
		dept_name, 
        avg(salary) as department_current_average
    from employees.salaries s
    join employees.dept_emp de
		on s.emp_no=de.emp_no and 
        de.to_date > NOW() and 
        s.to_date > NOW()
    join employees.departments d
		on d.dept_no=de.dept_no
    group by dept_name
);

select * from current_info;


alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

-- set the avg and std
update current_info set overall_avg = (select avg_salary from overall_aggregates);
update current_info set overall_std = (select overall_std from overall_aggregates);


update current_info 
set zscore = (department_current_average - overall_avg) / overall_std;

select * from current_info;

select 
	max(zscore) as max_score
from current_info 
where max(zscore) = .97
;


-- -----
SELECT salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    WHERE to_date > now();