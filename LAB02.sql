create database swatiBankEnterprise;

use swatiBankEnterprise;

create table branch (branch_name varchar(20), branch_city varchar(10), assets int);

alter table branch 
add primary key(branch_name);

insert into branch values ('branch1', 'city1', 54956);
insert into branch values ('branch2', 'city2', 84670);
insert into branch values ('branch3', 'city3', 52356);
insert into branch values ('branch4', 'city4', 43056);
insert into branch values ('branch5', 'city5', 28976);
insert into branch values ('main', 'city6', 28522);   

select * from branch;

create table accounts (accno int, 
branch_name varchar(20), 
balance int,
primary key(accno));

alter table accounts 
add foreign key (branch_name) references branch(branch_name) on delete cascade;

insert into accounts values (123001, 'branch1', 120056);
insert into accounts values (123002, 'branch2', 12670);
insert into accounts values (123003, 'branch3', 265356);
insert into accounts values (123004, 'branch4', 120056);
insert into accounts values (123005, 'branch5', 456976);

select * from accounts;

create table depositor (customer_name varchar(20), customer_street varchar(10), customer_city varchar(20));

alter table depositor
add primary key(customer_name);

insert into depositor values ('name1', 'street1', 'city1');
insert into depositor values ('name2', 'street2', 'city2');
insert into depositor values ('name3', 'street3', 'city3');
insert into depositor values ('name4', 'street4', 'city4');
insert into depositor values ('name5', 'street5', 'city5');

select * from depositor;

create table loan (loan_no int primary key, branch_name varchar(20), amount int,
foreign key(branch_name) references branch(branch_name) on delete cascade);

insert into loan values (45001, 'branch1', 78945);
insert into loan values (45002, 'branch2', 66945);
insert into loan values (45003, 'branch3', 223945);
insert into loan values (45004, 'branch4', 74945);
insert into loan values (45005, 'branch5', 11945);

select * from loan;

create table borrower (customer_name varchar(20), loan_no int,
primary key(customer_name, loan_no),
foreign key (customer_name) references depositor(customer_name) on delete cascade,
foreign key (loan_no) references loan(loan_no) on delete cascade);

insert into borrower values ('name1', 45001);
insert into borrower values ('name2', 45002);
insert into borrower values ('name3', 45003);
insert into borrower values ('name4', 45004);
insert into borrower values ('name5', 45005);

select * from borrower;


/*
When creating foreign keys be sure the columns you are using have the same:
- Data Type
- Collation
- Zero Fill
- Not Null
- Unsigned
- Binary
*/
