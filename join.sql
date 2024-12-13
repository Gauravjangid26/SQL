-- what is order of execution in sql
-- primary key, foreign key,superkey,candidate
-- types of relationship
-- what are correlated query
use regex;
drop table product;

create table product(pid int,pname varchar(20),price int);
insert into product values(10,"tv",100),(20,"mobile",200),(30,"geyser",400),(40,"ram",500);
select * from product;

create table orders(oid int,city varchar(20),product_id int);
insert into orders values(1991,"jaipur",10),(1992,"goa",20),
(1993,"UK",10),(1994,"shimla",40),(1995,"kerala",80);
select * from orders;

-- cross join and cartesian join :-, meaning every row from the first table is combined with every row from the second table.,A Cross Join generates all possible combinations of rows from two tables.
-- Total Rows=(Rows in Table 1)×(Rows in Table 2)

select o.oid,o.city,o.product_id,p.pid,p.pname,p.price
from orders as o
join product as p;

-- inner join--> intersection

select o.oid,o.city,o.product_id,p.pid,p.pname,p.price
from orders as o
join product as p
where o.product_id=p.pid;

select o.oid,o.city,o.product_id,p.pid,p.pname,p.price
from orders as o
inner join product as p
on o.product_id=p.pid;

-- join--> left join and right join
-- 1.left join

select o.oid,o.city,o.product_id,p.pid,p.pname,p.price
from orders as o
left join product as p
on o.product_id=p.pid;

-- 2.right join

select o.oid,o.city,o.product_id,p.pid,p.pname,p.price
from orders as o
right join product as p
on o.product_id=p.pid;


-- exercise
use sakila;
select * from actor;
select * from film_actor;

-- Q1 get the actor id and full name of actor,the film id,last update column from these two table

select a.actor_id,concat(a.first_name," ", a.last_name) as full_name,f.film_id,f.last_update
from actor as a
inner join film_actor as f
on a.actor_id=f.actor_id;

-- what is self join and how it is different from outer join
-- what are constraint and why we use it
-- what is the difference between join and set oprn 
