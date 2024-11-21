SELECT sex,
       count(sex) as couriers_count
FROM   couriers
GROUP BY 1
ORDER BY sex;