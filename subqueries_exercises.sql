use employees;
select database();

-- 1
SELECT first_name, last_name
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
) 
and hire_date = hire_date
LIMIT 10;


select hire_date,emp_no

from employees;

SELECT hire_date
FROM employees
WHERE emp_no = 101010;


  -- 2  
SELECT e.first_name, t.title
FROM employees as e
join titles as t
	on e.emp_no = t.emp_no
join dept_emp as de
	on e.emp_no = de.emp_no
WHERE  e.first_name in (
    SELECT first_name
    FROM employees
    WHERE first_name = "Aamod") and de.to_date > now();
    
    
	SELECT first_name
    FROM employees
    WHERE first_name= "Aamod";
    
-- 3
-- SELECT count(*)
-- FROM employees as e
-- join dept_emp as de
-- 	on e.emp_no = de.emp_no
-- WHERE e.emp_no in (
-- 	SELECT count(*)
--     FROM dept_emp
--     WHERE to_date < now());
--     
    
 -- 3  answer
SELECT (select count(emp_no)
   from employees) - (select count(emp_no)
    FROM dept_emp
    WHERE to_date > now()) as "total employees gone";
   
   select count(emp_no)
   from employees;
   
   select count(e.emp_no)
   from employees as e
   join dept_emp as de
	on e.emp_no = de.emp_no
   WHERE de.from_date < now();
   
-- 4
SELECT e.first_name, e.last_name, e.gender
FROM employees as e
join dept_manager as dm
	on e.emp_no = dm.emp_no
WHERE dm.emp_no in (
    SELECT emp_no
    FROM dept_manager) and e.gender = 'F';
    
-- 5
select avg(s.salary)
from salaries as s;

SELECT e.first_name, e.last_name, s.salary
FROM employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join salaries as s
 on e.emp_no=s.emp_no
WHERE s.salary > (
    select avg(salary)
from salaries) and de.to_date > now()
order by s.salary desc
limit 10;
    
-- 6
select max(salary)
from salaries;

select count(salary)
from salaries
where (select max(salary)
from salaries) between (.68 * (select salary
    FROM salaries) (.68 * (select salary
    FROM salaries)
    and to_date > now());

    
    
-- bonus
-- 1
SELECT de.dept_no, e.first_name, e.last_name, e.gender
FROM employees as e
join dept_manager as dm
	on e.emp_no = dm.emp_no
join dept_emp as de
	on e.emp_no = de.emp_no
WHERE dm.emp_no in (
    SELECT emp_no
    FROM dept_manager) and e.gender = 'F';
   
 