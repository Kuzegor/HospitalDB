--Ќапишите запрос в SQL, чтобы подсчитать количество пациентов, прошедших прием хот€ бы у одного врача.
use Hospital;
select count(distinct patient) from appointment;