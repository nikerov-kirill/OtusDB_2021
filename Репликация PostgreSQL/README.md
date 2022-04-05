### Физическая репликация  
##### Настройка ведущего сервера (master)  
1. Создание пользователя для реплик  
  su – postgres  
  createuser --replication -P -e replicator  
  exit  
2. Прописываем список прослушиваемых адресов в конфигурационном файле:  
sudo nano /etc/postgresql/12/main/postgresql.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_3.png)  
`Выставляем прослушку всех адресов только для теста, на боевом сервере так делать не стоит.`  
3. Выставляем разрешение для входящих интерфейсов  
sudo nano /etc/postgresql/12/main/pg_hba.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_4.png)  
`Выставляем разрешение всем адресам только для теста, на боевом сервере так делать не стоит.`  
4. Перезапускаем базу  
   systemctl restart postgresql
   
##### Настройка ведомого сервера (slave)
1. Остановим базу и очистим данные  
  systemctl stop postgresql  
  rm -rf /var/lib/postgresql/12/main/*  
2. Выставляем задержку на приём данных в 5 минут  
  sudo nano /etc/postgresql/12/main/postgresql.conf  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_7.png)  
3. Создаем базовую резервную копию
  pg_basebackup -h 194.67.87.89 -D /var/lib/postgresql/12/main -U replicator -P -v -R -X stream -C -S replication_slot
4. Запускаем базу  
  systemctl start postgresql  
  
#### Результаты  
1. Данные с мастера подтянулись  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_1.png)  
2. Создан слой репликации  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_2.png)  
3. Данные через 5 минут поступают с ведущего на ведомый сервер
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_10.png)  

### Логическая репликация

#### Публикующий сервер  
1. Прописываем параметр `wal_level`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_11.png)  
2. Создаем новую базу данных и таблицу  
  CREATE DATABASE logical_replica;  
  CREATE TABLE test (id int, name varchar);  
3. Создаем публикацию для данной таблицы  
  CREATE PUBLICATION test_publication FOR TABLE test;  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_12.png)  
#### Сервер подписчик  
1. Создаем подписку на публикацию  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_13.png)  
#### Результат  
 Проверяем наличие подписки и данных из таблицы публикатора  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%BF%D0%BB%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F%20PostgreSQL/Screenshot_15.png)
  
  
