#### 1. Описать пример транзакции из своего проекта с изменением данных в нескольких таблицах. Реализовать в виде хранимой процедуры.  
Создаем процедуру в процессе которой создаем таблицу с товарами `product_1`, таблицу скидок `discounts_test`, таблицу товаров со скидками `product_2`  
Добавляем товары, затем добавляем скидки и заполянем таблицу товаров, имеющих скидки с обновленной ценой  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A2%D1%80%D0%B0%D0%BD%D0%B7%D0%B0%D0%BA%D1%86%D0%B8%D0%B8%20MySQL/Screenshot_6.png)  
Запускаем процедуру - CALL test_procedure();  
##### Результаты:  
- Таблица `product_1`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A2%D1%80%D0%B0%D0%BD%D0%B7%D0%B0%D0%BA%D1%86%D0%B8%D0%B8%20MySQL/product_1.png)  
- Таблица `discounts_test`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A2%D1%80%D0%B0%D0%BD%D0%B7%D0%B0%D0%BA%D1%86%D0%B8%D0%B8%20MySQL/discount.png)  
- Таблица `product_2`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A2%D1%80%D0%B0%D0%BD%D0%B7%D0%B0%D0%BA%D1%86%D0%B8%D0%B8%20MySQL/product_2.png)  
#### 2. Загрузить данные из приложенных в материалах csv. Реализовать следующими путями:  
