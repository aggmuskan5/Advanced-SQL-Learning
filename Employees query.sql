
use employees;
# create employees duplicate table
drop table if exists employees_dup;
create table employees_dup(emp_no int(11),birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date);
insert into employees_dup
select * from employees
limit 20;
select * from employees_dup;
insert into employees_dup values ('10001','1953-09-03','Georgi','Facello','M','1986-06-26');

# Assign emp no 110022 as a manager to all employees from 10001 to 10020

SELECT 
    e.emp_no AS employee_id,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_id
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no;
