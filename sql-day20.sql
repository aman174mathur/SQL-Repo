use sakila;

-- offset = skipped rows
select * from actor order by actor_id limit 2,5;
-- here 2 is the offset (skipped rows)
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- ORDER BY column_name
-- OFFSET rows_to_skip ROWS;

-- order of excution :

-- In SQL queries, clauses are executed based on the following order:
-- FROM and/or JOIN clause.
-- WHERE clause.
-- GROUP BY clause.
-- HAVING clause.
-- SELECT clause.
-- DISTINCT clause.
-- ORDER BY clause.
-- LIMIT and/or OFFSET clause.

select * from film_actor;


select * from film_actor 
where actor_id in 
(select actor_id from film_actor where film_id=140);



-- if actor has done only one movie title it as "1 movie" else 
-- show the number of movie the actor has done 
SELECT actor_id ,
    CASE
        WHEN COUNT(film_id) = 1 THEN "only one movie"
        WHEN COUNT(film_id) > 1 THEN CAST(COUNT(film_id) AS CHAR)
    END AS film_count_status
from 
    film_actor
group by 
    actor_id;
    
    
-- window function practise
use tushar;
-- Step 1: Create the EmployeeSales table
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

-- we use windows functions as less as possible 

-- percent of sales 
select * , sum(saleamount) over() , 
(saleamount/sum(saleamount) over()*100)    
from employeeSales;

-- for every department
select * ,sum(saleamount) over(partition by department)
from employeeSales;

-- 
select * ,sum(saleamount) over(partition by department order by saleamount)
from employeeSales;

-- partition by = grouping the same kind of values 

-- for every employee
select * ,sum(saleamount) over(partition by employeename)
from employeeSales;

-- ordered by saleamount = for every amount it adds 
select * ,sum(saleamount) over(partition by employeename order by saleamount)
from employeeSales;

-- lead = above values 

select * , lead(saledate) over() ,
lead(saledate , 1) over() as next_day, 
lead(saledate, 2) over() 
from employeeSales;


with cte as 
(select * , lead(saledate) over() ,
lead(saledate , 1) over() as next_day, 
lead(saledate, 2) over() 
from employeeSales)

select * from cte where datediff(next_day,saledate)=1;


