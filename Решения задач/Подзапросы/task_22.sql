with cancelled_orders as (
    SELECT order_id
    FROM   user_actions
    WHERE  action = 'cancel_order'
),
ans as (SELECT product_id,
               count(product_id) as times_purchased
        FROM   (SELECT unnest(product_ids) as product_id
                FROM   orders
                WHERE  order_id not in (SELECT order_id
                                        FROM   cancelled_orders)
               ) as unnest_orders
        GROUP BY product_id
        ORDER BY times_purchased desc
        LIMIT  10)
        
SELECT product_id,
       times_purchased
FROM   ans
ORDER BY product_id;