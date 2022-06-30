/*30/06/2022*/

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

create table certified (
eid int primary key,
aid int,
foreign key (aid) references aircraft(aid) on delete cascade);

create table employee (
eid varchar(50) primary key,
ename varchar(50), 
salary int,
foreign key (eid) references certified(eid) on delete cascade);


