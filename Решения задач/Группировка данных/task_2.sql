SELECT action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY action
ORDER BY orders_count;