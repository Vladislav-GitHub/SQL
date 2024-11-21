with user_order_intervals as (
    SELECT user_id,
    time - lag(time) OVER (PARTITION BY user_id
    ORDER BY time) as interval_between_orders
    FROM   user_actions
    WHERE  order_id not in (SELECT order_id
                            FROM   user_actions
                            WHERE  action = 'cancel_order')
),
user_avg_intervals as (
    SELECT user_id,
           cast(avg(extract(epoch FROM interval_between_orders) / 3600) as integer) as hours_between_orders
    FROM   user_order_intervals
    WHERE  interval_between_orders is not null
    GROUP BY user_id
    HAVING count(*) > 1
)

SELECT user_id,
       hours_between_orders
FROM   user_avg_intervals
ORDER BY user_id
LIMIT  1000;