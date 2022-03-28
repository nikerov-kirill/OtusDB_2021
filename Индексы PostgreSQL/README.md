#### 1. Создать индекс к какой-либо из таблиц вашей БД
create index on sub_varieties(group_variety);
#### 2. Прислать текстом результат команды explain, в которой используется данный индекс
Запрос 1:  
  explain (costs, verbose, format json, analyse)  
  select * from sub_varieties sv  
  left join group_varieties gv on (sv.group_variety = gv.id)  
Результат 1:  
  В данном случае происходит полное сканирование таблиц, без использования созданного индекса, потому что мы делаем `select * ` и нам необходимо достать все записи из таблиц.  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_8.png)  
Запрос 2:  
  explain (costs, verbose, format json, analyse)  
  select * from sub_varieties sv  
  left join group_varieties gv on (sv.group_variety = gv.id)  
  where sv.group_variety = 1  
Результат 2:
  Здесь же индекс используется, т.к. явно указано значение колонки и делать полное сканирование таблицы нет необходимости.  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_1.png)  
 

