SELECT product_id,
       name,
       price,
       '25%' as discount,
       price * 0.75 as new_price
FROM   products
WHERE  price > 60
   and name like '%чай%'
   and name not like '%чайный гриб%'
ORDER BY product_id;