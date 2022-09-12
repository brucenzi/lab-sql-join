use sakila;

-- 1. List the number of films per category.
select * from film_category;
select * from category;

select c.name, f.film_id as "Number of films" from film_category f
left join category c
on c.category_id = f.category_id
group by c.category_id;


-- 2. Display the first and the last names, as well as the address, of each staff member.

select * from staff;
select * from address;

select s.first_name, s.last_name, a.address from staff s
left join address a
on a.address_id = s.address_id;


-- 3. Display the total amount rung up by each staff member in August 2005.
select * from payment;

select s.staff_id, concat(s.first_name, " ", s.last_name) as "Staff Name", sum(p.amount) as "Amount per staff" from payment p
left join staff s
on s.staff_id = p.staff_id
where p.payment_date between "2005-08-01 00:00:00" and "2005-08-31 23:59:00"
group by s.staff_id
order by s.staff_id;

-- 4. List all films and the number of actors who are listed for each film.
select * from film_actor; 
select * from film;

select f.film_id, f.title, count(fa.actor_id) as "Number of actors" from film_actor fa
left join film f
on f.film_id = fa.film_id
group by f.title;

-- 5. Using the payment and the customer tables as well as the JOIN command, 
	-- list the total amount paid by each customer. 
	-- list the customers alphabetically by their last names.

select * from customer;
select * from payment;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as "Amount paid" from payment p
left join customer c
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name; 