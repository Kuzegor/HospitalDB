--Ќапишите запрос на SQL, чтобы получить имена врачей, которые €вл€ютс€ руководител€ми каждого отдела.
use Hospital;
select physician._name from physician join department on employeeid = head where employeeid = head;