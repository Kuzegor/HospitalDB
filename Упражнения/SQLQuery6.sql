--Напишите запрос в SQL для подсчета количества доступных комнат. 
use Hospital;
select count(unavailable) from room where unavailable = 0;