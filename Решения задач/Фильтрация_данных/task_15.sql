SELECT user_id,
       order_id,
       action,
       time
FROM   user_actions
WHERE  date_part('year', time) = 2022
   and date_part('month', time) = 8
   and date_part('dow', time) = 3
   and date_part('hour', time) between 12
   and 15
   and action = 'cancel_order'
ORDER BY order_id desc;