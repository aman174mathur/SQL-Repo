use sakila;

-- string functions :
-- numbers , date 

-- dual tavle = used for testing purpose (to see how logic is working) 

-- dual = is the temporary run of the code 
select 9*1234 from dual;

-- now() = show current time and date 
select sysdate() , curdate() , current_time() , current_timestamp() , now()from  dual;

-- addate() = no days to add 
select now() , adddate(now() , 2) from dual;

select now() , adddate(now() , interval 2 month ) from dual;

select now() , adddate(now() , interval 2 year) from dual;

select now() , adddate(now() ,interval  2 week ) from dual;

select now() , adddate(now() , interval 2 minute ) from dual;


-- datediff () = difference between two variables of date 
select datediff( now() , '2025-05-16 17:20:00' ) from dual;
select datediff( '2025-05-20 17:30:00' , '2025-05-16 17:20:00' ) from dual;

-- lastday() = last day of month 
select last_day(now()) from dual;

select month(now()) , year(now()) from dual ;

-- extract() = extract date , year , month , second ,  minute from time
select extract( year from now()) from dual;
select extract( minute from now() ) from dual;

-- date to string format = rarely ( %y , %m , %w ) 
-- % Y IS A ACESS MODIFIER ** 
select date_format( now() , 'this year is %Y') from dual;


-- numbers  functions 

-- round() , truncate() , power() , floor() , ceil() , mod() = remainder , 

select 24.325  , round(24.2325) from dual;
-- round off to decimal value  
select 24.325  , round(24.8325 , 1) from dual;
select 24.325  , round(24.8325 , 2) from dual;
select 24.325  , round(24.8 , 5) from dual;

-- round off to nearest hundred place
select round(24.32 , -1 ) from dual; -- nearest 10 
select round (364.32 , -2) from dual; -- nearest 100 

-- truncate = used to extract decimal value 
select  round (364.37 , 1) , truncate( 364.37 ,1) from dual;

-- 
select mod(11,2) , pow(2,3) , floor(10.999) , ceil(19.001) from dual;

-- general functions 
-- flow control functinons

select * from actor;
-- if (condition , true , false )
select first_name , actor_id , if(first_name ='NICK', actor_id*10 , 'no value') from  actor;

-- nested if else  = elif 
-- if ( condition , true , if (cond , true , false))
select first_name , actor_id , if(first_name ='NICK', 'yes' , if('ED', "hello" , "no")) from  actor;


-- ques tion :    actor_id = even then first_name and last_name = concat , if odd concat with $ symbol 

select first_name , last_name , actor_id , if( actor_id%2 = 0 , concat(first_name,'-',  last_name) ,  concat_ws('$' , first_name ,last_name)) from actor;


-- CASE 
select * from actor;
select first_name , 
case 
when mod(actor_id ,2) =0 then "yes"
when actor_id = 5 then "#### yesss###"
else "no"
end 
from actor;

