#### 2. Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?
Запрос с использованием LEFT JOIN. При данном использовании JOIN мы получаем все записи из левой таблицы (sub_varieties) и совпадения в указанных таблицах (group_varieties и head_varieties)
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/2q.png)
Запрос с использованием INNER JOIN. При данном использовании JOIN мы получаем декартовое произведение колонок таблиц 18 (sub_varieties) * 18 (group_varieties) * 3 (head_varieties) = 972
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DML%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20PostgreSQL/2q_1.png)


