drop database if exists tutorial;
create database tutorial;
use tutorial;

create table Items(
	item_id int auto_increment primary key,
	item_name varchar(30) not null,
	quantity int not null
);

create table Purchases(
	purchase_id int auto_increment primary key,
	item_id int not null,
	quantity int not null,
	purchase_date timestamp default (current_timestamp),
	foreign key (item_id) references Items(item_id)
);

insert into Items(item_name, quantity) values
('Laptop', 10),
('Tablet', 5),
('Smartphone', 5),
('Headphones', 20);


-- assuming error but query will work
-- place order to buy 12 laptops
insert into Purchases(item_id, quantity) values
(1, 12);



-- create trigger which runs before insert into purchase
DELIMITER $$

CREATE TRIGGER before_purchase_insert
BEFORE INSERT ON Purchases
FOR EACH ROW
BEGIN
  DECLARE current_quantity INT;

  -- Get current quantity of the item
  SELECT quantity INTO current_quantity
  FROM Items
  WHERE item_id = NEW.item_id;

  -- Check if enough stock is available
  IF current_quantity < NEW.quantity THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Not enough stock available';
  ELSE
    -- Deduct purchased quantity from Items
    UPDATE Items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id;
  END IF;
END$$

DELIMITER ;

