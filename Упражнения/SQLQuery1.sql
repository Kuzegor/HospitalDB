--Ќапишите запрос в SQL, чтобы найти всю информацию о медсестрах, которые еще не зарегистрированы.
use Hospital;
select * from nurse where registered = 0;