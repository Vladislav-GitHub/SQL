with avg_price as (
    SELECT round(avg(price), 2) as price
    FROM   products
)

SELECT product_id,
       name,
       price,
       case when price >= (SELECT * FROM   avg_price) + 50 then price * 0.85
            when price <= (SELECT * FROM   avg_price) - 50 then price * 0.9
            else price
       end as new_price
FROM   products
ORDER BY price desc, product_id;