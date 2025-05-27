
use employees ;
select * from employees;
-- get those employees information whose yr  hiring is same as the emp_num = 1002 
select * from employees where hire_date=(select hire_date from employees where emp_no = 10002);
-- get the empliyee number the dob and full name of person whose birth date is greater than birth date among all the employee no belonging from 1003 to 1006

SELECT emp_no , birth_date, CONCAT(first_name, last_name)
WHERE birth_date > (SELECT birth_date 
FROM employees 
WHERE emp_no BETWEEN 10003 AND 10006);

SELECT birth_date 
FROM employees 
WHERE emp_no BETWEEN 10003 AND 10006;


select * from titles;
-- get the employee number first_name and the title for all those emp who are currently working on the SENOIR ENGINNER POSITION 
select	emp_no , first_name from employees where emp_no in (select emp_no from titles where title = 'SENIOR ENGINEER');

-- get the name of emp and dob for the person who has started working in 1986 


-- get all the employee information only for that employee who have worked on 3 or positions 


