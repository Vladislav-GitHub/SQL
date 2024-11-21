with o as (SELECT order_id,
                  unnest(product_ids) as product_id
           FROM   orders)
SELECT o.order_id,
       o.product_id,
       p.price
FROM   o
LEFT JOIN products p using(product_id)
ORDER BY o.order_id, o.product_id
LIMIT  1000;