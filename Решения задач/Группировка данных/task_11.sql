SELECT coalesce(array_length(product_ids, 1), 0) as order_size,
       count(distinct order_id) as orders_count
FROM   orders
WHERE  date_part('dow', creation_time) between 1
   and 5
GROUP BY order_size having count(distinct order_id) > 2000
ORDER BY order_size;