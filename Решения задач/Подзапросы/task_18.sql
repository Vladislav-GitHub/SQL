with last_action_date as (
    SELECT max(time) as last_date
    FROM   user_actions
),
mean_age as (
    SELECT round(avg(date_part('year', age((SELECT last_date
                                            FROM   last_action_date), birth_date)))) as avg_age
    FROM   users
    WHERE  birth_date is not null)

SELECT user_id,
       coalesce(date_part('year', age((SELECT last_date
                                       FROM   last_action_date), birth_date)),
                (SELECT avg_age FROM mean_age)
               )::integer as age
FROM   users
ORDER BY user_id;