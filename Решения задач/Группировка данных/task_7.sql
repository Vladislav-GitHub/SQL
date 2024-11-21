SELECT sex,
       max(date_part('year', age(current_date, birth_date)))::integer as max_age
FROM   users
GROUP BY sex
ORDER BY max_age;