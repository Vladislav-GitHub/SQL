with daily_orders as (
    SELECT date(creation_time) as date,
           count(order_id) as orders_count
    FROM   orders
    WHERE  order_id not in (SELECT order_id
                            FROM   user_actions
                            WHERE  action = 'cancel_order')
                            GROUP BY date(creation_time)
),
moving_avg_orders as (SELECT date,
                             orders_count,
                             round(avg(orders_count) OVER (
                                ORDER BY date rows between 3 preceding and current row
                             ), 2) as moving_avg
                      FROM   daily_orders)

SELECT date,
       orders_count,
       moving_avg
FROM   moving_avg_orders;