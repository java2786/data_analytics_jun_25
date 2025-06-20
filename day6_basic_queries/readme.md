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
```

## Create tables for school and insert data
```sql
-- Student table
create table Students(
	roll int primary key auto_increment,
	name varchar(20),
    class varchar(5)
);

-- Subject table
create table Subjects(
	id int primary key auto_increment,
	name varchar(20)
);

-- Scores table
create table Scores(
	marks int,
	student_id int,
	sub_id int,
	foreign key(student_id) references Students(roll),
	foreign key(sub_id) references Subjects(id),
	primary key(student_id, sub_id)
);

-- Insert data in tables
insert into Students(name) values('Ramesh'), ('Mahesh'), ('Suresh'), ('Mukesh');

insert into Subjects(name) values('Hindi'), ('Math');

insert into Scores(marks, student_id, sub_id) values
(78, 3, 1),
(88, 2, 2),
(99, 4, 1);

-- Error because student 4 and subject 1 already has score
-- insert into Scores(marks, student_id, sub_id) values(91, 4, 1);

insert into Scores(marks, student_id, sub_id) values
(92, 4, 2);
```

## Interview Questions
- Select all the student from class
- Find all the students with marks >=80 in any subject
- Find all the students with marks >=80 in math subject
- Count the students in class 9B









