use sakila;

select * from actor;

select count(actor_id)  from actor where first_name ='NICK'; 

select first_name , count(actor_id)  
from actor 
group by first_name 
order by count(actor_id) asc 
limit 5;


-- data types in sql: 
-- data type = type of values 
-- 1, int float , double
-- 2, char , varchar , string
-- 3, date , timestamp



-- numbers:
-- create (statement) 
create table test (id tinyint );
insert into test values(10);
select * from test;

-- unsigned: only positive values 
create table test3 (id tinyint unsigned );
insert into test3 values(255);
select * from test3;

-- float and decimal
create table test4 (id decimal(5,2) );
insert into test4 values(458);
insert into test4 values(458.34566);
insert into test4 values(845.7);

select * from test4;

-- float is small = used for 
-- string data  , char = character , varchar = variable character
create table test5( fname char(5)) ; -- fixed length charcter (only 5 char) 
insert into test5 values('hi'); -- 2 char = 2 byte 
insert into test5 values('hello');
insert into test5 values('aman');
insert into test5 values('error');
insert into test5 values('eroorsnlsv');

select * from test5;


create table test6( fname varchar(5)) ; -- not fixed length charcter (only 5 char) 
insert into test6 values('hi'); -- 2 char = 2 byte 
insert into test6 values('error');
insert into test6 values('eroorsnlsv');
insert into test6 values('hey      ');  -- whitespaces are truncated  and it takes upto maxlimit given

select fname , char_length(fname)  from test6;
-- 

-- lifo , filo (stack) 

-- date / timestmp:
create table test7(dob date);
insert into test7 values('2023-12-01'); -- rigth
insert into test7 values('01-01-2025'); -- error 
select * from test7;


create table test8(dob timestamp);
insert into test8 values('2023-12-01 10:15:59');
insert into test8 values(now()); 
select * from test8;

-- subqurey = query within a query 
select payment_id , amount from payment;
select * from payment where payment_id=10;
select amount from payment where payment_id=10;


select * from payment where amount=2.99;
select * from payment where amount=(select amount from payment where payment_id=10);

select payment_id , customer_id , rental_id , amount , staff_id from payment 
where staff_id = (select staff_id from payment where rental_id=1422);