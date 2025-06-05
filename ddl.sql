-- constraints -->set of rules


-- 1. not null or unique
create table abc1 (id int not null,name varchar(20) unique );
insert into abc1 values (1,'tushar');
insert into abc1 values (1,'tushar');
insert into abc1 values (1,'rma');
insert into abc1 values (null,'rma');

select * from abc1;

-- 2 default
create table abc2 (id int not null,name varchar(20) default'regex' );
insert into abc2 values (1,'tushar');
insert into abc2(id) values (2);

select * from abc2;

create table abc3 (dob datetime default now()  );
insert into abc3 values ('2024/12/2');
insert into abc3() values ();

select * from abc3;

-- 3 primary key(not null+unique)
create table abc4 (id int primary key );
insert into abc4 values (1);
insert into abc4 values (1);
insert into abc4 values (null);
insert into abc4() values ();

select * from abc4;

-- 4 foreign key
CREATE TABLE admission (
    admission_id INT PRIMARY KEY
);
INSERT INTO admission VALUES (1);
INSERT INTO admission VALUES (2);

CREATE TABLE student (
    student_name VARCHAR(100),
    admission_id INT,
    FOREIGN KEY (admission_id) REFERENCES admission(admission_id)
);
INSERT INTO student (student_name, admission_id) VALUES ('Alice', 1);
INSERT INTO student (student_name, admission_id) VALUES ('Bob', 2);

-- ❌ Fails if admission_id 3 doesn't exist
INSERT INTO student (student_name, admission_id) VALUES ('Charlie', 3);
SELECT * FROM admission;
SELECT * FROM student;

-- only copy constraints are not copied
use sakila;
create  table abc1 as
 select actor_id,first_name from actor;
 
 select * from abc1;
 delete from abc1 where actor_id=(
	select actor_id from actor where first_name='PENELOPE');


