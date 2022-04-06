--Ќапишите запрос в SQL, чтобы получить имена врачей с отделени€ми, которые еще не св€заны.
use Hospital;
select physician._name, department._name 
from physician join affiliated_with on employeeid = physician join department on departmentid = department 
where primaryaffiliation = 0;