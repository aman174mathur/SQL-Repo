create database regex1;
use regex1;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders1;


-- cross join : no common condition 
select o.oid , o.city , o.pid , p.pname ,p.pid from  orders1 as o 
join product as p ;

-- common condition : old syntax 
select o.oid , o.city , o.pid , p.pname from  orders1 as o 
join product as p where o.pid=p.pid;

-- inner join : common columns
-- new syntax :  
select o.oid , o.city , o.pid , p.pname from  orders1 as o 
inner join product as p where o.pid=p.pid;

-- left join :
select o.oid , o.city , o.pid , p.pname from  orders1 as o 
left join product as p on o.pid=p.pid;

-- right join : 
select o.oid , o.city , o.pid , p.pname from  product as p
inner join orders1 as o where o.pid=p.pid;

