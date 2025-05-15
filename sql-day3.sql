-- distinct function count function 

use sakila;

select distinct (first_name) from actor;


select count(first_name) from actor;

-- functions 
-- to make code reusable 
-- scaler = one line
-- multi - row functions 

-- scaler functions = result for each row 
-- 1 row => apply => result for each row

select first_name , lower(first_name)  , 
upper(lower(first_name) ) , length(first_name) from actor;

-- substring ( col , index) 
select first_name , substr(first_name ,2) from actor;
select first_name , substr(first_name ,2) ,substr(first_name,2,3) from actor;

select first_name , substr(first_name ,-5) from actor;
select first_name , substr(first_name ,-3,2) from actor;


select first_name , instr(first_name,'I') from actor;
select first_name , instr(first_name,'E') from actor;


select first_name , last_name , concat(first_name ,' - ', last_name,'$') from actor;
select first_name , last_name , concat_ws(' - ', first_name , last_name,'$') from actor;

-- trim () = > whitespaces (leading or ending)
select first_name , '          hey   ' from actor;
select first_name ,trim( '          hey   ' )from actor; 

-- concat() == join two col

-- lpad() , rpad() 
select first_name , rpad(first_name , 6 , '$$') from actor;













