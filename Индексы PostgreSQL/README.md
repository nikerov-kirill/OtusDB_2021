#### 1. Создать индекс к какой-либо из таблиц вашей БД  
Создаем индекс по внешнему ключу group_variety для таблицы `sub_varieties`
create index on sub_varieties(group_variety);
#### 2. Прислать текстом результат команды explain, в которой используется данный индекс
##### Запрос 1:  
  explain (costs, verbose, format json, analyse)  
  select * from sub_varieties sv  
  left join group_varieties gv on (sv.group_variety = gv.id)  
##### Результат 1:  
  В данном случае происходит полное сканирование таблиц, без использования созданного индекса, потому что мы делаем `select * ` и нам необходимо достать все записи из таблиц.  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_8.png)  
##### Запрос 2:  
  explain (costs, verbose, format json, analyse)  
  select * from sub_varieties sv  
  left join group_varieties gv on (sv.group_variety = gv.id)  
  where sv.group_variety = 1  
##### Результат 2:
  Здесь же индекс используется, т.к. явно указано значение колонки и делать полное сканирование таблицы нет необходимости.  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_1.png)  
#### 3. Реализовать индекс для полнотекстового поиска  
  Создаем новую колонку типа `tsvector` и заполняем ее лексемами колонки с описанием сортов
  alter table sub_varieties add column textsearch tsvector  
  update sub_varieties  
  set textsearch = to_tsvector(description)  
  Создаем индекс по новому полю  
  create index textsearch_sub_varieties_idx on sub_varieties using GIN (textsearch);
###### Запрос:  
  explain (costs, verbose, format json, analyse)  
  select  
    sv.name_en,  
    sv.name_ru  
  from sub_varieties sv   
  where sv.description @@ to_tsquery('кислое | бельгийское')  
###### Результат:  
  Происходит полное сканирование таблицы. По всей видимости, планировщик не считает использование индекса оптимальным решением. Или же я что-то сделал не так :)  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_2.png)  
#### 4. Реализовать индекс на часть таблицы или индекс на поле с функцией  
Создаем индекс по полю `alcohol_max` таблицы `sub_varieties` только для тех строк, где значение alcohol_max < 7  
###### Запрос:  
create index middle_alco_sub_varieties_idx on sub_varieties (alcohol_max)  
where alcohol_max < 7  
###### Результат:  
  Результат аналогичен предыдущему пункту. Индекс не применяется.  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20PostgreSQL/Screenshot_3.png)  
#### 5. Создать индекс на несколько полей  




  


 

