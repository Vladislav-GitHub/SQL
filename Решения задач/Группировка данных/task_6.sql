SELECT sex,
       date_part('month', max(birth_date))::integer as max_month
FROM   users
GROUP BY sex
ORDER BY sex;