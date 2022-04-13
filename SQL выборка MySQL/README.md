#### 1. Напишите запрос по своей базе с inner join  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_6.png)  
#### 2. Напишите запрос по своей базе с left join  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_1.png)  
#### 3. Напишите 5 запросов с WHERE с использованием разных операторов, опишите для чего вам в проекте нужна такая выборка данных  
- Выбираем товары, цена у которых больше 1000  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_2.png)  
- Выбираем товары, цена у которых больше 1000 и меньше 2000  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_3.png)
- Выбираем товары, цена у которых больше или равна 1000 и меньше или равно 2000 и название подкатегории равно 'Road Frames' и название категории не равно 'Bikes'  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_4.png)
- Выбираем всех сотрудников у которых в должности есть 'Designer'  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_5.png)  
- Вместе джойна с таблицей `address` можно сделать условие `WHERE EXISTS` с подзапросом. По итогу мы выбираем всех сотрудников, проживающих в San Francisco  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/SQL%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20MySQL/Screenshot_7.png)
