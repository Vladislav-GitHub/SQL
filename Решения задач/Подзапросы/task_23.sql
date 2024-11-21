with top_5 as (SELECT product_id
               FROM   products
               ORDER BY price desc
               LIMIT  5
),
order_products as (SELECT order_id,
                          unnest(product_ids) as product_id
                   FROM   orders)

SELECT DISTINCT order_id,
                product_ids
FROM orders
WHERE order_id in (SELECT order_id
                   FROM   order_products
                   WHERE  product_id in (SELECT product_id
                                         FROM   top_5))
ORDER BY order_id;