SELECT user_id,
       count(order_id) as created_orders
FROM   user_actions
WHERE  date_part('year', time) = 2022
   and date_part('month', time) = 08
   and action = 'create_order'
GROUP BY user_id
ORDER BY created_orders desc, user_id limit 5;