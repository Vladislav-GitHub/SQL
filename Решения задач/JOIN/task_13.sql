with o as (
    SELECT order_id,
           unnest(product_ids) as product_id
    FROM   orders
)

SELECT o.order_id,
       sum(p.price) as order_price
FROM   o
LEFT JOIN products p using(product_id)
GROUP BY order_id
ORDER BY o.order_id
LIMIT 1000;