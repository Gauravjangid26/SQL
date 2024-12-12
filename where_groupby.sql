-- multi row funcction
use sakila;
select * from payment;

select distinct(customer_id) from payment;
select distinct(customer_id),amount from payment;

select sum(amount),count(amount) from payment; -- missing/null  value ko count nhi krta amount waale column me
select sum(amount),count(amount),count(*) from payment;
select sum(amount),count(amount),count(*),avg(amount) from payment;

-- where clause
select sum(amount) from payment where customer_id=1;

-- groupby(jo column groupby me likhenge wahi column select me likhenge otherwise generate error
-- select distinct(customer_id),amount from payment group by customer_id;
select customer_id from payment group by customer_id;

-- aggregation function with groupby
select customer_id,sum(amount),count(*)
 from payment
 group by customer_id;
 
-- Q1. how much customer deal with staff id?
select staff_id,count(customer_id)
 from payment
 group by staff_id;
 
-- Q2. you have to find out total no of payments,total amount spend and total number of customer is served in each month
select month(payment_date),sum(amount),count(*)
 from payment
 group by month(payment_date);
 
-- where function group by ke pehle lagega,where physical data pe lagega
-- instead of where we use having(filter function) on aggregate function
select month(payment_date),sum(amount),count(*)
 from payment
 group by month(payment_date)
 having count(*)>2000;

select month(payment_date),sum(amount),count(*)
 from payment
 where customer_id>10
 group by month(payment_date)
 having count(*)>2000; 
 
select * from address;
select count(address_id) from address;
select count(address2) from address;

-- Q3. get the each district name ,the total district present and sum of city id for each district
select district,count(district),sum(city_id)
 from address
 group by district;
 
-- order by 
-- order by is used to arrange in a order(asc or desc)
select customer_id,sum(amount) as "TotalAmount"
 from payment
 group by customer_id
 order by TotalAmount;
 
 select customer_id,sum(amount) as "TotalAmount"
 from payment
 group by customer_id
 order by TotalAmount desc;

