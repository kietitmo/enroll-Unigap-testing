-- From the above list of client: get information of first and second last order of client (Order date, good type, and amount)

with  client_orders as (
    select
        *,
        row_number() over (partition by client_id order by str_to_date(order_date, '%d.%b.%Y') asc) as row_number_asc,
        row_number() over (partition by client_id order by str_to_date(order_date, '%d.%b.%Y') desc) as row_number_desc
    from orders
)
select 
    client_id,
    order_date,
    good_type,
    good_amount
from client_orders
where row_number_asc = 1 or row_number_desc = 2;