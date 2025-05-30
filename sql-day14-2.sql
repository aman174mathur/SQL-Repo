use employees;
select * from salaries;
--
select emp_no ,
salary , 
avg(salary) over(partition by emp_no) 
from salaries;


select emp_no , 
salary , 
year(from_date) ,
avg(salary) over (partition by emp_no)
from salaries;


-- 
select emp_no , 
salary ,
sum(salary) over (partition by emp_no order by to_date)
from salaries;



