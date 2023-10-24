
use employees;
select database();
show tables;
describe titles;


select * from titles;
select distinct title from titles;
select count(distinct title) from titles;

select last_name from employees where last_name LIKE 'E%' and last_name LIKE '%E'
group by last_name;

select first_name,last_name from employees 
where last_name LIKE 'E%E' 
group by first_name,last_name;

select last_name FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
group by last_name;

select last_name,count(last_name) FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%'
group by last_name;

select first_name,gender,count(*) FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
group by first_name, gender
order by first_name;

select concat(lower(SUBSTR(first_name,1,1)),lower(SUBSTR(last_name,1,4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2)) as username,count(*) 
from employees
group by username
having count(*) > 1
order by count(*) desc;

-- BONUS QUESTIONS

show tables;
describe salaries;
describe dept_emp;
select * from dept_emp;
select * from salaries;
select emp_no,salary from salaries
group by emp_no, salary
order by emp_no,salary;

select dept_no,count(*) from dept_emp
WHERE to_date = "9999-01-01"
group by dept_no;

SELECT emp_no, count(*)
       FROM salaries
       GROUP BY emp_no;
       
SELECT emp_no, max(salary) as max
       FROM salaries
       GROUP BY emp_no;
       
SELECT emp_no, min(salary) as min
       FROM salaries
       GROUP BY emp_no;

SELECT emp_no, round(STD(salary),2) as standard
       FROM salaries
       GROUP BY emp_no;

SELECT emp_no, round(AVG(salary),2) as avg
       FROM salaries
       GROUP BY emp_no;
       

SELECT emp_no, max(salary) as max
       FROM salaries
       GROUP BY emp_no
	   having max > 150000;
  
SELECT emp_no, round(AVG(salary),2) as avg
       FROM salaries
       GROUP BY emp_no
	   having avg between 80000 and 90000;
       


-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
-- 7
-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
  -- 'Chleq' 'Lindqvist''Qiwen'

-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.

-- Using your query that generates a username for all employees, generate a count of employees with each unique username.

-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there? yes, 6 the maximum amount of times