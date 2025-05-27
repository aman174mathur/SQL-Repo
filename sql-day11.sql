-- subquerys : query within a query 
-- single row subquery 
use sakila;

select * from payment;


select * from payment where payment_id = 6;
select * from payment where amount =(select amount from payment where payment_id = 6) ;

select * from actor;
-- need to get all columns , 
-- for a user whose actor_id > than the actor_id of a person whose first_name is 'ed ' and last name 'chase'

select * from actor where actor_id > (select actor_id from actor where first_name in ('ED') and last_name in ('CHASE'));

-- get all payment detail for those payment where the month should be equal to payment month of payment_id = 5 
select * from payment where month(payment_date)=(select month(payment_date) from payment where payment_id = 5);

-- get the customer_id , payment_id , and the amount
--  for the payments where the rental_id is less than the rental_id of payment_id = 7 , amount <5 ;

select customer_id , payment_id , amount from payment where rental_id < (select rental_id from payment where payment_id = 7 and amount<5);



-- get the amount and the total number of payments done where 
-- the total number of paymnets is greatrer than the total number of payments done by amount = 5.99; 
select amount , count(amount) as count_pay from payment group by amount having count(amount)>(select count(amount) as total_number_of_payments from payment where amount=5.99);

-- multirow subquery : when my subquery return more than one row 
-- cannot apply any comaprison operator < , > , = 

select* from payment where amount = (select amount from payment where payment_id in (3,1));
-- other than those operator use these :

-- in : either 2.99 or 5.99
select* from payment where amount in (select amount from payment where payment_id in (3,1));

-- greater than any = greater than sabse choti value of subquery 
 select* from payment where amount >any (select amount from payment where payment_id in (3,1));

-- less than any = less than sabse badi value of subquery 
 select* from payment where amount <any (select amount from payment where payment_id in (3,1));

--  / equals to any = act same as 'in' 
 select* from payment where amount =any (select amount from payment where payment_id in (3,1));

-- greater than all  = greter than subquey;s max value 
 select* from payment where amount >all (select amount from payment where payment_id in (3,1));
 
 -- less than all = less than the smallest value of subquery 
 select* from payment where amount <all (select amount from payment where payment_id in (3,1));