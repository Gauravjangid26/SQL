-- DDL==> data definiton language
-- create ,drop,truncate,alter,

-- 1. create
create table test3(id int,name1 varchar(20));
insert into test3 values(20,"ram"); -- insert DML OPRn
insert into test3(name1) values("ram");
select * from test3;

-- update
update test3 set name1="xyz" where id=20;
select * from test3;

-- delete
delete from test3 where id is null;
select * from test3;

-- 2.drop
drop table test3; -- table schema also delete. with data

-- 3.truncate
truncate test3; -- this will firstly delete schema and data and then recreate schema of table
select * from test3;

-- 4. alter
use regex;
create table companies(id int);
insert into companies values(20);
select * from companies;

-- add column
alter table companies
add column phone varchar(12);
select *from  companies;

alter table companies
add column  name varchar(12)  not null;
select *from  companies;

-- drop column
alter table companies
drop column phone;
select *from  companies;

-- rename table
rename table companies to newcompany1;
select * from companies;
select * from newcompany1;

alter table newcompany1 rename to companies;
select * from companies;

-- rename columns
alter table companies rename column id  to sno;
select * from companies;

-- add primary key
alter table companies add primary key(sno);

-- add constraint and nickname of unique
alter table companies
add constraint regex_company_uk unique(company_name);

-- change data type
desc companies;
alter table companies modify sno double;
desc companies;

-- change data type and name concurrently
alter table companies
change sno id varchar(5);
desc companies;


-- Q1 difference between drop,delete,truncate?
-- delete is DML operation in which we give where we give condition,undo/roll back option is available.
-- drop is DDl operation in which table schema and data both are removed,roll back option is not available.
-- truncate is DDL operation in which first drop table schema and data then reconstruct schema of table,roll back option is not available.
