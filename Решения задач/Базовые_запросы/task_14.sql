SELECT product_id,
       name,
       price as old_price,
       case when price <= 100 or
                 name = 'икра' then price
            when price > 100 then price * 1.05
            else 0 end new_price
FROM   products
ORDER BY new_price desc, product_id