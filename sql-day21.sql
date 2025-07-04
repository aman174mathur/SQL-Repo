use sakila;
-- DCL (PERMISSIONS DEFINE ,   TABLE , )

-- permission

-- AUTHORISATION ??
-- AUTHENTICATION ?? 

-- MAKE A USER :
-- SYNTAX: 
-- CREATE USER USERNAME IDENTIFIED BY 'PASSWORD'
-- USER DOES NOT HAVE ANY ACESS TO DATABASES BY DEFAULT 
-- SUBNETTING 


CREATE USER RAJ; -- USER WITHOUT PASS
CREATE USER ISHA IDENTIFIED BY 'ISHA123'; -- USER WITH PASS 
CREATE USER ISHA@17.103.11% IDENTIFIED BY 'ISHA123'; -- USER WITH IP LOCKED 

SELECT current_user();
-- IN BULIT TABLE FOR USERS  INFORMATION 
-- DATA DICTIONARY: 
-- SELECT * FROM MYSQL.USER

SELECT * FROM MYSQL.USER;
SELECT * FROM MYSQL.USER WHERE USER='ISHA';


USE SAKILA;
CREATE TABLE SAKILA.TEST991(ID INT);
INSERT INTO SAKILA.TEST991 VALUES(10),(20);

SELECT * FROM SAKILA.TEST991;

-- HOW TO GIVE ACESS TO USER :
-- GRANT : GIVE PERMISSION 
-- ALL PERMISSIONS: TO ISHA USER 
GRANT ALL privileges ON SAKILA.TEST991 TO ISHA;

-- PERMISSION OF "ALL THE TABLES " OF SAKILA
GRANT ALL privileges ON SAKILA.* TO ISHA;

-- TO CHECK USER GRANTS FOR ISHA USER 
SHOW GRANTS FOR ISHA;

-- GIVING "SELECT"  PRIVLEGE FROM SAKILA.ACTOR TO ISHA
GRANT SELECT ON SAKILA.ACTOR TO ISHA;
-- GIVING "INSERT "  PRIVLEGE FROM SAKILA.ACTOR TO ISHA
GRANT INSERT ON SAKILA.TEST991 TO ISHA;

GRANT SELECT(ACTOR_ID , FIRST_NAME) ON SAKILA.ACTOR TO 'ISHA';
-- REVOKE PRIVLEGE : TO REMOVE PERMISSION FROM A USER 
REVOKE ALL privileges ON SAKILA.TEST991 FROM ISHA;

-- REVOKING THE INSERT PERMISSION FROM ISHA USER :
REVOKE INSERT ON SAKILA.TEST991 FROM  ISHA;
REVOKE SELECT(ACTOR_ID , FIRST_NAME) ON SAKILA.ACTOR FROM 'ISHA';

-- TO CHANGE USER PASSWORD 
-- NOW USER ISHA USER'S PASS WORD IS REGEX
ALTER USER 'ISHA' IDENTIFIED BY 'REGEX';
				
			