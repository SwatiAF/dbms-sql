/*creating a database called 'Insurance' which contains 'person', 'car', 'accident', 'owner', 'participated' tables.*/
create database Insurance;

/*shows the database*/
show databases;

/*selects the database for creating table*/
use Insurance;

/*creates a table 'person' with driver_id as primary key*/
create table person (driver_id char(10) primary key, name varchar(20), address varchar(50));

/*displays the metadata of the table person
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| driver_id | char(10)    | NO   | PRI | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| address   | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/
desc person;

/*inserts rows in the table*/
insert into person values ('di001', 'abc', 'abc');
insert into person values ('di002', 'acc', 'acc');
insert into person values ('di003', 'adc', 'adc');
desc person;

/*displays the contents of the table 'person'
+-----------+------+---------+
| driver_id | name | address |
+-----------+------+---------+
| di001     | abc  | abc     |
| di002     | acc  | acc     |
| di003     | adc  | adc     |
+-----------+------+---------+
*/
select * from person;

/*creates a table'car' with 'regno' as primary key*/
create table car (regno char(10) primary key, model varchar(20), year int(4));

/*displays the metadata of the table 'car'
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| regno | char(10)    | NO   | PRI | NULL    |       |
| model | varchar(20) | YES  |     | NULL    |       |
| year  | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/
desc car;
insert into car values ('cn001', 'a', 2020);
insert into car values ('cn002', 'b', 2020);
insert into car values ('cn003', 'c', 2020);
desc car;

/*displays the contents of the table 'car'
+-------+-------+------+
| regno | model | year |
+-------+-------+------+
| cn001 | a     | 2020 |
| cn002 | b     | 2020 |
| cn003 | c     | 2020 |
+-------+-------+------+
*/
select * from car;

/*creates a table 'accident' with 'report_no' as primary key*/
create table accident (report_no int(5) primary key, date date, location varchar(50));

/*displays the metadata of the table 'accident'
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| report_no | int         | NO   | PRI | NULL    |       |
| date      | date        | YES  |     | NULL    |       |
| location  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/
desc accident;
insert into accident values ('00101', '2020-06-02', 'pqr');
insert into accident values ('00102', '2020-06-02', 'pqr1');
insert into accident values ('00103', '2020-06-02', 'pqr2');
desc accident;

/*displays the contents of the table accident
+-----------+------------+----------+
| report_no | date       | location |
+-----------+------------+----------+
|       101 | 2020-06-02 | pqr      |
|       102 | 2020-06-02 | pqr1     |
|       103 | 2020-06-02 | pqr2     |
+-----------+------------+----------+
*/ 
select * from accident;

/*creates a table called 'owner' with 'driver_no' as primary key, and 'driver_no' from table 'person' & 'regno' from table 'car' as Foreign Keys*/
create table owner (driver_id char(10) primary key, regno char(10),
foreign key(driver_id) references person(driver_id) on delete cascade,        --foreign key for 'driver_no' column from 'person' table.
foreign key (regno) references car(regno) on delete cascade);                 --foreign key for 'regno' cloumn from 'car' table.

/*displays the metadata of the table 'owner'
+-----------+----------+------+-----+---------+-------+
| Field     | Type     | Null | Key | Default | Extra |
+-----------+----------+------+-----+---------+-------+
| driver_id | char(10) | NO   | PRI | NULL    |       |
| regno     | char(10) | YES  | MUL | NULL    |       |
+-----------+----------+------+-----+---------+-------+
*/
desc owner;
insert into owner values ('di001', 'cn001');
insert into owner values ('di002', 'cn002');
insert into owner values ('di003', 'cn003');
desc owner;

/*displays the contents of the table 'car'
+-----------+-------+
| driver_id | regno |
+-----------+-------+
| di001     | cn001 |
| di002     | cn002 |
| di003     | cn003 |
+-----------+-------+
*/
select * from owner;

/*creates a table 'participated' with 'driver_id', 'regno', 'report_no' as Foreign keys*/
create table participated (driver_id char(10) , regno char(10), report_no int(5), damage_amount int(7),
foreign key(driver_id) references person(driver_id) on delete cascade,        --foreign key for 'driver_no' column from 'person' table.
foreign key (regno) references car(regno) on delete cascade,                  --foreign key for 'regno' column from 'car' table.
foreign key (report_no) references accident(report_no) on delete cascade);    --foreign key for 'report_no' column from 'accident' table.

/*displays the metadata of the table 'participated'
+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| driver_id     | char(10) | YES  |     | NULL    |       |
| regno         | char(10) | YES  |     | NULL    |       |
| report_no     | int      | YES  |     | NULL    |       |
| damage_amount | int      | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+
*/
desc participated;
insert into participated values ('di001', 'cn001', '00101', 1000);
insert into participated values ('di002', 'cn002', '00102', 5000);
insert into participated values ('di003', 'cn003', '00103', 6000);
desc participated;

/*displays the contents of the table 'participated'.
+-----------+-------+-----------+---------------+
| driver_id | regno | report_no | damage_amount |
+-----------+-------+-----------+---------------+
| di001     | cn001 |       101 |          1000 |
| di002     | cn002 |       102 |          5000 |
| di003     | cn003 |       103 |          6000 |
+-----------+-------+-----------+---------------+
*/
select * from participated;
