use join_example_db;
select database();
show tables;
select * 
from roles;
show tables;
select * 
from users;
select * 
from roles;
SELECT users.name as user_name, roles.name as role_name
FROM users
left JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
right JOIN roles ON users.role_id = roles.id;

select *
from roles r
join users u
 on r.id =u.role_id;
 
 select *
from roles r
left join users u
 on r.id =u.role_id;
 
 select count(u.id)
 from roles r
 left join users u
 on r.id =u.role_id
 group by r.name;


use employees;
select database();





-- 2
SELECT  d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY Department_Name,Department_Manager
order by dept_name;

select * from dept_manager;
select * from employees;
select * from departments;
select * from titles;
select * from salaries;
show tables;

use employees;
select database();

-- 3
SELECT  d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' and gender = 'F'
GROUP BY Department_Name,Department_Manager
order by dept_name;


-- 4
describe title;
describe dept_emp;
describe departments;

select t.title as Title,count(de.emp_no) as count
from titles t
join dept_emp de
 on t.emp_no=de.emp_no and t.to_date > now() and de.to_date > now()
join departments d
on d.dept_no = de.dept_no
where d.dept_name = "Customer Service"
group by t.title
order by t.title;



-- 5
describe salaries;

SELECT d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Name1, s.salary as Salary
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
JOIN salaries as s
  ON s.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01' and de.to_date = "9999-01-01"
GROUP BY Department_Name,Name1,Salary
order by d.dept_name;


use employees;
select database();
-- 6
describe dept_emp;
describe departments;
SELECT  d.dept_no as dept_no, d.dept_name as dept_name, count(de.dept_no) as num_employees
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' 
GROUP BY dept_no,dept_name
order by dept_no;


-- 7
describe departments;
describe salaries;
SELECT  d.dept_name as dept_name, round(avg(s.salary),2) as average_salary
FROM departments as d
join dept_emp de
	on d.dept_no=de.dept_no and
    de.to_date > NOW()
JOIN salaries as s
  ON s.emp_no = de.emp_no 
  and s.to_date > now()
group by dept_name
order by average_salary DESC 
limit 1;



-- 8
describe employees;
describe salaries;
describe departments;
SELECT e.first_name as first_name, e.last_name as last_name, s.salary, d.dept_name 
FROM employees AS e
JOIN salaries as s
  on e.emp_no=s.emp_no and
    s.to_date > NOW()
JOIN dept_manager as dm
  on dm.emp_no=e.emp_no and
    dm.to_date > NOW()
JOIN departments AS d
  ON d.dept_no = dm.dept_no
order by s.salary desc
limit 1;

-- 9
SELECT e.first_name as first_name, e.last_name as last_name, s.salary, d.dept_name as dept
FROM employees AS e
JOIN salaries as s
  ON s.emp_no = e.emp_no
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
join departments d 
	on d.dept_no=dm.dept_no
WHERE dm.to_date > now() and s.to_date > now()
order by s.salary desc
limit 1;

-- 10
describe salaries;
describe departments;

select d.dept_name, round(avg(s.salary),0) as average_salary
from salaries s
join dept_emp de
	on s.emp_no = de.emp_no
join departments d 
	on d.dept_no = de.dept_no
GROUP by d.dept_name
order by average_salary desc;

-- bonus
select concat(e.first_name,'',e.last_name) as "employee name", d.dept_name as "Department Name", m.managers as "Manager Name"
from employees e 
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on d.dept_no = de.dept_no
join dept_manager dm
	on d.dept_no = de.dept_no and dm.to_date > now()
join employees as managers
	on managers.emp_no=dm.emp_no
    where de.to_date > curdate()
order by d.dept_name
