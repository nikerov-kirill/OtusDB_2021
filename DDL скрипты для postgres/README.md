1. #### Создать базу данных my_shop
    CREATE DATABASE my_shop;
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createDB.png)
2. #### Создать новую роль с правами суперпользователя, возможностью создавать базу данных и роли
    CREATE ROLE master_elephant WITH LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD 'password';
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createRole.png)
3. #### Создать табличное пространство
    CREATE TABLESPACE shop_ts LOCATION '/db_ts/my_shop';  
    *Перед этим необходимо создать соответсвующие разделы в системе и выдать права пользователю postgres
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/createTS.png)
5. #### Выбрать созданную роль
    SET ROLE master_elephant;  
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/currentUser.png)
5. #### Выдать полный доступ к базе данных `my_shop` и сделать пользователя владельцем
    GRANT ALL PRIVILEGES ON DATABASE "my_shop" to master_elephant;  
    ALTER DATABASE "my_shop" OWNER TO master_elephant;  
    ![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DDL%20%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%8B%20%D0%B4%D0%BB%D1%8F%20postgres/newOwner.png)
6. #### Установить новое табличное пространство по умолчанию
    SET default_tablespace = shop_ts;

### Приступаем к созданию таблиц
- Таблица `products`
    CREATE TABLE products.products (  
        id serial NOT NULL CONSTRAINT pk_products PRIMARY KEY,  
        name varchar NOT NULL,  
        description text NOT NULL,  
        category_id int4 NOT NULL,  
        suplier_id int4 NOT NULL,  
        producer_id int4 NOT NULL,  
        brand_id int4 NOT NULL,  
        density varchar NULL,  
        fortress varchar NULL,  
        color varchar NULL,  
        capacity_type varchar NULL,  
        style_id int4 NULL,  
        active bool NULL  
     );  
- Таблица `categories`  
    CREATE TABLE products.categories (  
        id serial NOT NULL CONSTRAINT pk_categories PRIMARY KEY,  
        name varchar NOT NULL,  
        description text NULL,  
        active bool NOT NULL);  
- Таблица `supliers`  
    CREATE TABLE products.supliers (  
id serial NOT NULL CONSTRAINT pk_supliers PRIMARY KEY,  
name varchar NOT NULL,  
address_id int NOT NULL,  
description text NULL,  
email varchar NOT NULL CONSTRAINT uk_suplier_email UNIQUE,  
main_phone varchar NOT NULL,  
additional_phone varchar NULL);  
- Таблица `producers`
    CREATE TABLE products.producers (  
id serial NOT NULL CONSTRAINT pk_producers PRIMARY KEY,  
name varchar NOT NULL,  
address_id int NOT NULL,  
main_phone varchar NOT NULL,  
additional_phone varchar NULL,  
email varchar NOT NULL CONSTRAINT uk_producer_email UNIQUE);  
- Таблица `brands`
    CREATE TABLE products.brands (  
id serial NOT NULL CONSTRAINT pk_brands PRIMARY KEY,  
name varchar NOT NULL,  
description text NULL);  
- Таблица `styles`
    CREATE TABLE products.styles (  
id serial NOT NULL CONSTRAINT pk_styles PRIMARY KEY,  
name varchar NOT NULL,  
description text NULL);  
- Таблица `prices`
    CREATE TABLE products.prices (  
product_id int NOT NULL,  
sale_price numeric NOT NULL, 
suplier_price numeric NOT NULL);  
- Таблица `addresses`
    CREATE TABLE addresses.addresses (  
id bigserial NOT NULL CONSTRAINT pk_addresses PRIMARY KEY,  
street varchar NOT NULL,  
city_id bigint NOT NULL,  
disctrict varchar NOT NULL,  
address_code varchar NOT NULL,  
phone varchar NOT NULL);  
- Таблица `cities`  
    CREATE TABLE addresses.cities (  
id bigserial NOT NULL CONSTRAINT pk_cities PRIMARY KEY,  
name varchar NOT NULL,  
country_id int NOT NULL);  
- Таблица `countires`  
    CREATE TABLE addresses.countries (  
id serial NOT NULL CONSTRAINT pk_countries PRIMARY KEY,  
name varchar NOT NULL);  
- Таблица `sales`  
    CREATE TABLE sales.sales (  
id bigserial NOT NULL CONSTRAINT pk_sales PRIMARY KEY,  
product_id int NOT NULL,  
customer_id int NOT NULL,  
amount int NOT NULL,  
date_created timestamp NOT NULL);  
- Таблица `customers`
    CREATE TABLE sales.customers (  
id serial NOT NULL CONSTRAINT pk_customers PRIMARY KEY,  
first_name varchar NOT NULL,  
last_name varchar NOT NULL,  
second_name varchar NOT NULL,  
main_phone varchar NOT NULL,  
additional_phone varchar NULL,  
email varchar NOT NULL CONSTRAINT uk_customer_email UNIQUE  
);
- Таблица `roles`
    CREATE TABLE employees.roles (  
id int NOT NULL CONSTRAINT pk_role PRIMARY KEY,  
name varchar NOT NULL);  
- Таблица `employees`
    CREATE TABLE employees.employees (  
id serial NOT NULL CONSTRAINT pk_employees PRIMARY KEY,  
first_name varchar NOT NULL,  
last_name varchar NOT NULL,  
second_name varchar NOT NULL,  
main_phone varchar NOT NULL,  
additional_phone varchar NULL,  
email varchar NOT NULL CONSTRAINT uk_employee_email UNIQUE,  
role_id int NOT NULL,  
city_id int NOT NULL,  
active bool NOT NULL);  

### Добавляем внешние ключи
- Таблица `products`  
ALTER TABLE products.products ADD CONSTRAINT fk_categories FOREIGN KEY (category_id) REFERENCES products.categories (id) MATCH FULL;  
ALTER TABLE products.products ADD CONSTRAINT fk_supliers FOREIGN KEY (suplier_id) REFERENCES products.supliers (id) MATCH FULL;  
ALTER TABLE products.products ADD CONSTRAINT fk_producers FOREIGN KEY (producer_id) REFERENCES products.producers (id) MATCH FULL;  
ALTER TABLE products.products ADD CONSTRAINT fk_brands FOREIGN KEY (brand_id) REFERENCES products.brands (id) MATCH FULL;  
ALTER TABLE products.products ADD CONSTRAINT fk_styles FOREIGN KEY (style_id) REFERENCES products.styles (id) MATCH FULL;
- Таблица  `supliers`  
ALTER TABLE products.supliers ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES addresses.addresses (id) MATCH FULL;
- Таблица  `producers`  
ALTER TABLE products.producers ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES addresses.addresses (id) MATCH FULL;
- Таблица `addresses`  
ALTER TABLE addresses.addresses ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES addresses.cities (id) MATCH FULL;
- Таблица `cities`  
ALTER TABLE addresses.cities ADD CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES addresses.countries (id) MATCH FULL;
- Таблица `sales`  
ALTER TABLE sales.sales ADD CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products.products (id) MATCH FULL;  
ALTER TABLE sales.sales ADD CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES sales.customers (id) MATCH FULL;
- Таблица `employees`  
ALTER TABLE employees.employees ADD CONSTRAINT fk_roles FOREIGN KEY (role_id) REFERENCES employees.roles (id) MATCH FULL;
- Таблица `prices`  
ALTER TABLE products.prices ADD CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products.products (id) MATCH FULL;



     
