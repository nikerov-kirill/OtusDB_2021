1. #### Создать базу данных my_shop
    CREATE DATABASE my_shop;
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createDB.png)
2. #### Создать новую роль с правами суперпользователя, возможностью создавать базу данных и роли
    CREATE ROLE master_elephant WITH LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD 'password';
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createRole.png)
3. #### Создать табличное пространство
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createTS.png)
5. #### Выбрать созданную роль
    SET ROLE master_elephant;  
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/currentUser.png)
5. #### Выдать полный доступ к базе данных `my_shop` и сделать пользователя владельцем
    GRANT ALL PRIVILEGES ON DATABASE "my_shop" to master_elephant;  
    ALTER DATABASE "my_shop" OWNER TO master_elephant;  
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/newOwner.png)
