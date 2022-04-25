##### 1. Создать пользователей client, manager.  
 - CREATE USER 'client'@'%' IDENTIFIED BY 'clientPass123!';  
 - CREATE USER 'manager'@'%' IDENTIFIED BY 'managerPass123!';  
##### 2. Создать процедуру выборки товаров с использованием различных фильтров: категория, цена, производитель, различные дополнительные параметры Также в качестве параметров передавать по какому полю сортировать выборку, и параметры постраничной выдачи.  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D0%B4%D1%83%D1%80%D1%8B%20MySQL/Screenshot_1.png)  
##### 3. Дать права да запуск процедуры пользователю client  
 - GRANT EXECUTE ON PROCEDURE `adventureworks`.`get_products` TO 'client'@'%';  
##### Результат  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D0%B4%D1%83%D1%80%D1%8B%20MySQL/Screenshot_2.png)  
##### 4. Создать процедуру get_orders - которая позволяет просматривать отчет по продажам за определенный период (час, день, неделя) с различными уровнями группировки (по товару, по категории, по производителю)  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D0%B4%D1%83%D1%80%D1%8B%20MySQL/Screenshot_3.png)  
##### 5. Права дать пользователю manager  
 - GRANT EXECUTE ON PROCEDURE `adventureworks`.`get_orders` TO 'manager'@'%';
###### Результат 
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D0%B4%D1%83%D1%80%D1%8B%20MySQL/Screenshot_4.png)  

###### 
[SQL-код](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D0%B4%D1%83%D1%80%D1%8B%20MySQL/procedures.sql)
