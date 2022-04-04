#### Настроить физическую репликации между двумя кластерами базы данных  
Мастер настраиваем на приём входящих соединений 
- Прописываем список прослушиваемых адресов в конфигурационном файле:  
sudo nano /etc/postgresql/12/main/postgresql.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_3.png)  
*Выставляем прослушку всех адресов только для теста, на боевом сервере так делать не стоит.  
- Выставляем разрешение для входящих интерфейсов  
sudo nano /etc/postgresql/12/main/pg_hba.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_4.png)  
*Выставляем разрешение всем адресам только для теста, на боевом сервере так делать не стоит.  

- На ведомом сервере останавливаем базу  
systemctl stop postgresql.service  
- Удаляем все данные  
rm -rf /var/lib/postgresql/12/main  
- Создаем резервную копию работающего экземпляра БД  
pg_basebackup -h 194.67.87.89 -R -D /var/lib/postgresql/12/main -U postgres -W  
- Запускаем БД  
systemctl start postgresql.service  
- На мастере создаем новую таблицу, добавляем туда данные и проверяем наличие на ведомом сервере  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_1.png)  

- Данный параметр показывает, что машина находится в физической репликации  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_5.png)  
