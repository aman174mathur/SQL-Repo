use employees;
select * from employees;

select * from salaries;

select * from departments;

select * from dept_emp;

-- get the emp_no and the first_name and the dept_no 
-- for the employees from the employess table and dept_emp table

select e.emp_no , e.first_name , d.dept_no from employees as e 
join dept_emp as d on e.emp_no = d.emp_no;

-- get emp_no whose salary > than sALARY OF EMP_NO 10001;
select emp_no , avg(salary) from salaries;
select * from salaries where salary>(select  avg(salary) from salaries where emp_no = 10001);
-- 
-- corelated query = outer table compared from inner table 
-- 
select * from salaries as sal 
where salary> (select  avg(salary) from salaries as s where sal.emp_no = s.emp_no);


use regex;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);


select * from employees;
-- avg salry for each dept 
select deptid , avg(salary)  from employees 
group by  deptid;
-- 
select * from employees as e where salary >
( select avg(salary) from employees as d 
where e.deptid = d.deptid);
--
select distinct d.deptname from departments as d 
where exists 
(select 1 salary from employees as e 
where d.deptid = e.deptid and salary>60000);
--
select deptid,  deptname from departments as d where exists
(select  * from empl oyees as e where d.deptid = e.deptid and salary>6000);
-- 
select *  from employees as outt where salary>= 
( select max(salary) from employees as e  where outt.deptid = e.deptid );