SELECT ua.user_id,
       o.order_id,
       product_ids
FROM   user_actions ua
full join orders o
       ON ua.order_id = o.order_id
ORDER BY ua.user_id, o.order_id
LIMIT  1000;