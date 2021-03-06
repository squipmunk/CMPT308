-- Queries Homework 3 --
-- Dominic Blanchet --

-- 1 --
select a.city
from agents a
where a.aid in (
	select o.aid
	from orders o
	where o.cid = 'c002');

-- 2 --
select a.city
from agents a inner join orders o on (a.aid = o.aid) inner join customers c on (o.cid = c.cid)
where (c.cid = 'c002');

-- 3 --
select distinct o.pid
from orders o
where o.aid in (
	select o.aid
	from orders o
	where o.cid in (
		select c.cid
		from customers c
		where c.city = 'Kyoto'));

-- 4 --
select distinct o2.pid
from customers c inner join orders o 
		on (c.cid = o.cid and c.city = 'Kyoto')
	left outer join orders o2 
		on (o.aid = o2.aid)
order by o2.pid;

-- 5 --
select c.name
from customers c
where c.cid not in (
	select o.cid
	from orders o);

-- 6 --
select c.name
from customers c full outer join orders o
	on (c.cid = o.cid)
where o.cid is null;

-- 7 --
select distinct c.name, a.name
from customers c full outer join orders o
		on (c.cid = o.cid)
	full outer join agents a
		on (o.aid = a.aid)
where c.city = a.city;

-- 8 --
select c.name, a.name
from customers c, agents a
where c.city = a.city

-- 9 --
select c.name, c.city
from customers c
where c.city in (
	select p.city
	from products p
	group by p.city
	order by count(*) asc
	limit 1);

-- 10 --

select c.name, c.city
from customers c
where c.city in (
	select p.city
	from products p
	group by city
	order by count(city) desc
	limit 1);

-- 11 --


-- 12 --
select p.name
from products p
where p.priceUSD>(select avg(priceUSD) from products);

-- 13 --
select c.name, o.pid, o.dollars
from customers c full outer join orders o
		on (c.cid = o.cid)
order by coalesce(o.dollars, 0) desc;

-- 14 --
select c.name, sum(coalesce(o.dollars,0))
from customers c full outer join orders o
		on (c.cid = o.cid)
group by c.name, c.cid;

-- 15 --
select c.name, p.name, a.name
from customers c, products p, agents a, orders o
where c.cid = o.cid
  and o.pid = p.pid
  and o.aid = a.aid
  and a.city = 'New York';

-- 16 --
select  o.ordno as OrderNumber, ((o.qty*p.priceUSD)-(o.qty*priceUSD*c.discount/100)) as Quoted,
	o.dollars as Paid
from customers c, orders o, products p
where c.cid = o.cid
  and p.pid = o.pid
  
-- 17 --
update orders
set dollars = 400
where ordno = 1011
