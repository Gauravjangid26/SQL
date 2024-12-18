-- TCL(commit,rollback,savepoint) :- if you run any DML,DDL,DCL command
-- DML task/start transaction ==> transaction start
-- DDL/DCL?commit rollback ==> transaction end
set @@autocommit=0; -- it will help me to manage transaction personally not by sql
select @@autocommit;
use regex;
create table tushar(eid int);
insert into tushar values(10);
select * from tushar;
insert into tushar values(20);
select * from tushar;
commit;

insert into tushar values(30);
create table tushar1(id int);
rollback;
select * from tushar;

insert into tushar values(40);
savepoint tushar_insert;
create table tushar1(id int);
delete from tushar where eid=10;
select * from tushar;
rollback to tushar_insert;
select * from tushar;
