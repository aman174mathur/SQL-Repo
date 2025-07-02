use regex;

create table xyz(id int , name varchar(20));

insert into xyz value(10, "tushar"), (20, "ashika"), (30,"omi"), (40, "ishan"), (50, "tushar"), (60, "ujjwal"), (70, "tushar");


explain select * from xyz ;

-- time taking
explain	 select * from xyz where name = "tushar";

-- indexing = mechanism try to acess data faster 
DROP TABLE XYZ;


create table xyz(id int primary key  , name varchar(20));
insert into xyz value(10, "tushar"), (20, "ashika"), (30,"omi"), (40, "ishan"), (50, "tushar"), (60, "ujjwal"), (70, "tushar");


select * from xyz;

explain	 select * from xyz where name = "tushar";
explain	 select * from xyz where  id  = 10; 


-- non - clustered index 
create index index_name on xyz(name);
explain	select * from xyz where name = "ujjwal";

drop index index_name on xyz;
drop index index_x on xyz;

create index  index_name on xyz(id , name);

show indexes from xyz;

explain select * from xyz where id = 10;
explain	select * from xyz where id =10 and name = "tushar";                                                                                                                                                                                           




