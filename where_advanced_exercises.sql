use employees;
select database();
show tables;
describe employees;
select * FROM employees; 

select * FROM employees WHERE first_name IN('Irena', 'Vidya','Maya');
select * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
select * FROM employees WHERE first_name = 'Irena' and gender = 'M' OR first_name = 'Vidya' and gender = 'M' OR first_name = 'Maya' and gender = 'M';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%E';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
select DISTINCT last_name FROM employees WHERE last_name NOT LIKE 'E%' AND last_name LIKE '%E';
select * from employees WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';
select * from employees WHERE birth_date LIKE '%-12-25';
select * from employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%q%';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%';

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
	-- 10200, 10397, 10610, 
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
	-- 10200, 10397, 10610 yes it matches
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
  -- 10200, 10397, 10821
-- Find all unique last names that start with 'E'.

-- Find all unique last names that start or end with 'E'.

-- Find all unique last names that end with E, but does not start with E?

-- Find all unique last names that start and end with 'E'.

-- Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
  -- 10261, 10438, 10012 
-- Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
  -- 10078, 10115, 10261
-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
   -- 10261, 10438, 10681
-- Find all unique last names that have a 'q' in their last name.

-- Find all unique last names that have a 'q' in their last name but not 'qu'