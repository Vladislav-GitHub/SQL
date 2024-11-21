SELECT u.user_id,
       p.name
FROM   (SELECT user_id
        FROM   users
        LIMIT  100) as u
cross join products as p
ORDER BY u.user_id, p.name;