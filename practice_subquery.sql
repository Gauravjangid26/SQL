-- get the employee no,birthdate,full name of person whose bith date is grater than birthdate among all the person belonging from employee 1003--1006departments

use employees;
show tables;
select * from employees;


select emp_no,birth_date,concat(first_name," ",last_name)
from employees
where birth_date>all(select birth_date from employees where emp_no between 10003 and 10006);

-- get the emp info whose year of hiring is same as hiring year of 10002
select * 
from employees
where hire_date=(select hire_date from employees where emp_no=10002);

-- get the empno title for those employee who are currently working on senior engineer position
select * from titles;
select * from employees;

select e.emp_no,t.title
from employees as e
join  titles as t
on e.emp_no=t.emp_no
where t.title="Senior Engineer";

-- get the employee name and birth date for a person who started working in 1986



-- get all employee info only for that emloyee who have work on 3 or more position


-- corrlated queries
