select client_id
from orders
where year(str_to_date(Date_Order, '%d.%b.%Y')) = year(curdate())
group by client_id
having count(order_id) > 10;
