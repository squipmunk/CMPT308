-- Homework 1
-- Dominic Blanchet

-- 1
SELECT *
FROM customers;

select agents.name, agents.city
from agents
where (agents.name = 'Smith');

select products.pid, products.name, products.quantity
from products
where (products.priceUSD > 1.25);

select ordno, aid
from orders;

select customers.name, customers.city
from customers
where (customers.city <> 'Dallas');

select agents.name
from agents
where (agents.city = 'New York')
   or (agents.city = 'Newark');

select *
from products
where (products.city <> 'New York')
  and (products.city <> 'Newark')
  and (products.priceUSD <= 1.00);

select *
from orders
where (orders.mon = 'jan')
   or (orders.mon = 'mar');

select *
from orders
where (orders.mon = 'feb')
  and (orders.dollars < 100);

select *
from orders
where (orders.cid = 'c005');
