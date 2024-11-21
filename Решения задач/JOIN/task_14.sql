SELECT user_id,
       count(order_price) as orders_count,
       round(avg(order_size), 2) as avg_order_size,
       sum(order_price) as sum_order_value,
       round(avg(order_price), 2) as avg_order_value,
       min(order_price) as min_order_value,
       max(order_price) as max_order_value
FROM   (SELECT user_id,
               order_id,
               array_length(product_ids, 1) as order_size
        FROM   (SELECT user_id,
                       order_id
                FROM   user_actions
                WHERE  order_id not in (SELECT order_id
                                        FROM   user_actions
                                        WHERE  action = 'cancel_order')) tab1
        LEFT JOIN orders using(order_id)) tab2
LEFT JOIN (SELECT order_id,
                  sum(price) as order_price
           FROM   (SELECT order_id,
                          product_ids,
                          unnest(product_ids) as product_id
                   FROM   orders
                   WHERE  order_id not in (SELECT order_id
                                           FROM   user_actions
                                           WHERE  action = 'cancel_order')) tab3
           LEFT JOIN products using(product_id)
           GROUP BY order_id) tab4 using(order_id)
GROUP BY user_id
ORDER BY user_id
LIMIT 1000;