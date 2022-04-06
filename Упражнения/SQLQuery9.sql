--Напишите запрос на языке SQL, чтобы получить имена врачей, прошедших специальную подготовку.
use Hospital;
select distinct(_name) from physician join trained_in on employeeid = physician