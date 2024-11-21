SELECT age(current_date, birth_date)::varchar as min_age
FROM   couriers
WHERE  birth_date is not null
   and sex = 'male'
ORDER BY birth_date desc limit 1;