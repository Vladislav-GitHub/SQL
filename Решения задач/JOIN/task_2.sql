SELECT count(distinct ua.user_id) as users_count
FROM   user_actions ua join users u using (user_id);