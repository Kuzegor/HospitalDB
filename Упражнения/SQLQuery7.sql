--Напишите запрос в SQL для подсчета количества недоступных комнат. 
use Hospital;
select count(unavailable) from room where unavailable = 1;