with subsquery as (
    SELECT max(time) - interval '1 week'
    FROM   user_actions
)

SELECT count(distinct user_id) as users_count
FROM   user_actions
WHERE  time >= (SELECT *
                FROM   subsquery)
  AND  action = 'create_order';