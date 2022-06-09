create database swatiInsurance;

show databases;

use swatiInsurance;

create table person (driver_id char(10) primary key, name varchar(20), address varchar(50));

insert into person values ('di001', 'abc', 'abc');
insert into person values ('di002', 'acc', 'acc');
insert into person values ('di003', 'adc', 'adc');
insert into person values ('di004', 'aec', 'aec');
insert into person values ('di005', 'afc', 'afc');

select * from person;

create table car (regno char(10) primary key, model varchar(20), year int);

insert into car values ('cn001', 'a', 2020);
insert into car values ('cn002', 'b', 2020);
insert into car values ('cn003', 'c', 2020);
insert into car values ('cn004', 'd', 2021);
insert into car values ('cn005', 'e', 2021);

select * from car;

create table accident (report_no int primary key, date date, location varchar(50));

insert into accident values ('00101', '2020-06-02', 'pqr');
insert into accident values ('00102', '2020-06-02', 'pqr1');
insert into accident values ('00103', '2020-06-02', 'pqr2');
insert into accident values ('00104', '2020-06-03', 'pqr3');
insert into accident values ('00112', '2020-06-03', 'pqr4');

select * from accident;

create table owner (driver_id char(10) primary key, regno char(10),
foreign key(driver_id) references person(driver_id) on delete cascade,        
foreign key (regno) references car(regno) on delete cascade); 

insert into owner values ('di001', 'cn001');
insert into owner values ('di002', 'cn002');
insert into owner values ('di003', 'cn003');
insert into owner values ('di004', 'cn004');
insert into owner values ('di005', 'cn005');

select * from owner;

create table participated (driver_id char(10) , regno char(10), report_no int, damage_amount int,
foreign key(driver_id) references person(driver_id) on delete cascade,        
foreign key (regno) references car(regno) on delete cascade,                  
foreign key (report_no) references accident(report_no) on delete cascade);

insert into participated values ('di001', 'cn001', 00101, 1000);
insert into participated values ('di002', 'cn002', 00102, 5000);
insert into participated values ('di003', 'cn003', 00103, 6000);
insert into participated values ('di004', 'cn004', 00104, 4000);
insert into participated values ('di005', 'cn005', 00112, 8000);

select * from participated;

update participated
set damage_amount = 25000
where report_no = 00112;

select * from participated;
select * from accident;

insert into accident values ('00113', '2020-06-05', 'pqr5');
select * from accident;

select count(regno) from owner;

select count(model) from car
where model = 'b';






