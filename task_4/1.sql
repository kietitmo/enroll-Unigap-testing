-- Count number of unique client order and number of orders by order month.
select 
  date_format(str_to_date(Date_Order, '%d.%b.%Y'), '%Y-%m') AS order_month,
  count(distinct client_id) AS unique_clients,
  count(order_id) AS total_orders
from 
  orders
group by
  date_format(str_to_date(order_date, '%d.%b.%Y'), '%Y-%m');
