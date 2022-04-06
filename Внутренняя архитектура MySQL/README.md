#### 1. Забрать стартовый репозиторий `https://github.com/aeuge/otus-mysql-docker`  
`git clone https://github.com/aeuge/otus-mysql-docker.git`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0%20MySQL/Screenshot_4.png)  
#### 2. Прописать sql скрипт для создания своей БД в init.sql
  CREATE DATABASE homework;  
  USE homework;  
  CREATE TABLE test (id int, title varchar(100)) ENGINE InnoDB;  
  INSERT INTO test VALUES (1, 'One'), (2, 'Two'), (3, 'Three');  
#### 3. Проверить запуск и работу контейнера следую описанию в репозитории  
  Запуск контейнера  
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0%20MySQL/Screenshot_2.png)  
  Новая база и заполненная таблица присутсвуют    
  ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0%20MySQL/Screenshot_3.png)  
