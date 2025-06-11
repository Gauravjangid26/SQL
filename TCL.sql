-- transaction control lamguage -->set of logical query on database if this crud operation permanently save then iot is called tcl
-- crud --> database transaction---> save/discard-->tcl

-- all transaction is saved in database
select @@autocommit;
set @@autocommit=0;
select @@autocommit;

use regex;
create table abc11(id int);
insert into abc11 values(1);
select * from abc11;
commit;-- save into my database

-- transaction start:DML,start transaction 
-- end: commit,rollback,DDL,DCL

insert into abc11 values(12);
select * from abc11;
update abc11 set id=1;

rollback;
select * from abc11;

-- save points
insert into abc11 values(12);
insert into abc11 values(13);
savepoint test_check_point;
insert into abc11 values(14);

rollback to test_check_point;

select * from abc11;

--
start transaction;
update abc11 set id=1;
rollback;
select * from abc11;