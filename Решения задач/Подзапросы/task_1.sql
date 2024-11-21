SELECT round(avg(ords), 2) as orders_avg
FROM   (SELECT user_id,
               count(order_id) as ords
        FROM   user_actions
        WHERE  action = 'create_order'
        GROUP BY user_id) as subquery;