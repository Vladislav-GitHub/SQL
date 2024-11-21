SELECT count(distinct ua.user_id) as users_count
FROM   user_actions ua
LEFT JOIN users u using (user_id);