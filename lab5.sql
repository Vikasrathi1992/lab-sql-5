USE sakila;

-- 1.Drop column picture from staff.
SELECT * FROM staff;
ALTER TABLE staff drop Column picture;

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
/*SELECT * FROM customer WHERE first_name = 'TAMMY';*/

INSERT INTO sakila.staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES ('3', 'Tammy', 'Sanders', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'Tammy', 'XYZZZ', current_timestamp());

-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.
/*
SELECT * FROM film WHERE title = 'Academy Dinosaur';
SELECT * FROM inventory;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM customer WHERE first_name = 'Charlotte' AND last_name = 'Hunter'; */

INSERT INTO rental(rental_date,inventory_id,customer_id,staff_id)
VALUES (current_timestamp(),'5','130','1');

-- 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date the user was deleted.
-- Creating a new table deleted_user to store the deleted data

DROP TABLE if exists deleted_users;
CREATE TABLE deleted_users AS (
SELECT customer_id , email , last_update FROM sakila.customer WHERE active = '0'); 
select * from deleted_users;

-- Dropping users who are non - active
 DELETE FROM customer WHERE active = '0';



