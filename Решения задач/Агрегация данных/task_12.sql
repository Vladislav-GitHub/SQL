SELECT round(avg(case when (name like '%чай%' or
                           name like '%кофе%') and
                           (name not like '%иван-чай%' and
                           name not like '%чайный гриб%') then price end), 2) as avg_price
FROM   products;