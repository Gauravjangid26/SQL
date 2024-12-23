-- user ==>username
-- user management
create user ram identified by "ram123";

select current_user;
select * from mysql.user;
select * from mysql.user where user="ram";

create user shyam identified by "shyam123";
create user shyam@192.168.10.1 identified by "shyam123";
select * from mysql.user;

drop user shyam;
select * from mysql.user;

drop user shyam@192.168.10.1;
select * from mysql.user;

use sakila;

create table test(id int);
insert into test values(10),(20);
select * from test;

-- now we give privileges to ram
-- 1. grant
grant all privileges on sakila.* to ram;
flush privileges;
show grants for "ram";

-- 2. revoke
revoke all privileges on sakila from ram;

show grants for "ram";

-- giving specific privileges
alter table test add column name1 varchar(20);
grant select(id) on test to ram;
show grants for "ram";

-- locking user(block) and unlock user
alter user "ram" account lock;
alter user "ram" account unlock;

-- creating role
create role sales1;
grant select on * to sales1; # fiving access of all table of sakila

create user "shyam" identified by "shyam123";

-- grant role to user
grant sales1 to ram;
flush privileges;
show grants for ram;
set default role all to ram;
show grants for ram;

-- assignment
-- windows function 
-- difference between windows and group by
-- subquery - correlated subquery
-- rdbms,dbms,types of dbms
-- mysql vs sql
-- data type in sql
-- Normalisation