SELECT courier_id,
       birth_date,
       sex
FROM   couriers
WHERE  courier_id in (SELECT courier_id
                      FROM   courier_actions
                      WHERE  action = 'deliver_order'
                        and  date_part('year', time) = 2022
                        and  date_part('month', time) = 9
                      GROUP BY courier_id
                      HAVING count(order_id) >= 30)
ORDER BY courier_id;