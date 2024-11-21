SELECT concat('Заказ № ' ,
              order_id,
              ' создан ',
              date(creation_time)) as order_info
FROM   orders limit 200;