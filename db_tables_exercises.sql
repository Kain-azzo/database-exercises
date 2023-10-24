SHOW databases;
use albums_db;
select database();
SHOW tables;
use employees;
select database();
SHOW tables;
describe employees;
-- Which table(s) do you think contain a numeric type column? emp_no
-- Which table(s) do you think contain a string type column? first_name, last name, gender
-- Which table(s) do you think contain a date type column? birth_date, hire_date
-- What is the relationship between the employees and the departments tables? No direct relationship

describe dept_manager;
describe departments;
show create table dept_manager;
-- code used for dept_manager
-- CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 
