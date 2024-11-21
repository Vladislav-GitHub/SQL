with last_100_orders as (
    SELECT order_id
    FROM   courier_actions
    WHERE  action = 'deliver_order'
    ORDER BY time desc
    LIMIT  100
)

SELECT order_id,
       product_ids
FROM   orders
WHERE  order_id in (SELECT order_id
                    FROM   last_100_orders)
ORDER BY order_id;