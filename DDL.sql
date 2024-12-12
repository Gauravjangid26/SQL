-- ddl statement
-- 1.int
create database regex;
use regex;
create table xyz(id int);
insert into xyz values(20);
insert into xyz values(2147483647);
-- insert into xyz values(2147483648); bcoz it is signed int range is lie between -2147483648 to 2147483647,unsigned me signed ki double ho jayegi ,bcoz it has positive values allow
select * from xyz;


-- tinyint=1byte,smallint=2byte,mediumint=3byte,int=4 byte,bigint=8byte

-- 2.double,float
create table abc(salary double(5,2));-- total 5 number including decimal in which 2 are allowed in decimal so 3 number before decimal is allowed else error occured of out of range
insert into abc values(20.1);
insert into abc values(20.14342);
insert into abc values(3420.1);
select * from abc;


-- 3.boolean(it is basically a tinyint)
create table test_bool(i bool);
insert into test_bool values(True),(False),(1);
select * from test_bool;

-- 4. char it is data type which is fixed in size,it truncate the trailing spaces(remove upto the size of char)
create table char_table(name char(4));
insert into char_table values(20.1);
insert into char_table values("zz");
insert into char_table values("zz. ");
insert into char_table values("zz k");
select name,length(name) from char_table;

-- 5. varchar variable length char
create table char_table1(name varchar(3));
insert into char_table1 values("zz");
insert into char_table1 values("zz     ");-- does not include these bcoz it only read till threee char including whitespaces and remove whitespace till does no go upto lenth of char
insert into char_table1 values("zz k");
select name,length(name) from char_table1;

-- 6. date(yyyy-MM-dd hh:mm:ss)
create table date_table(dob date);
insert into date_table values("2024-12-07"); -- implicit time casting string-->time 
select * from date_table;

-- conditional statement? true false
use sakila;
select * from actor;
select first_name,if(first_name="NICK",0,1)-- only if statement
from actor;

select first_name,if(first_name="NICK",0,if(first_name="ED",2,"not value")) -- nested if
from actor;

select first_name,
 case
 when first_name="NICK" then 0   -- insted of if use when then
 when first_name="ED" then 1
 else "no value"
 end as "newcol"

from actor;

-- questtion -> get the paymentid,customerid,amount,month of payment date and quarter of paument date with folllowing increment
-- a , if amount is more than 2$ increase amount by 10%
-- b , if amount is more than 5$ increase amount by 25%
-- c , if amount is more than 10$ increase amount by 50%
-- d , otherwise  5%

select * from payment;
select payment_id,customer_id,month(payment_date),
case
    WHEN month(payment_date) BETWEEN 1 AND 3 THEN 1
    WHEN month(payment_date) BETWEEN 4 AND 6 THEN 2
    WHEN month(payment_date) BETWEEN 7 AND 9 THEN 3
    WHEN month(payment_date) BETWEEN 10 AND 12 THEN 4
  end as quarter,
  case
	when amount between 2 and 5 then amount*1.1
    when amount between 5 and 10 then amount*1.25
    when amount >10 then amount*1.5
    else amount*1.05
    end as amount
  
  from payment
  
  


-- what is order of execution in sql
-- primary key, foreign key,superkey,candidate
-- types of relationship
-- what are correlated query
