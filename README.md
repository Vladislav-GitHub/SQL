# SQL

Мои Obsidian заметки и karpov.courses course

Общие сведения:

![[Pasted image 20241118182726.png]]

SELECT     -- перечисление полей результирующей таблицы
FROM        -- указание источника данных
WHERE      -- фильтрация данных
GROUP BY -- группировка данных
HAVING     -- фильтрация данных после группировки
ORDER BY -- сортировка результирующей таблицы
LIMIT         -- ограничение количества выводимых записей

FILTER применяется к 1-му агрегату, HAVING ко всем группам после фильтраций и группировок, а WHERE до агрегации.

Оконные ф-ции идут по указанному фрейму вдоль окна партиции (с нужной сортировкой, если она указана) от 1 указанной границы рамки до последней.

[[Фильтрация данных]]

[[Агрегация данных]]

[[Группировка данных]]

[[Подзапросы]]

[[JOIN]]

[[Оконные функции]]