with subquery as (
    SELECT user_id,
    count(order_id) as user_orders
    FROM   user_actions
    WHERE  action = 'create_order'
    GROUP BY user_id
)

SELECT round(avg(user_orders), 2) as orders_avg
FROM   subquery;