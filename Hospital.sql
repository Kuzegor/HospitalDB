create database Hospital;

----------------TABLES
create table physician(
employeeid int primary key,
_name varchar(60),
position varchar(60),
ssn int)

create table department(
departmentid int primary key,
_name varchar(60),
head int)

create table affiliated_with(
physician int,
department int,
primaryaffiliation bit,
primary key(physician,department))

create table _procedure(
code int primary key,
_name varchar(60),
cost real)

create table trained_in(
physician int,
treatment int,
certificationdate date,
certificationexpires date,
primary key(physician, treatment))

create table patient(
ssn int primary key,
_name varchar(60),
_address varchar(60),
phone varchar(60),
insuranceid int,
pcp int)

create table nurse(
employeeid int primary key,
_name varchar(60),
position varchar(60),
registered bit,
ssn int)

create table appointment(
appointmentid int primary key,
patient int,
prepnurse int,
physician int,
start_dt_time datetime,
end_dt_time datetime,
examinationroom varchar(60))

create table medication(
code int primary key,
_name varchar(60),
brand varchar(60),
_description varchar(60))

create table prescribes(
physician int,
patient int,
medication int,
_date datetime,
appointment int,
dose varchar(60),
primary key(physician, patient, medication, _date))

create table _block(
blockfloor int,
blockcode int,
primary key(blockfloor,blockcode))

create table room(
roomnumber int primary key,
roomtype varchar(60),
blockfloor int,
blockcode int,
unavaiable bit)

create table on_call(
nurse int,
blockfloor int,
blockcode int,
oncallstart datetime,
oncallend datetime,
primary key(nurse,blockfloor,blockcode,oncallstart,oncallend))

create table stay(
stayid int primary key,
patient int,
room int,
start_time datetime,
end_time datetime)

create table undergoes(
patient int,
_procedure int,
stay int,
_date datetime,
physician int,
assistingnurse int,
primary key(patient,_procedure,stay,_date))

--------------FOREIGN KEYS
alter table affiliated_with
add foreign key(physician) references physician(employeeid);
alter table affiliated_with
add foreign key(department) references department(departmentid);

alter table department
add foreign key(head) references physician(employeeid);

alter table prescribes
add foreign key(physician) references physician(employeeid);
alter table prescribes
add foreign key(patient) references patient(ssn);
alter table prescribes
add foreign key(medication) references medication(code);
alter table prescribes
add foreign key(appointment) references appointment(appointmentid);

alter table trained_in
add foreign key(physician) references physician(employeeid);
alter table trained_in
add foreign key(treatment) references _procedure(code);

alter table patient
add foreign key(pcp) references physician(employeeid);

alter table room
add foreign key(blockfloor, blockcode) references _block(blockfloor, blockcode);

alter table undergoes 
add foreign key(patient) references patient(ssn);
alter table undergoes
add foreign key(_procedure) references _procedure(code);
alter table undergoes 
add foreign key(stay) references stay(stayid);
alter table undergoes
add foreign key(physician) references physician(employeeid);
alter table undergoes
add foreign key(assistingnurse) references nurse(employeeid);

alter table appointment
add foreign key(patient) references patient(ssn);
alter table appointment
add foreign key(prepnurse) references nurse(employeeid);
alter table appointment
add foreign key(physician) references physician(employeeid);

alter table stay
add foreign key(patient) references patient(ssn);
alter table stay
add foreign key(room) references room(roomnumber);

alter table on_call
add foreign key(nurse) references nurse(employeeid);
alter table on_call
add foreign key(blockfloor, blockcode) references _block(blockfloor, blockcode);

-----------------VALUES
insert into nurse values
(101 ,'Carla Espinosa','Head Nurse',1,111111110),
(102,'Laverne Roberts','Nurse',1,222222220),
(103,'Paul Flowers','Nurse',0,333333330);

insert into physician values
(1,'John Dorian ','Staff Internist ',111111111),
(2,'Elliot Reid ','Attending Physician',222222222),
(3,'Christopher Turk','Surgical Attending Physician',333333333),
(4,'Percival Cox ','Senior Attending Physician  ',444444444),
(5,'Bob Kelso ','Head Chief of Medicine',555555555),
(6,'Todd Quinlan','Surgical Attending Physician',666666666),
(7,'John Wen ','Surgical Attending Physician ',777777777),
(8,'Keith Dudemeister','MD Resident ',888888888),
(9,'Molly Clock ','Attending Psychiatrist ',999999999);

insert into department values
(1,'General Medicine',4),(2,'Surgery',7),(3,'Psychiatry',9);

insert into _block values
(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),
(3,1),(3,2),(3,3),(4,1),(4,2),(4,3);

insert into room values
(101,'Single',1,1,0),(201,'Single',2,1,0),(301,'Single',3,1,0),
(102,'Single',1,1,0),(202,'Single',2,1,0),(302,'Single',3,1,0),
(103,'Single',1,1,0),(203,'Single',2,1,0),(303,'Single',3,1,0),
(111,'Single',1,2,0),(211,'Single',2,2,0),(311,'Single',3,2,0),
(112,'Single',1,2,1),(212,'Single',2,2,1),(312,'Single',3,2,1),
(113,'Single',1,2,0),(213,'Single',2,2,0),(313,'Single',3,2,0),
(121,'Single',1,3,0),(221,'Single',2,3,0),(321,'Single',3,3,0),
(122,'Single',1,3,0),(222,'Single',2,3,0),(322,'Single',3,3,0),
(123,'Single',1,3,0),(223,'Single',2,3,0),(323,'Single',3,3,0),
(401,'Single',4,1,0),(411,'Single',4,2,0),(421,'Single',4,3,0),
(402,'Single',4,1,0),(412,'Single',4,2,1),(422,'Single',4,3,0),
(403,'Single',4,1,0),(413,'Single',4,2,0),(423,'Single',4,3,0);

