SELECT ua.user_id as user_id_left,
       u.user_id as user_id_right,
       order_id,
       time,
       action,
       sex,
       birth_date
FROM   user_actions ua
LEFT JOIN users u using (user_id)
WHERE  u.user_id is not null
ORDER BY user_id_left;