SELECT case when date_part('dow', creation_time) between 1 and
                 5 then 'weekdays'
            when date_part('dow', creation_time) in (0, 6) then 'weekend' end as week_part,
       round(avg(array_length(product_ids, 1)), 2) as avg_order_size
FROM   orders
GROUP BY week_part
ORDER BY avg_order_size;