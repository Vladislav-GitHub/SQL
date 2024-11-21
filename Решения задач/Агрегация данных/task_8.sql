SELECT sum(price) as order_price
FROM   products
WHERE  name like '%сухарик%'
   and name like '%чипс%'
   and name like '%энергетический напиток%';