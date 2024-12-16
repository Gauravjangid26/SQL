use regex;

create table test(eid int) ;
insert into test values(200);
insert into test values(200);
insert into test values(null);
select * from test;
drop table test;

-- not null
create table test(eid int not null);
insert into test values(200);
insert into test values(200);
insert into test values(null);
select * from test;
drop table test;

-- unique
create table test(eid int unique);
insert into test values(200);
insert into test values(200);
insert into test values(null);
insert into test values(null); -- multiple null values can insert in unique because they can't comapre
select * from test;
drop table test;

--  default
create table test(eid int default 0,name varchar(20));
insert into test(eid,name) values(200,'ram');
insert into test(eid,name) values(null,'abhishek');
insert into test(name) values('abhishek2');
select * from test where eid is null; -- is operator does not comapre where = comapre ,in case of null values we use is operator
drop table test;

-- primary key(unique + not null)
create table test(eid int primary key auto_increment,name varchar(20));
insert into test(eid,name) values(200,'ram');
insert into test(eid,name) values(200,'ram');
insert into test(name) values('abhishek');
insert into test(eid,name) values(null,'ram');
insert into test(eid) values(null);
select * from test;
drop table test;

-- check 
create table test(eid int check(eid>10),name varchar(20));
insert into test(eid,name) values(200,'ram');
insert into test(eid,name) values(10,'abhishek');
select * from test;

create table test1(eid int ,name varchar(20),constraint regex_test_eid_chk check (eid>10)); -- naming to constraint because we have multiple constrain on column we can't identify in which column eerror occured
insert into test1(eid,name) values(200,'ram');
insert into test1(eid,name) values(10,'abhishek');
select * from test1;
drop table test1;

create table test2(eid int ,name varchar(20),constraint regex_test_eid_chk check (eid>10),constraint regex_name_uk unique(name)); 
insert into test2(eid,name) values(200,'ram');
insert into test2(eid,name) values(10,'abhishek');
insert into test2(eid,name) values(10,'ram');
select * from test2;



