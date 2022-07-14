//Airline Database

create database swatiAirline;
use swatiAirline;

create table flights (
flno int primary key,
origin varchar(50),
destination varchar(50),
distance int,
departs time, 
arrives time,
price int);

create table aircraft (
aid int primary key, 
aname varchar(50),
cruising_range int);

create table employee (
eid int primary key,
ename varchar(50), 
salary int);

create table certified (
eid int primary key,
aid int,
foreign key (aid) references aircraft(aid) on delete cascade,
foreign key (eid) references employee(eid) on delete cascade);

insert into aircraft values(101, '747', 3000);
insert into aircraft values(102, 'Boeing', 900);
insert into aircraft values(103, '647', 800);
insert into aircraft values(104, 'Dreamline', 4000);
insert into aircraft values(105, 'Boeing', 3000);
insert into aircraft values(106, '707', 307);
insert into aircraft values(107, 'Dream', 308);

insert into employee values(701, 'a', 40000);
insert into employee values(702, 'b', 50000);
insert into employee values(703, 'c', 30000);
insert into employee values(704, 'd', 60000);
insert into employee values(705, 'e', 20000);
insert into employee values(706, 'f', 70000);
insert into employee values(707, 'g', 80000);

insert into certified values(701, 101);
insert into certified values(702, 102);
insert into certified values(703, 103);
insert into certified values(704, 104);
insert into certified values(705, 105);
insert into certified values(706, 106);
insert into certified values(707, 107);

insert into flights values(1001, 'bangalore', 'delhi', 2500, timestamp '2005-05-13 07:15:00', timestamp '2005-05-13 17:15:00', 5000);
insert into flights values(1002, 'city1', 'city2', 2500, timestamp '2005-05-13 07:15:00', timestamp '2005-05-13 12:15:00', 800);
insert into flights values(1003, 'city2', 'city4', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 15:15:00', 870);
insert into flights values(1004, 'city3', 'city6', 2500, timestamp '2005-05-13 06:15:00', timestamp '2005-05-13 13:15:00', 500);
insert into flights values(1005, 'city4', 'city6', 2500, timestamp '2005-05-13 08:15:00', timestamp '2005-05-13 11:15:00', 4000);
insert into flights values(1006, 'city5', 'city1', 2500, timestamp '2005-05-13 10:15:00', timestamp '2005-05-13 16:15:00', 6000);
insert into flights values(1007, 'city6', 'city2', 2500, timestamp '2005-05-13 11:15:00', timestamp '2005-05-13 17:15:00', 2000);

/*query 1 --> no rows returned*/
select distinct a.aname 
from aircraft a, certified c, employee e
where a.aid = c.aid and e.eid = c.eid and e.salary in (
	select e1.salary 
    from employee e1
    where e1.eid = c.eid and e1.salary > 50000);

/*query 1 --> 0 rows returned*/
SELECT DISTINCT a.aname 
FROM aircraft a, certified c, employee e
WHERE c.eid=e.eid and e.salary in  (
	SELECT e1.salary 
    FROM employee e1, employee e
	WHERE e1.salary > 50000);
