--�������� ������ �� ����� SQL, ����� �������� ��� ����� � ���������, � ������� �� ���������.
use Hospital;
select physician._name, department._name 
from physician join affiliated_with on employeeid = physician join department on departmentid = department
