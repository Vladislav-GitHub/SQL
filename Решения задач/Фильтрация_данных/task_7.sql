SELECT product_id,
       name
FROM   products
WHERE  name like 'с%'
   and name not like '% %'
ORDER BY product_id;