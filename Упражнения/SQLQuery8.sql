--Ќапишите запрос на €зыке SQL, чтобы получить им€ врача и отделени€, к которым он относитс€.
use Hospital;
select physician._name, department._name 
from physician join affiliated_with on employeeid = physician join department on departmentid = department
