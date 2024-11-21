SELECT order_id
FROM   user_actions
WHERE  date_part('year', time) = 2022
   and date_part('month', time) = 8
   and action = 'create_order'
ORDER BY order_id;