SELECT product_id,
       name,
       price as old_price,
       price * 0.8 as new_price
FROM   products
WHERE  price * 0.8 > 100
ORDER BY product_id;