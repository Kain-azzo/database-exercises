use employees;
-- 1
select de.emp_no,de.from_date as "start date", de.to_date as "end date", de.dept_no, if(de.to_date > now(),True,False) as 'is_current_employee'
from employees as e
join dept_emp as de
using(emp_no)
;

-- 2
select e.first_name, e.last_name, de.dept_no, 
CASE
	when substr(e.last_name,1,1) between 'A' and 'H' then 'A-H'
    when substr(e.last_name,1,1)  between 'I' and 'Q' 'q%' then 'I-Q'
    when substr(e.last_name,1,1)  between 'R' and 'Z' like 'z%' then 'R-Z'
    when substr(e.last_name,1,1) like 'h%' then 'A-H'
	when substr(e.last_name,1,1) like 'h%' then 'I-Q'
	when substr(e.last_name,1,1)  like 'z%' then 'R-Z'
   
END as 'alpha_group'
from employees as e
join dept_emp as de
using(emp_no)
order by last_name desc
;
-- 3
select count(*),
CASE
	when birth_date like "195%"  then '1950\'s'
    when birth_date like "196%"  then '1960\'s'
 

   
END as 'decades'
from employees 
group by decades;

-- 4
select round(avg(s.salary),2) as average,
CASE
 WHEN d.dept_name IN ('research', 'development') THEN 'R&D'
 WHEN d.dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
 WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
 WHEN d.dept_name IN ('Customer Service') THEN 'Customer Service'
 WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'

   
END as 'department'
from employees as e
join dept_emp as de
using(emp_no)
join salaries as s
 on e.emp_no=s.emp_no
join departments as d
	using(dept_no)
where de.to_date > now() and s.to_date > now()
group by department;