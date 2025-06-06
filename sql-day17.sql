use sakila;
-- q1
select count(actor_id) , film_id from film_actor where film_id =40;
-- q2
select * from film_actor;
select * from actor;

-- q3
select a.first_name , a.actor_id from actor as a join 
film_actor as f on a.actor_id= f.actor_id 
where film_id=40;

-- q4
select actor_id , count(film_id) as total_films from film_actor 
group by actor_id;

-- q5
select film_id , count(actor_id) as actor_no from film_actor 
group by film_id;

-- q6
select film_id , count(actor_id) as actor_no from film_actor 
group by film_id
having count(actor_id)>2;

select * from payment;
-- q1
select customer_id , count(staff_id) , sum(amount) , avg(amount) from payment
group by customer_id;

-- q2
select customer_id , staff_id , sum(amount) from payment 
group by customer_id ,  staff_id ;

select customer_id ,sum(amount) from payment 
group by  customer_id ;

select staff_id ,sum(amount) from payment 
group by  staff_id ;


select sum(amount) , month(payment_date) as month_wise , year(payment_date) as year_wise
from payment 
group by  year_wise, month_wise ;  -- months in year 


select sum(amount) , month(payment_date) as month_wise , year(payment_date) as year_wise
from payment 
group by  month_wise , year_wise; -- year in months 


select * from film_actor;
select * from payment;

-- q1
select * from payment where payment_date >(select payment_date from payment where payment_id = 3);

-- q2 multicolumn subquery ==
select * from payment where (staff_id , amount)=(select staff_id , amount from payment where payment_id =2);

-- q3
select customer_id , count(payment_id) from payment 
group by customer_id 
having count(payment_id)>(select  count(payment_id) from payment where customer_id = 2 );



