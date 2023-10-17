use employees;
select database();
show tables;
describe employees;
select * FROM employees; 

select * FROM employees WHERE first_name IN('Irena', 'Vidya','Maya') ORDER BY last_name, first_name;
select * FROM employees WHERE first_name IN('Irena', 'Vidya','Maya') ORDER BY first_name, last_name;
select * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
select * FROM employees WHERE first_name = 'Irena' and gender = 'M' OR first_name = 'Vidya' and gender = 'M' OR first_name = 'Maya' and gender = 'M';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' OR '%E';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%E';
select DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' AND '%E';
select * from employees WHERE hire_date BETWEEN '1990-01-01' and '1999-12-31';
select * from employees WHERE birth_date LIKE '%-12-25';
select * from employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%q%';
select DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%';

select * FROM employees WHERE first_name IN('Irena', 'Vidya','Maya') ORDER BY first_name;
select * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY first_name, last_name;
select * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY first_name;
select * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY last_name, first_name;
select * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY emp_no;
select * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY hire_date DESC;
select * FROM employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31' ORDER BY birth_date, hire_date DESC;
-- 1. Irena Reutenauer, Vidya Simmen
-- 2. Irena Action, Vidya Zweizig
-- 3. Irena Action, Maya Zyda
-- 4. 899 rows returned 10021 Ramzi Erde, 499648 Tadahiro Erde
-- 5. 899 rows returned Teiji Eldridge, Sergi Erde
-- 6. 362 rows returned Khun Bernini, Douadi Pettis
