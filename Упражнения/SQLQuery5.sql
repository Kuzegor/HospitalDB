--Напишите запрос в SQL, чтобы найти слово и блок, к которому принадлежит номер комнаты 212.
--CЛОВО?
use Hospital;
select blockfloor, blockcode from room where roomnumber = 212;