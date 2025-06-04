-- transaction control language (TCL) 
-- TRANSACTION STATEMENTS = SET OF SQL STATEMENTS 
-- TRANS CAN BE  STARTED  = DML COMMAND , START TRANSACTION 
-- TRANS CAN BE ENDED  = COMMIT , ROLLBACK , DDL COMMAND , DCL COMMAND




USE SAKILA;
-- HANDLE LOGICAL STATEMENTS OR REMOVE THEM 

-- AUTO COMMIT 
select @@autocommit; -- SAVE TRANSACTIONS PERMANENTLY 
-- TO DISABLE IT 
SET @@autocommit=0;

-- 
CREATE DATABASE TUSHAR ;
USE TUSHAR ;
CREATE TABLE TEST (ID INT);
INSERT INTO TEST VALUES(2) ,(3) , (4) ;
COMMIT ; -- SAVE THE WORK INTO MY DATABASE 
select * FROM TEST ;


INSERT INTO TEST VALUES(500) ;
commit;
update test set id = 99;
rollback; -- to revert back 
select * from test;

insert into test values(600);
create table y1(a int);
rollback;
select * from test;


select * from test;
commit;
insert into test values (90) ,(91);
delete from test where id =1;

savepoint test_chpoint; -- this is a checkpoint 

update test set id = 10000;
rollback to test_chpoint;  -- this is rollback upto that specific savepoint 
select * from test;
commit;

set @@autocommit =1 ;
SET @@autocommit=0;


start transaction; -- The START TRANSACTION (or BEGIN) command is used to start a new transaction. 
-- It marks the beginning of a sequence of SQL statements that should be executed together as a single un
UPDATE TEST SET ID=10000;
rollback;
select * from test;

-- "VIEWS" : A View in SQL is a virtual table based on the result of an SQL SELECT query.
-- It does not store data physically, but shows data from one or more real tables.

-- makes complex query easy 
-- database ( no data is store) 
-- virtual table stores the query of the base table 
-- define data acessibility 

use tushar;
create table t_actor as 
select * from sakila.actor limit 20;

select * from t_actor;

-- id and firstname from base table 
create view actor_view1 as select actor_id , first_name from t_actor;
select * from actor_view1;


-- all the data from base table 
create view actor_view as select * from t_actor;
select * from actor_view;

-- this query is affecting on base table , this is a simple view 
delete from actor_view where actor_id =1;

-- create a new view using any aggregate function 
CREATE VIEW actor_name_count AS
SELECT first_name, COUNT(*) AS name_count
FROM t_actor
GROUP BY first_name;

delete from actor_name_count where first_name = "NICK"; -- error (non - updatable view)

select * from actor_name_count;

