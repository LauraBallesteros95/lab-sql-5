-- Use sakila database.
-- Get all the data from tables actor, film and customer.
-- Get film titles.
-- Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
-- 5.1 Find out how many stores does the company have?
-- 5.2 Find out how many employees staff does the company have?
-- 5.3 Return a list of employee first names only?

-- Use sakila database.
use sakila;
-- Get all the data from tables actor, film and customer.
select * from film;
select * from actor;
select * from customer;
-- Get film titles.
select  title from film;
-- Get unique list of film languages under the alias language.
select distinct language_id as language from film;
-- Find out how many stores does the company have?
select count(store_id) as store_count from store;
-- Find out how many employees staff does the company have?
select count(staff_id) as staff_count from staff;
-- Return a list of employee first names only?
select first_name from staff;

-- LAB 2

-- Select all the actors with the first name ‘Scarlett’.
-- Select all the actors with the last name ‘Johansson’.
-- How many films (movies) are available for rent?
-- How many films have been rented?
-- What is the shortest and longest rental period?
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- What's the average movie duration?
-- What's the average movie duration expressed in format (hours, minutes)?
-- How many movies longer than 3 hours?
-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
-- What's the length of the longest film title?

-- Select all the actors with the first name ‘Scarlett’.
select * from actor where first_name = 'Scarlett';
-- Select all the actors with the last name ‘Johansson’.
select * from actor where last_name = 'Johansson';
-- How many films (movies) are available for rent?
select count(*) as film_count from film where rental_duration > 0;
-- How many films have been rented?
select count(distinct inventory_id) as film_count from rental;
-- What is the shortest and longest rental period?
-- 
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration from film;
-- What's the average movie duration?
select avg(length) as average_duration from film;
-- What's the average movie duration expressed in format (hours, minutes)?
select concat(
       floor(avg(length)/60), 'hours', 
       mod(avg(length), 60), 'minutes'
       ) as average_duration 
from film;
-- How many movies longer than 3 hours?
select count(*) as movies_count
from film
where length > 180;
-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(first_name, ' ' , last_name, '-', email) as formatted_info
from customer;
-- What's the length of the longest film title?
select max(length(title)) as longest_title_length from film;


-- LAB 3
-- How many distinct (different) actors' last names are there?
select count(distinct last_name) as "Number of different actors' last name" from sakila.actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as "Number of different languages" from sakila.film;
-- How many movies were released with "PG-13" rating?
select count(*) as movies_count
from film
where rating = 'PG-13';
-- Get 10 the longest movies from 2006.
 select title, length
 from film
 where release_year = 2006
 order by length desc
 limit 10;
 -- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as days_operating
from rental;
-- Show rental info with additional columns month and weekday. Get 20.
select *, month(rental_date) as rental_month, weekday(rental_date) as rental_weekday
from rental
limit 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
       case when dayname(rental_date) in ('Saturday', 'Sunday') then 'weekend'
            else 'workday'
       end as day_type
from rental;
-- How many rentals were in the last month of activity?
select count(*) as rental_count
from rental
where date_format(rental_date, '%Y-%m') = date_format(date_sub(curdate(), interval 1 month), '%Y-%m');

-- LAB 4
-- Get film ratings.
select rating from film;
-- Get release years.
select distinct release_year from film;
-- Get all films with ARMAGEDDON in the title
select * from film where title like '%ARMAGEDDON%';
-- Get all films with APOLLO in the title
select * from film where title like '%APOLLO%';
-- Get all films which title ends with APOLLO.
select * from film where title like '%APOLLO'; 
-- Get all films with word DATE in the title.
select * from film where title like '%DATE%';
-- Get 10 films with the longest title.
select * from film order by length(title) desc limit 10;
-- Get 10 the longest films. (??)
select * from film order by max_duration desc limit 10;
-- How many films include Behind the Scenes content? (??)
select count(*) as film_with_behing_scenes from film where behind_the_scenes = 'Yes';
-- List films ordered by release year and title in alphabetical order.
select *
from film
order by release_year, title;