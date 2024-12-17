use sakila;
select * from payment;
-- Q1 find out second heighest amount
-- A. subquery
select max(amount) from payment
where amount<(select max(amount) from payment);

-- B. ASC
select amount from payment
group by amount 
order by amount desc
LIMIT 1 OFFSET 1 ;