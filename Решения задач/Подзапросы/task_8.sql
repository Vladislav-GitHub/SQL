with subquery as (
    SELECT user_id,
    count(distinct order_id) as orders_count
    FROM   user_actions
    GROUP BY user_id
)

SELECT user_id,
       orders_count,
       round((SELECT avg(orders_count)
              FROM   subquery), 2) as orders_avg,
       round(orders_count - (SELECT avg(orders_count)
                             FROM   subquery), 2) as orders_diff
FROM   subquery
ORDER BY user_id
LIMIT  1000;