#### Настроить физическую репликации между двумя кластерами базы данных  
Мастер настраиваем на приём входящих соединений 
- Прописываем список прослушиваемых адресов в конфигурационном файле:  
sudo nano /etc/postgresql/12/main/postgresql.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_3.png)
*Выставляем прослушку всех адресов только для теста, на боевом сервере так делать не стоит.

- Выставляем разрешение для входящих интерфейсов
sudo nano /etc/postgresql/12/main/pg_hba.conf  
