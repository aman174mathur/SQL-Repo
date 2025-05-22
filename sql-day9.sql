use sakila;

select * from payment;

select count(payment_id) as total , customer_id 
from payment where customer_id>3 
group by customer_id having total >30;


select count(payment_id) as total , customer_id 
from payment where customer_id not in (2,3) 
group by customer_id having total >40;


-- get the number of payments for each amount 
-- count the total number of customer who have done the payment for each amount except amount 2.99 and 0.99 

-- get the sum of rentalId and the total amiunt of payment only for the amount 2.99 , 0.99 , 5.99 
-- and the sum of rentalids should be greater than 1000

select count(payment_id) from payment group by amount; 
select count(customer_id ) , sum(amount) from payment where amount not in (2.99 , 0.99 ) group by amount ;

select sum(rental_id) , sum(amount) from payment where amount in (2.99 , 0.99 , 5.99) ;

select sum(rental_id) as total_rental , sum(amount) from payment where amount in (2.99 , 0.99 , 5.99) and rental_id > 10000 group by amount ;

select  amount , sum(rental_id) as total_rental , sum(amount) from payment where amount in (2.99 , 0.99 , 5.99) group by amount having sum(rental_id) > 1000;


select * from actor;
select * from film_actor;

-- 
select a.actor_id , count(film_id) 
 from actor as a 
join film_actor as  f 
where  a.actor_id = f.actor_id 
group by a.actor_id having count(film_id)>25;






