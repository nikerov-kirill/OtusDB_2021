Для выполнения ДЗ использовал тестовую базу adventureworks.  
Изначально в таблице `product` нет текстового поля, поэтому добавим его сами и заполним значениями из таблицы `productdescription`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20MySQL/Screenshot_1.png)  
Добавляем полнотекстовый индекс по полям:
 - `Name`
 - `Color`
 - `Description`  
 CREATE FULLTEXT INDEX fulltext_idx  
 ON product(Name, Color, Description);  
 
 Делаем выборку  
 ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20MySQL/Screenshot_2.png)  
 План выполнения запроса показывает, что индекс используется  
 ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20MySQL/Screenshot_3.png)  
 Так же наблюдаются различия в выборках при использовании модов  
 ###### NATURAL LANGUAGE MODE  
 ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20MySQL/Screenshot_4.png)  
 ###### QUERY EXPANSION  
 ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20MySQL/Screenshot_5.png)
 
 

