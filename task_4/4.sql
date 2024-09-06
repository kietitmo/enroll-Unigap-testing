-- Calculate total good amount and Count number of Order which were delivered in Sep.2019

select 
    count(c.order_id) AS number_of_orders, 
    sum(c.good_amount) AS total_good_amount
from client_orders c
join order_delivery o on c.order_id = o.order_id
where str_to_date(order_date, '%d.%b.%Y') between '2019-09-01' and '2019-09-30';