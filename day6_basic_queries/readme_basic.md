# Basics of MySql

## Start mysql
- start -> services.msc -> search mysql -> start (if stopped)

## Create connection with mysql from cmd
```cmd
mysql -u root -p

mysql --host ip --port 3306 -u root -p
```

## Create database
```sql
show databases;
drop database if exists tutorial;
create database tutorial;
use tutorial;
```

## Create tables for school and insert data
```sql
-- Student table
create table Students(
	roll int primary key auto_increment,
	name varchar(20),
    class varchar(5),
    marks int
);


-- Insert data in tables
insert into Students(name, class, marks) values
('Ramesh', '9B', 89), 
('Dinesh', '10C', 78), 
('Mahesh', '9A', 93), 
('Suresh', '8A', 88), 
('Mukesh', '9B', 95);
```

## Interview Questions
- Select all the student from 9b class
- Select all the student from 9th class
- Find all the students with marks >=80
- Find students who scored more than 80 and less than 90

## Solutions
- Select all the students from 9b class
```sql
select * from Students
where class = '9B'
;
```

- Select all the students from 9th class
```sql
select * from Students where class like "9%";
```


- Find all the students with marks >=80
```sql
select * from Students where marks >=80;
```

- Find students who scored more than 80 and less than 90
```sql
select * from Students where 
marks < 90
and
marks > 80;

```


## Aggeregate Functions
- Count the students in class 9B
```sql

```

- Find average scrore 
```sql

```












