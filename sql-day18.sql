use sakila;
select * from payment;


select customer_id , avg(amount) from payment 
group by customer_id;

select p1.payment_id , p1.customer_id , p1.amount from payment as p1
where amount >(select avg(amount) from payment as p2 where p1.customer_id = p2.customer_id );