-- multi row query "in any all" operator
-- in

use sakila;
select * from payment
where
amount in (select amount from payment
 where payment_id in (1,3));
 
 -- > any greater than min values of subquery,
 
select * from payment
where
amount < any (select amount from payment
 where payment_id in (1,3));
 
select * from payment
where
amount >= any (select amount from payment
 where payment_id in (1,3));
 
 -- > greater than all max values of subquery,
 
select * from payment
where
amount >= all (select amount from payment
 where payment_id in (1,3));
 
select * from payment
where
amount <= all (select amount from payment
 where payment_id in (1,3));
 
 -- ex
 select count(*) from payment
where
amount < all (select amount from payment
 where payment_id in (1,3));
 
 
 --

 