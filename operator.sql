show databases;
use sakila;
show tables;


-- operator and, or
-- between
select * from actor where actor_id between 2 and 5;

-- in
select * from actor where actor_id in (2 ,5);

-- like [%--> zero charatcer or more,_-->only one charatcer]
select * from actor where first_name like '%t';

select * from actor where first_name like 's%t';

select * from actor where first_name like 'ED';

select * from actor where first_name like '_';

select * from actor where first_name like '__';

select * from actor where first_name like '__A';

select * from actor where first_name like '_A%';

-- Q1. i need to get all details froma actor table where actor id  is 3,5,7
select * from actor where actor_id in (3,5,7);


-- Q2. i need to get all details froma actor table where actor id is either from 7 to 3
select * from actor where actor_id between 7 and 3;

-- Q3. i need to get those first name where  actor id did n't belong to 3 to 100
select first_name from actor where actor_id not between 3 and 100;

-- Q4. get me the first name of those user,whose 2 nd char is E and last is R
select first_name from actor where first_name like '_E%R';

-- Q5. get me the first name where NN can be presented any palace
select first_name from actor where first_name like'%NN%';

-- Q5. get the first name and last name where min char is 2 and last 3rd char is S in last name column
select first_name,last_name from actor where length(first_name) > 2 and last_name like '%s__';

-- Q6. get the first name  should be of 5 char and first name second char is A last char 2 is H and in middle or anywhere t
select first_name,last_name from actor where first_name like '_A%T%H__';




