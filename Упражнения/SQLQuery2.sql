--Ќапишите запрос в SQL, чтобы найти им€ медсестры, котора€ €вл€етс€ главой их отдела.
use Hospital;
select _name from nurse where position = 'Head Nurse';