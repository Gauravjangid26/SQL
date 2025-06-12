-- dcl
create user isha identified by 'isha123';
select current_user();

-- my sql inbuilt table -- data dictionary

select * from mysql.user;
select * from mysql.user where user='isha'; 

use sakila;
create table sakila.test1(id int);
insert into sakila.test1 values(1),(2);
select * from sakila.test1;

-- grant/revoke --> to give permission

grant all privileges on sakila.test1 to isha;
show grants for isha;

grant select on sakila.actor to isha;
show grants for isha;

revoke all privileges on sakila.test1 from isha ;
revoke select on sakila.actor from isha ;
show grants for isha;

grant q on sakila.actor to 'isha';
show grants for isha;

-- alter
alter user 'isha' identified by 'regex';

-- set password
set password for isha ='12345678'

-- you have to create a table user_data,it has two column id,name ,you have two insert 2 rows
-- you have enter a new column email
-- make id column as primary key(after createing table change constraint )alter
-- emial should be unique
-- create a new column phone no of varchar data type
-- insert the record abc in phone no
-- change the data type of the phone number to int
-- now change the column name from phone number to phone
-- dump file
-- create roles in dcl