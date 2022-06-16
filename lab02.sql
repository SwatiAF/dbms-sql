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

select * from branch;

create table accounts (accno int, 
branch_name varchar(20), 
balance int,
primary key(accno));

alter table accounts 
add foreign key (branch_name) references branch(branch_name) on delete cascade;

create table depositor (customer_name varchar(20), customer_street varchar(10), customer_city varchar(20));

alter table depositor
add primary key(customer_name);

create table loan (loan_no int primary key, branch_name varchar(20), amount int,
foreign key(branch_name) references branch(branch_name) on delete cascade);

create table borrower (customer_name varchar(20), loan_no int,
primary key(customer_name, loan_no),
foreign key (customer_name) references depositor(customer_name) on delete cascade,
foreign key (loan_no) references loan(loan_no) on delete cascade);

/*
When creating foreign keys be sure the columns you are using have the same:
- Data Type
- Collation
- Zero Fill
- Not Null
- Unsigned
- Binary
*/
