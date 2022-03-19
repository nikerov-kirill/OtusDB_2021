#### 1.Напишите запрос по своей базе с регулярным выражением, добавьте пояснение, что вы хотите найти.
Найдем все бельгийские сорта
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/1q.png)
#### 2. Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?
Запрос с использованием LEFT JOIN. При данном использовании JOIN мы получаем все записи из левой таблицы (sub_varieties) и совпадения в указанных таблицах (group_varieties и head_varieties)
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/2q.png)
Запрос с использованием INNER JOIN. При данном использовании JOIN мы получаем декартовое произведение колонок таблиц 18 (sub_varieties) * 18 (group_varieties) * 3 (head_varieties) = 972
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/2q_1.png)
В соединениях LEFT и RIGHT JOIN порядок напрямую влияет на результат, ведь сначала указывается таблица из которой берем записи, а потом уже указываются те, в которых ищут совпадения.
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/2q_4.png)
#### 3. Напишите запрос на добавление данных с выводом информации о добавленных строках.
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/3q.png)
#### 4. Напишите запрос с обновлением данные используя UPDATE FROM.
Обновим поле название в таблице `warehouse` для элементов, у которых значение alcohol_max меньше 5 из таблицы `sub_varieties`
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/4q.png)
#### 5. Напишите запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.
Удалим из таблицы `warehouse` элементы используя таблицу `sub_varieties` в которой значение ibu_max = 8
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/5q.png)
#### 6. Приведите пример использования утилиты COPY (по желанию)
Сохраним результаты из таблицы `sub_varieties` в csv файл  
Запрос:  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/6q_1.png)
Результат:  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/6q.png)
