-- order by,alias,multi rows function

-- order by 
select * from actor order by first_name,actor_id desc; 

-- alias
select actor_id,actor_id+10 as 'newactor'  from actor; 

-- multi-rows function---> sum,count,max,min,avg
select * from payment;
select distinct(customer_id) from payment;
-- unique data
select count(customer_id) from payment;

-- unique customer
select count(customer_id) ,count(distinct(customer_id)) from payment;
select count(customer_id) as total,
count(distinct(customer_id)) as unique_customer,
count(customer_id)-count(distinct(customer_id)) as 'repetitive'
from payment;

-- aggregate function are funtion that are used to perform calculation over certain values return a single value,count add null value,other ignore the vale
select count(amount) ,sum(amount),avg(amount),max(amount),min(amount) from payment;

select count(customer_id),customer_id as total; -- normal coulmn canot select with aggregate function


-- groupby-->make group of similar values
select customer_id,count(customer_id) from payment
group by customer_id;

select customer_id,count(customer_id),sum(amount),avg(amount),min(amount),max(amount) from payment
group by customer_id;

-- Q1. find out each amount ka count
select amount,count(amount) from payment
group by amount;

-- Q2. find out the total payment rented the sum of amount and the maximum rental id for each staff
select staff_id,count(rental_id),max(amount),sum(amount) from payment
group by staff_id;

-- Q3. get the total number of customer serve with max and min rental id with avg amount spended for each month of payment day
select extract(month from(payment_date))as months,avg(amount),max(rental_id),min(rental_id) from payment
group by months;