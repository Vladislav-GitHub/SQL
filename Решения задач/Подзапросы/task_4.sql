with subquery as (
    SELECT avg(price)
    FROM   products
)

SELECT product_id,
       name,
       price
FROM   products
WHERE  price >= (SELECT *
                 FROM   subquery) + 20
ORDER BY product_id desc;