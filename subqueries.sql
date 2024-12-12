-- subqueries (nested query)
-- result of one query depend on ther query
-- single row query
use sakila;

select * from payment;

select amount from payment
where payment_id=3;

select * 
from payment
where amount=(select amount 
from payment
 where payment_id=3);

-- Q1 get the payment id staff id rental id and amount only for that payment where rental id is greater than rental id of payment  4
select distinct(rental_id )
from (payment)
where payment_id=4;

select payment_id,staff_id,rental_id,amount 
from payment
where rental_id>(select distinct(rental_id )
from (payment)
where payment_id=4);

-- Q2 get the payment_id,amount, the 10% increase in amount for those payment where month of payment date is equal to payment id for 5
select month(payment_date)
from payment
where payment_id=5;

select payment_id,amount*1.1 from payment 
where month(payment_date)=
(select month(payment_date) from payment
where payment_id=5);

-- Q3 get the customer_id and total no of payment done by each customer only for those whose total no of payment should be greater than the total no of payment done by customer_id 2
select count(amount) from payment
where customer_id=2;

select  customer_id,count(amount) from payment
group by customer_id
having count(amount)>(select count(amount) from payment
where customer_id=2);
-- multi row query "in any all" operator
-- what is correlated subquey

