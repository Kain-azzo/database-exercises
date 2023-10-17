USE employees;
select * from employees;
select hire_date from employees order by hire_date DESC;
describe employees;
describe salaries;
select database();
select concat(first_name,last_name) as full_name from employees where first_name like "E%" and last_name LIKE '%E';
select concat(UPPER(first_name),UPPER(last_name)) as full_name from employees where last_name LIKE 'E%' and last_name LIKE '%E';
select count(concat(first_name,last_name)) as full_name from employees where last_name LIKE 'E%' and last_name LIKE '%E';
select * from employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31';
select min(salary),max(salary) from salaries;

SELECT min(hire_date), max(hire_date)from employees WHERE EXTRACT(year from hire_date)between 1990 and 1999 and birth_date like "%12-25";
SELECT *, DATEDIFF(CURDATE(),hire_date) as num_days_at_company from employees WHERE birth_date LIKE '%-12-25' and hire_date BETWEEN '1990-01-01' and '1999-12-31' ORDER by hire_date DESC;
show databases;
show tables;
select concat(lower(SUBSTR(first_name,1,1)),lower(SUBSTR(last_name,1,4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2)) as username,first_name,last_name,birth_date from employees