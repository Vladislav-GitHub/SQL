with first_orders_per_user as (
    SELECT user_id,
    min(time) as first_order_time
    FROM   user_actions
    WHERE  action = 'create_order'
      AND  order_id not in (SELECT order_id
    FROM   user_actions
    WHERE  action = 'cancel_order')
    GROUP BY user_id
)

SELECT date(first_order_time) as date,
       count(*) as first_orders
FROM   first_orders_per_user
GROUP BY date(first_order_time)
ORDER BY date;