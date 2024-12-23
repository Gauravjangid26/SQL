create table employees(id int primary key auto_increment, dept varchar (20), salary int);
insert into employees(dept, salary) values("hr",200),("hr", 300), ("hr", 100),("marketing",70), ("manketing", 50), ("marketing",200), ("marketing" ,400), ("marketing",200),("marketing", 600),("dsa", 150), ("dsa", 120), ("dsa", 40), ("dsa", 90), ("dsa", 500);
select * from employees;

select *,(select sum(salary) from employees)  from employees;

-- dept wise salary
select *,sum(salary) over(partition by dept) from employees;

-- running sum/cummulative sum
select *,sum(salary) over(order by salary) from employees;

-- cummulative sum department wise
select *,sum(salary) over(partition by dept order by salary) from employees;
 
 -- diff between rank,dense_rank,rank_number
 -- rank()
select *,rank() over() from employees; 

-- rank salary max=1
select *,rank() over(order by salary desc) from employees; 

-- dense_rank()
select *,rank() over(order by salary desc),dense_rank() over(order by salary desc) from employees; 

-- row _number()
select *,rank() over(order by salary desc),dense_rank() over(order by salary desc),row_number()over(order by salary desc) from employees; 


-- lead/lag
select *,lead(salary,1)over(partition by dept ) from employees;
-- for null values in lag/lead
select *,lead(salary,1,100)over(partition by dept ) from employees;

select *,rank() over(order by salary desc) as order_sal from employees
limit 1 offset 1; 
select *,rank() over(order by salary desc) as order_sal from employees
limit 2,1; 
-- can't use limit,because we have multiple same salary employees at rank 2 then it is wrong
select * from (select *,rank() over(order by salary desc) as order_sal from employees) as xyz
where order_sal=2;





