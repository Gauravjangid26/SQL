-- dual table
select 3*4 from dual;

--  date time
select sysdate(),curdate(),curtime(),current_timestamp(),now() from dual;
select now(),now()+2 from dual;
select now(),adddate(now(),2) from dual;
select now(),adddate(now(),interval 2 month) from dual;
select now(),adddate(now(),interval 2 week) from dual;
select datediff(now(),adddate(now(),interval 2 week)) from dual;
select datediff(now(),'2025-05-30 17:20:23') from dual;

select last_day(now()) from dual;
select month(now()),year(now()) from dual;

select extract(year from(now())) from dual;
select extract(minute from(now())) from dual;


-- date format
select now(),date_format(now(),'this year is %Y') from dual; -- %y is access modifier scaler

-- date and string both are scaler function

