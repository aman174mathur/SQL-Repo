-- order by , alias , multi row function
use sakila;

-- order by = sorting of data 
select* from actor order by first_name ; 
-- sorted by alphabet

-- sorting on multiple columns
select * from actor order by first_name , actor_id desc; 

-- alias = as 
select actor_id , actor_id+10 as 'updated actor_id' from actor;


-- multi row function = multiple rows apply and give one output 
-- sum , count , max , min , avg

select * from payment ;

select distinct( customer_id ) from payment;

-- unique customers 
select count(distinct( customer_id)) as 'unique customers' from payment;

select count(customer_id) as totalcust ,
 count(distinct(customer_id)) uniquecust ,
 count(customer_id)-count(distinct(customer_id)) as repetitivecust 
 from payment;

--  aggregate functions / aggregation function  = are the functions which are used to perform 
-- function over certain values and return a single value 
select count(amount) from payment;

select sum(amount) from payment;

select avg(amount) from payment;

select max(amount) from payment;

select min(amount) from payment;

-- sum  , max , min , avg   SKIP THE NULL VALUES

-- NORMAL FUNCTIONS ARE NOT USED WITH AGGREGATE FUNCTIONS !!!!!!!!!
SELECT sum(amount) , amount FROM payment;

-- GROUPBY = SIMILAR VALUES KA GROUP 
-- WHY ? = -- repeated 
select sum(amount) from payment where customer_id=1;
select sum(amount) from payment where customer_id=2;

-- repeated 
select customer_id from payment group by customer_id;

select customer_id , count(amount) , sum(amount) from payment group by customer_id;

-- if we do group by on a column  
-- we only use that column with select any other column will not work 
-- only aggregate function will work 

-- 1 amount value kitni baar ayyi 
select amount , count(amount) from payment group by amount order by amount;

-- find out the total payments rented the sum of amount and the maximum rental id 
-- get the total time of rental id , the sum of amount spended and the max rental vlaue for each staff


select staff_id  , count(rental_id) , sum(amount) , max(rental_id) from payment group by staff_id;

-- get the total no of customer served with the maxmimum and the minimum rental id with the average amount spended for each month of payment date 
select extract( month from payment_date) , 
count(customer_id) ,
 max(rental_id) ,
 min(rental_id) as month_day 
 from payment group by extract( month from payment_date);



