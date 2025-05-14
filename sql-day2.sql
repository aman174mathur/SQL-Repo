show databases;

use sakila;
show tables;

select * from actor;

select actor_id , last_name from actor;

select actor_id , actor_id*10 , last_name from actor;

SELECT actor_Id , last_name from actor;

select *
from 
actor
select 
select * from actor where first_name = 'ED';
select * from actor where actor_id=1;
select * from actor where first_name = 'ED' and actor_id > 100;

select * from actor where actor_id >10 and actor_id<25;

-- between  operator = range of values --
select * from actor where actor_id between 10 and 25 ;
-- if i dont want to include 10 and 25 , so use 11 and 26

-- check for error  
select first_name from actor where actor_id = 5;

select * from actor where actor_id = 2 or actor_id = 5;

-- in == specific values
select * from actor where actor_id in (2,5,8989098);

-- LIKE OPERATOR = WORK ON ANY PATTERN -- 

SELECT * FROM ACTOR WHERE FIRST_NAME='NICK';
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE 'NICK';

SELECT * FROM ACTOR WHERE FIRST_NAME LIKE 'N';
-- [ % = ZERO OR MORE CHARATER ]
-- [ _  = ONLY ONE CHARATER] 

SELECT * FROM ACTOR where FIRST_NAME LIKE 'N%';
-- FIRST CHARATER N 

SELECT * FROM ACTOR where FIRST_NAME LIKE '%N';
-- LAST CHARATER N 

SELECT * FROM ACTOR where FIRST_NAME LIKE 'S%T' ;
-- FRIST CHAR = S AND LAST CHAR = T 

SELECT * FROM ACTOR where FIRST_NAME LIKE 'ED%';

SELECT * FROM ACTOR where FIRST_NAME LIKE '%A_';



-- QUES1 
select * from actor where actor_id in (3,5,7);

-- ques 2 
select * from actor where actor_id between 3 and 7 ;

-- question 3 
select * from actor where actor_id not between 3 and 100;

-- ques 4 
select * from actor where first_name like '_E%R';

-- ques 5 
select * from actor where first_name like '%NN%';

-- ques 6 
select * from actor where first_name like '__' and last_name like '__%S';

-- ques 7 
select * from actor where first_name like '_____';

-- question 8 
SELECT * FROM actor WHERE first_name LIKE '_A%T%H__';







