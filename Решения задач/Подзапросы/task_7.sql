with subquery as (
    SELECT order_id
    FROM   user_actions
    WHERE  action = 'cancel_order'
)

SELECT order_id
FROM   user_actions
WHERE  order_id not in (SELECT *
                        FROM   subquery)
ORDER BY order_id
LIMIT  1000;