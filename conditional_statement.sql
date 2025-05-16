-- if(cond,true,false)
-- if(cond,true,if(cond,true,false)) nested conditional block

select first_name,actor_id,
if(first_name='nick','yes',if(first_name='ed','yes','no')) 
from actor;


-- Q1. agar mera actorid if even then first name and last name else concat woth $
select first_name,actor_id,
if(actor_id%2=0,concat(first_name," ",last_name),concat(first_name," ",last_name,"$")) 
from actor;


-- case
select first_name,actor_id,
case
	when mod(actor_id,2)=0 then 'yes'
    when actor_id=5 then '##no$$'
	else 'NO'
end
from actor;
