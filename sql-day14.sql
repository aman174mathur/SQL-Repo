-- dql = WINDOW FUNCTIONS = allow calculations across a set of
-- rows related to the current row, 
-- enabling you to 
-- perform aggregate-like operations without reducing the result set to a single row.
use sakila;
select * from payment;

select payment_id , customer_id , amount from payment ;

select payment_id , customer_id , amount ,(select avg(amount) from payment)
from payment ;


select customer_id , avg(amount) from payment  group by customer_id;

select payment_id , customer_id , amount , avg(amount) 
over() ,  
sum(amount) over() ,
max(amount) over() from payment ;


select payment_id , customer_id , amount , avg(amount) over(partition by customer_id ) ,
avg(amount) over() from payment ;


-- running sum : ????
select payment_id , customer_id , amount , 
avg(amount) over() ,
sum(amount) over (order by amount desc) ,
sum(amount) over (order by payment_id) from payment  ;



select payment_id , customer_id , amount , 
sum(amount) over(partition by customer_id) ,
sum(amount) order (payment_id);