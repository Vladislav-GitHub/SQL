with user_birth_dates as (
    SELECT birth_date,
           count(user_id) as users_count
    FROM   users
    WHERE  birth_date is not null
    GROUP BY birth_date), courier_birth_dates as (SELECT birth_date,
                                                         count(courier_id) as couriers_count
                                                  FROM   couriers
                                                  WHERE  birth_date is not null
                                                  GROUP BY birth_date)

SELECT u.birth_date as users_birth_date,
       u.users_count,
       c.birth_date as couriers_birth_date,
       c.couriers_count
FROM   user_birth_dates u full join courier_birth_dates c
        ON u.birth_date = c.birth_date
ORDER BY users_birth_date, couriers_birth_date;