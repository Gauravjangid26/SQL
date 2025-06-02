-- how to insert update
use regex;
create table abc(id int, fname varchar(10),lname varchar(10));
select * from abc; 

-- 1. insert
create table xyz(id int, fname varchar(20));
insert into xyz values (10,'gaurav');
insert into xyz values (11,'jangid'); -- error column doesn't match value
insert into xyz(id) values (10);
select * from xyz;

-- 2. update
update xyz set fname='regex'; -- all rows are updated 
select * from xyz;
update xyz set fname='ram' where id =10;

-- 3.delete
delete from xyz where id=11;
select * from xyz;

