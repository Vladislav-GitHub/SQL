SELECT case when date_part('year', age(birth_date)) between 18 and
                 24 then '18-24'
            when date_part('year', age(birth_date)) between 25 and
                 29 then '25-29'
            when date_part('year', age(birth_date)) between 30 and
                 35 then '30-35'
            when date_part('year', age(birth_date)) >= 36 then '36+' end as group_age,
       count(distinct user_id) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY group_age
ORDER BY group_age;