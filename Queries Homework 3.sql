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
select c.name, a.name
from customers c full outer join orders o
		on (c.cid = o.cid)
	full outer join agents a
		on (o.aid = a.aid)
where c.city = a.city;