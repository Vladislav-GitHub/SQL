SELECT name,
       count(*) as times_purchased
FROM   (SELECT DISTINCT c.order_id,
                        unnest(o.product_ids) as product_id
        FROM   courier_actions c
        LEFT JOIN orders o using(order_id)
        WHERE  c.action = 'deliver_order'
          AND  date_trunc('month', c.time) = '2022-09-01') as tab1
LEFT JOIN (SELECT product_id,
                  name
           FROM   products) as tab2 using(product_id)
GROUP BY name
ORDER BY times_purchased desc
LIMIT  10;