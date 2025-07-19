drop database if exists tutorial;
create database tutorial;
use tutorial;

create table Items(
	item_id int auto_increment primary key,
	item_name varchar(30) not null,
	quantity int not null,
    price int not null,
    discount int not null, 
    category varchar(40) not null
);

insert into Items(item_name, quantity, price, discount, category) values
('Laptop', 10, 55000, 0, 'electronic'),
('Tablet', 5, 19000, 0, 'electronic'),
('Smartphone', 5, 12000, 0, 'electronic'),
('Headphones', 20, 2500, 0, 'electronic'),
('Saree', 15, 900, 0, 'fabric'),
('comicBook', 20, 125, 0, 'book');


-- create stored procedure => function
DELIMITER //

create procedure applyDiscount()
begin
    update Items set discount = 15 where category = 'electronic';
    update Items set discount = 10 where category != 'electronic';
END //
DELIMITER ;


-- create stored procedure => function
DELIMITER //

create procedure removeDiscount()
begin
    update Items set discount = 0;
END //
DELIMITER ;


-- list all procedures
show procedure status;