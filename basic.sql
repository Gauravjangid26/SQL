show databases;
use sakila;
select * from actor;
-- concat,substr,instr,lpad,trim

select first_name,substr(first_name,-4,2) from actor; -- char return krega from a char to other
select first_name,instr(first_name,"L") from actor; -- index dega l char kaha h
select first_name,char_length(first_name) from actor;


-- dummy (dual)
select 10+2 from dual;
select 10+2 from actor;

-- trim() is used to remove whitespace from start and end
select "  hello   " from dual;
select trim("  hello   ") from dual;
select char_length(trim("  hello   ")) from dual;
select trim("  hel lo   ") from dual;
select trim(trailing " " from "  hello   ") from dual;
-- ltrim rtrim only remove whitespace
select ltrim("  hello   " )from dual;


-- lpad,rpad(pad= jod dena,lpad =left me koi char add krna)
select first_name,lpad(first_name,6,"#") from actor;




