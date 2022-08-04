create database OrderProcess;
use OrderProcess;

create table customer (cust_id int primary key, cname varchar(50), city varchar(50));

create table orders (order_id int, odate date, cust_id int, order_amt int,
primary key(order_id, cust_id),
foreign key (cust_id) references customer(cust_id) on delete cascade);

create table item (item_id int primary key, unit_price int);

create table order_item (order_id int, item int, qty int,
primary key(order_id, item),
foreign key (order_id) references orders(order_id) on delete cascade,
foreign key (item_id) references item(item_id) on delete cascade);

create table warehouse (ware_house int, city varchar(50),
primary key(ware_house));

create table shipment (order_id int, warehouse int, shipdate date,
primary key(order_id, warehouse),
foreign key (order_id) references orders(order_id) on delete cascade,
foreign key (ware_house) references warehouse(ware_house) on delete cascade);

select * from item; 

insert into item values (101, 900);
insert into item values (102, 400);
insert into item values (103, 600);
insert into item values (104, 200);





