select now() from dual;
select month(now()) from dual;
select datediff(now(),2024-10-2) from dual ;

select date_format(now(),"%a") from dual;
select date_format(now(),"current day %a") from dual;
select date_format(now(),"current month %M") from dual;
select date_format(now(),"current month %m") from dual;
select date_format(now(),"current day %a %M") from dual;
select date_format(now(),"current day %h %a %m") from dual;