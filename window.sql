use sakila;
select avg(amount) from payment;
select customer_id,(select avg(amount) from payment) from payment;

-- over()
select payment_id,customer_id,sum(amount)over(),avg(amount)over() from payment;

-- partition by-> separate the data according to column data
select payment_id,customer_id,sum(amount)over(partition by customer_id),avg(amount)over(partition by customer_id) from payment;

-- runing sum-> when column in order by is primary key
select payment_id,amount,customer_id,sum(amount)over(order by payment_id) from payment;
select payment_id,customer_id,sum(amount)over(partition by customer_id order by payment_id) from payment;

-- questions
use employees;
select * from salaries;

-- get emp_no,salary,from_date along with avg salry of that emoployee from salary table
select  emp_no,salary,from_date,avg(salary)over(partition by emp_no) from salaries;

-- get  emp_no,salary and running salary for each customer from the salary table
select  emp_no,salary,from_date,avg(salary)over(partition by emp_no order by from_date) from salaries;

use sakila;
select * from payment;


-- rank() and dense_rank()
select payment_id,customer_id,amount,rank() over (partition by customer_id order by amount desc),dense_rank() over (partition by customer_id order by amount desc) from payment;

-- find out customer whose rank is 3

select * from (select payment_id,customer_id,amount,dense_rank() over (partition by customer_id order by amount desc) as d_rank from payment) as ranked
where d_rank=3;
