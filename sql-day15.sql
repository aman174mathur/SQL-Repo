-- rank and dense rank = used to rank but one skiiping values and other is not 

use sakila;

select * from payment;

select payment_id , customer_id , amount , 
sum(amount) over (partition by customer_id ),
rank() 
	over(partition by customer_id order by amount desc)
		as rank_1, 
dense_rank() 
	over(partition by customer_id order by amount desc) 
		as rank_2
from payment;


-- where ranking is third 
-- suquery in from = subquery can be used in from 
select * from 
(
	select payment_id , customer_id , amount , 
	dense_rank() 
	over(order by amount desc) 
		as rank_2
	from payment) as tab where rank_2=3;

-- data query? 
-- how to insert and update data 
use sakila;
create table xyz(id int , fname varchar(20) );
create table abc(id int , fname char(20) );

insert into xyz values(10,"aman");
insert into xyz values(11); -- error 
insert into xyz(id) values(11); -- fname ==> null 
insert into xyz(fname) values("hey");
select * from xyz;

SET SQL_SAFE_UPDATES = 0;

-- DML = DATA MANIPULATION LANGUAGE
-- INSERT 
-- update and delete are used with a condition 
-- drop =  
update xyz set fname="regex";
update xyz set fname="tushar" where id = 10;
select * from xyz;

-- delete 
delete from  xyz where id = 11;

-- ddl = data definition language =!!!!!!!!!!drop will delete everything!!!!!!!!!
drop table xyz ;

-- drop / delete / truncate what is diff

-- drop = data and str , cannot rollback to previious , 
-- delete = can rollback  
-- truncate = data delete and table delete , 
-- recreate the table structure , no rollback 


-- constraints = rules set oncolumns 
-- 
-- these rules control data that can be stores in a column 

-- not null = values can not null 
-- unique = values cannot match any older values
-- primary key = used to uniquely identify 
-- foreign key = refrences a row in another table 
-- check = validates condition for a new values
-- default = set default value if not passed 
-- create index = used to speedup the read process 

-- null 
use sakila;
create table xyz1(id int not null , fname varchar(20) );
insert into xyz1 values(1, "tushar");
insert into xyz1 values(null, "tushar");

select* from xyz1;

-- unique 
create table xyz2(id int not null , fname varchar(20) unique);
insert into xyz2 values(1, "tushar");
insert into xyz2 values(2, "tushar");

