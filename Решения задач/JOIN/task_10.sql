SELECT ua.user_id,
       o.order_id,
       o.product_ids
FROM   user_actions ua
LEFT JOIN orders o
       ON ua.order_id = o.order_id
WHERE  ua.action = 'create_order'
  AND  ua.order_id not in (SELECT order_id
                           FROM   user_actions
                           WHERE  action = 'cancel_order')
ORDER BY ua.user_id, o.order_id
LIMIT  1000;