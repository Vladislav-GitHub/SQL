with cancelled_orders as (
    SELECT order_id
    FROM   user_actions
    WHERE  action = 'cancel_order'
),
valid_orders as (
    SELECT order_id
    FROM   orders
    WHERE  array_length(product_ids, 1) > 5
),
delivery_times as (
    SELECT order_id,
    min(time) filter (WHERE action = 'accept_order') as time_accepted,
    min(time) filter (WHERE action = 'deliver_order') as time_delivered
    FROM   courier_actions
    WHERE  order_id not in (SELECT order_id
                            FROM   cancelled_orders)
    GROUP BY order_id)
    
SELECT order_id,
       time_accepted,
       time_delivered,
       round(extract(epoch
FROM   (time_delivered - time_accepted) / 60))::integer as delivery_time
FROM   delivery_times
WHERE  order_id in (SELECT order_id
                    FROM   valid_orders)
ORDER BY order_id;