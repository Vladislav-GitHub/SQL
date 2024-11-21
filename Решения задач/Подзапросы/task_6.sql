with last_action_date as (
    SELECT max(time)::date as max_date
    FROM   courier_actions
)

SELECT age((SELECT max_date
            FROM   last_action_date), birth_date)::varchar as min_age
FROM   couriers
WHERE  sex = 'male'
ORDER BY age((SELECT max_date
              FROM   last_action_date), birth_date) asc
LIMIT  1;