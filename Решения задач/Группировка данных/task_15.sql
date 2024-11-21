SELECT case when array_length(product_ids, 1) between 1 and
                 3 then 'Малый'
            when array_length(product_ids, 1) between 4 and
                 6 then 'Средний'
            when array_length(product_ids, 1) >= 7 then 'Большой' end as order_size,
       count(order_id) as orders_count
FROM   orders
GROUP BY order_size
ORDER BY orders_count;