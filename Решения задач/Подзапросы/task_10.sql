with del_orders as (
    SELECT order_id
    FROM   courier_actions
    WHERE  action = 'deliver_order'
)

SELECT count(order_id) as orders_count
FROM   del_orders
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'create_order');