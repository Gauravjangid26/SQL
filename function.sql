-- distinct or count
-- distinct --> gives distinct values in a column
-- count --> count Number of rows

select  distinct(first_name) from actor;
select  count(distinct(first_name)) from actor;


-- FUNCTIONS--> make block of code reusable

-- STRING FUNCTION
-- scaler functions --> 1 row --> apply -->result for each row
-- multi-row functions

select  FIRST_NAME,LOWER(first_name) from actor;
select  FIRST_NAME,lENGTH(first_name) from actor;
select  FIRST_NAME,SUBSTR(first_name,3) from actor; -- SUBSTR(COL_NAME,INDEX,TOTAL_CHARACTER)
select  FIRST_NAME,SUBSTR(first_name,3,2) from actor;
select  FIRST_NAME,SUBSTR(first_name,-2,2) from actor;
select  FIRST_NAME,INSTR(FIRST_NAME,'I') from actor;
select  FIRST_NAME,LAST_NAME,CONCAT(FIRST_NAME,' ',LAST_NAME) from actor;
select  FIRST_NAME,LAST_NAME,CONCAT_WS('-',FIRST_NAME,LAST_NAME,'$') from actor;
select  FIRST_NAME,LENGTH(TRIM('    HEY. ')) from actor; -- REMOVE ONLY STARTING AND ENDING SPACE,NOT BETWEEN
select  FIRST_NAME,LENGTH(TRIM('    HE.  Y. ')) from actor;
select  FIRST_NAME,RPAD(FIRST_NAME,5,'$') from actor;

