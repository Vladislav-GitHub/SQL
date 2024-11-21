SELECT ua.user_id as user_id_left,
       u.user_id as user_id_right,
       order_id,
       time,
       action,
       sex,
       birth_date
FROM   user_actions ua
INNER JOIN users u
        ON ua.user_id = u.user_id
ORDER BY user_id_left;