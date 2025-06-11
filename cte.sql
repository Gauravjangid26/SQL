use sakila;

with data as 
(select * from actor where actor_id between 2 and 5
order by actor_id desc)

select * from data;

-- avg amount of each customer

with avg_payment as
(select customer_id,avg(amount) as average from payment group by customer_id)

select *
from payment as p
inner join avg_payment as av
on av.customer_id=p.customer_id
where amount>average ;


--
select * from actor;
select * from film;
select * from film_actor;

with cte as
(select a.actor_id,a.first_name,fa.film_id from actor as a 
inner join film_actor as fa
where fa.actor_id=a.actor_id)

select cte.actor_id,cte.first_name,cte.film_id,f.title
from film as f
inner join cte 
on cte.film_id=f.film_id;

-- recursive cte
WITH  recursive CTE as
(select 1 as id
union 
select id +1 from cte where id<5)

select id+1 from cte;


-- i need to get employee name manger name. 

use employees;
with recursive cte as
(select e.id,e.name,e.manager_id from employees as e where e.manager_id=null
union
)

