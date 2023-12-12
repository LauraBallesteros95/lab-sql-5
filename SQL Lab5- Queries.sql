-- LAB 5 QUERIES
-- Drop column picture from staff.
alter table staff
drop column picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = 'TAMMY' and last_name = 'SANDERS';
insert into staff 
values (3, 'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy', 'contraseñadetammy', '2006-02-15 06:00:16');
select * from staff;
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select * from rental; -- rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
select rental_id from rental order by rental_id desc limit 1; -- PARA SACAR EL ORDEN DESC - DESCENDENTE 16049
select current_timestamp; -- USAMOS ESTA FORMULA PARA SACAR LA FECHA ACTUAL 2023-12-12 21:03:23
select inventory_id from rental order by inventory_id desc limit 1; -- SACAMOS EL ORDEN DLE INVENTARIO EN ORDEN DESC 4581
select customer_id from customer 
where first_name = 'Charlotte' and last_name = 'Hunter'; -- 130
select rental_duration from film 
where title = 'Academy Dinosaur'; -- 6 2023-12-18 21:03:23
select staff_id from staff
where first_name = 'Mike'; -- 1
insert into rental 
values(16050, '2023-12-12 21:03:23', 4582, 130,'2023-12-18 21:03:23', 1,'2023-12-12 21:03:23');
select * from rental where rental_id = 16050;
set foreign_key_checks = 0; -- Te permite modificar los valores anteriores, para volver a fijarlo, hay que ponerle 1, en vez de 0
set foreign_key_checks = 1;

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer

CREATE TABLE deleted_users (  -- CREAR UNA TABLA
`customer_id` int UNIQUE NOT NULL, 
`email` char(50) DEFAULT NULL,
`date` char(50) DEFAULT NULL,
CONSTRAINT PRIMARY KEY (customer_id)
);
select customer_id, email, last_update from customer
where active = 0;

insert into deleted_users -- para introducir los valores en la tabla que hemos creado
values  -- añadimos los valores uno a uno
('16','SANDRA.MARTIN@sakilacustomer.org','2006-02-15 04:57:20'),
('64','JUDITH.COX@sakilacustomer.org','2006-02-15 04:57:20'),
('124','SHEILA.WELLS@sakilacustomer.org','2006-02-15 04:57:20'),
('169','ERICA.MATTHEWS@sakilacustomer.org','2006-02-15 04:57:20'),
('241','HEIDI.LARSON@sakilacustomer.org','2006-02-15 04:57:20'),
('271','PENNY.NEAL@sakilacustomer.org','2006-02-15 04:57:20'),
('315','KENNETH.GOODEN@sakilacustomer.org','2006-02-15 04:57:20'),
('368','HARRY.ARCE@sakilacustomer.org','2006-02-15 04:57:20'),
('406','NATHAN.RUNYON@sakilacustomer.org','2006-02-15 04:57:20'),
('446','THEODORE.CULP@sakilacustomer.org','2006-02-15 04:57:20'),
('482','MAURICE.CRAWLEY@sakilacustomer.org','2006-02-15 04:57:20'),
('510','BEN.EASTER@sakilacustomer.org','2006-02-15 04:57:20'),
('534','CHRISTIAN.JUNG@sakilacustomer.org','2006-02-15 04:57:20'),
('558','JIMMIE.EGGLESTON@sakilacustomer.org','2006-02-15 04:57:20'),
('592','TERRANCE.ROUSH@sakilacustomer.org','2006-02-15 04:57:20');
select * from deleted_users;  -- para revisar la tabla creada con nuevos valores
set foreign_key_checks = 0; -- Te permite modificar los valores anteriores, para volver a fijarlo, hay que ponerle 1, en vez de 0
delete from customer where active = 0;