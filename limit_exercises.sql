use employees;
select database();
show tables;
describe employees;
select * FROM employees; 
select DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
select * from employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31' ORDER BY hire_date LIMIT 5 OFFSET 45;
-- (5*10-1)