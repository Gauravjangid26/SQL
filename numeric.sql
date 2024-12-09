-- numeric function
# round,truncate,floor,mod,pow,ceil


-- 1.round
use sakila;
select round(12.456) from dual;
select round(12.456,1) from dual;
select round(12.456,2) from dual; -- decimal me roundoff hoga toh next value check krenge
select round(17.456,-1) from dual;-- number ko krenge toh current ko krenge
select round(12.456,-2) from dual;
select round(12.520,1) from dual;


-- 2. truncate
select truncate(879.123,3) from dual;


-- 3. floor
select floor(10.9999) ,ceil(10.00001) from dual;

select count(first_name)- count(distinct(first_name))from actor;
select city from actor where max(char_length(first_name));