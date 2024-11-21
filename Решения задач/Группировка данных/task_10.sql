SELECT array_length(product_ids, 1) as order_size,
       count(order_id) as orders_count
FROM   orders
WHERE  creation_time >= '2022-08-29 00:00:00'
   and creation_time <= '2022-09-04 23:59:59'
GROUP BY 1
ORDER BY 1;