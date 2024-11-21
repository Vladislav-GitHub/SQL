SELECT courier_id
FROM   courier_actions
WHERE  date_part('year', time) = 2022
   and date_part('month', time) = 9
   and action = 'deliver_order'
GROUP BY courier_id having count(courier_id) = 1
ORDER BY courier_id;