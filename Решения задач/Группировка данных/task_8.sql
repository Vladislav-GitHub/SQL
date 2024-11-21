SELECT date_part('year', age(current_date, birth_date))::integer as age,
       count(user_id) as users_count
FROM   users
GROUP BY 1
ORDER BY 1;