insert into affiliated_with values
(1,1,1),(2,1,1),(3,1,0),(3,2,1),
(4,1,1),(5,1,1),(6,2,1),
(7,1,0),(7,2,1),(8,1,1),(9,3,1);

insert into _procedure values
(1,'Reverse Rhinopodoplasty',1500),
(2,'Obtuse Pyloric Recombobulation',3750),
(3,'Folded Demiophtalmectomy ',4500),
(4,'Complete Walletectomy',10000),
(5,'Obfuscated Dermogastrotomy',4899),
(6,'Reversible Pancreomyoplasty',5600),
(7,'Follicular Demiectomy',25);

insert into trained_in values
(3,1,'2008-01-01','2008-12-31'),
(3,2,'2008-01-01','2008-12-31'),
(3,5,'2008-01-01','2008-12-31'),
(3,6,'2008-01-01','2008-12-31'),
(3,7,'2008-01-01','2008-12-31'),
(6,2,'2008-01-01','2008-12-31'),
(6,5,'2007-01-01','2007-12-31'),
(6,6,'2008-01-01','2008-12-31'),
(7,1,'2008-01-01','2008-12-31'),
(7,2,'2008-01-01','2008-12-31'),
(7,3,'2008-01-01','2008-12-31'),
(7,4,'2008-01-01','2008-12-31'),
(7,5,'2008-01-01','2008-12-31'),
(7,6,'2008-01-01','2008-12-31'),
(7,7,'2008-01-01','2008-12-31');

insert into patient values
(100000001 ,'John Smith','42 Foobar Lane','555-0256',68476213 ,1),
(100000002 ,'Grace Ritchie','37 Snafu Drive','555-0512',36546321 ,2),
(100000003 ,'Random J. Patient','101 Omgbbq Street','555-1204',65465421 ,2),
(100000004 ,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879 ,3);

insert into appointment values
(13216584 ,100000001 ,101,1,'2008-04-24 10:00:00','2008-04-24 11:00:00','A'),
(26548913 ,100000002 ,101,2,'2008-04-24 10:00:00','2008-04-24 11:00:00','B'),
(36549879 ,100000001 ,102,1,'2008-04-25 10:00:00 ','2008-04-25 11:00:00','A'),
(46846589 ,100000004 ,103,4,'2008-04-25 10:00:00','2008-04-25 11:00:00','B'),
(59871321 ,100000004 ,null,4,'2008-04-26 10:00:00','2008-04-26 11:00:00','C'),
(69879231 ,100000003 ,103,2,'2008-04-26 11:00:00','2008-04-26 12:00:00','C'),
(76983231 ,100000001 ,null,3,'2008-04-26 12:00:00','2008-04-26 13:00:00','C'),
(86213939 ,100000004 ,102,9,'2008-04-27 10:00:00','2008-04-21 11:00:00','A'),
(93216548 ,100000002 ,101,2,'2008-04-27 10:00:00','2008-04-27 11:00:00','B');

insert into medication values
(1,'Procrastin-X','X','N/A'),
(2,'Thesisin','Foo Labs','N/A'),
(3,'Awakin','Bar Laboratories','N/A'),
(4,'Crescavitin','Baz Industries','N/A'),
(5,'Melioraurin','Snafu Pharmaceuticals','N/A');

insert into prescribes values
(1,100000001 ,1,'2008-04-24 10:47:00',13216584 ,'5'),
(9,100000004 ,2,'2008-04-27 10:53:00',86213939 ,'10'),
(9,100000004 ,2,'2008-04-30 10:53:00',null,'5');

insert into stay values
(3215 ,100000001 ,111,'2008-05-01 00:00:00','2008-05-04 00:00:00'),
(3216 ,100000003 ,123,'2008-05-03 00:00:00','2008-05-14 00:00:00'),
(3217,100000004,112,'2008-05-02 00:00:00','2008-05-03 00:00:00');

insert into on_call values
(101,1,1,'2008-11-04 11:00:00','2008-11-04 19:00:00'),
(101,1,2,'2008-11-04 11:00:00','2008-11-04 19:00:00'),
(102,1,3,'2008-11-04 11:00:00','2008-11-04 19:00:00'),
(103,1,1,'2008-11-04 19:00:00 ','2008-11-05 03:00:00'),
(103,1,2,'2008-11-04 19:00:00 ','2008-11-05 03:00:00'),
(103,1,3,'2008-11-04 19:00:00 ','2008-11-05 03:00:00');

insert into undergoes values 
(100000001 ,6,3215 ,'2008-05-02 00:00:00 ',3,101),
(100000001 ,2,3215 ,'2008-05-03 00:00:00',7,101),
(100000004 ,1,3217 ,'2008-05-07 00:00:00',3,102),
(100000004 ,5,3217 ,'2008-05-09 00:00:00',6,null),
(100000001 ,7,3217 ,'2008-05-10 00:00:00',7,101),
(100000004 ,4,3217 ,'2008-05-13 00:00:00',3,103);

