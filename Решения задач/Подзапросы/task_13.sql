with delivered_orders as (
    SELECT DISTINCT order_id
    FROM   courier_actions
    WHERE  action = 'deliver_order'
),
canceled_orders as (
    SELECT DISTINCT order_id
    FROM   user_actions
    WHERE  action = 'cancel_order'
),
undelivered_orders as (
    SELECT DISTINCT order_id
    FROM   courier_actions
    WHERE  order_id not in (SELECT order_id FROM delivered_orders)
)

SELECT (SELECT count(*) FROM undelivered_orders) as orders_undelivered,
       (SELECT count(*) FROM canceled_orders) as orders_canceled,
       (SELECT count(*)
        FROM undelivered_orders uo
        WHERE  uo.order_id not in (SELECT order_id
                                    FROM   canceled_orders)
       ) as orders_in_process;