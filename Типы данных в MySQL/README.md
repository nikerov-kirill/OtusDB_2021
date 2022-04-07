Данная схема позволяет создать интернет магазин с возможностями:
- вывод товаров с разбивкой по категориям
- добавления товара в корзину
- создание административной панели для редактирования списков категорий товаров, товаров, поставщиков, производителей

![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/DBScheme.png)

## Документация базы данных интернет-магазина крафтового пива
## Таблица - `products`
Содержит информацию о товарах
##### Колонки таблицы `products`
| № | Название | Тип данных (старый) | Тип данных (новый) | Причина замены | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- | ---- | ---- |
| 1 | product_id | bigserial | + serial | Нет необходимости брать настолько большое число | ID товара (Primary key) | + |
| 2 | name | varchar | <span style="color:green">varchar(255)</span> | Точно указываем длину строки | Название товара | + |
| 3 | description | text | <span style="color:red">text</span> | -- | Описание товара | - |
| 4 | category_id | int | <span style="color:red">int</span> |  -- |Категория товара (ссылка) | + |
| 5 | suplier_id | bigint | <span style="color:green">int</span> | Поставщик товара (ссылка) | Нет необходимости брать настолько большое число | + |
| 6 | producer_id | int | <span style="color:red">int</span> | Производитель товара (сссылка) | -- | + |
| 7 | brand_id | int | <span style="color:red">int</span> | Бренд товара (ссылка) | -- | + |
| 8 | style_id | int | <span style="color:red">int</span> | Стиль напитка (ссылка) | -- | + |
| 9 | density | varchar | <span style="color:green">double(4,2)</span> | Плотность напитка | Число с точность до сотых долей, не превышающее 100 | - |
| 10 | fortress | varchar | <span style="color:green">double(4,2)</span> | Крепость напитка |Число с точность до сотых долей, не превышающее 100 | - |
| 11 | color | varchar | <span style="color:green">int</span> | Цвет напитка | Введен отдельный словарь цветов | - |
| 12 | container_type | varchar | <span style="color:green">int</span> | Тип ёмкости | Введен отдельный словарь тары | - |
| 13 | active | bool | <span style="color:red">bool</span> | Активность товара | -- | - |
##### Ограничения таблицы `products`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | products_pk | product_id | |
| FOREIGN KEY | products_fk | category_id | `categories` |
| FOREIGN KEY | products_fk_1 | suplier_id | `supliers` |
| FOREIGN KEY | products_fk_2 | producer_id | `producers` |
| FOREIGN KEY | products_fk_4 | brand_id | `brands` |
| FOREIGN KEY | products_fk_5 | style_id | `styles` |

## Таблица - `categories`
Содержит информацию о категориях товаров
##### Колонки таблицы `categories`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | category_id | serial | ID категории (Primary key) | + |
| 2 | name | varchar | Название категории | + |
| 3 | description | text | Описание категории | - |
| 4 | active | bool | Активность категории | + |
##### Ограничения таблицы `categories`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | categories_pk | category_id | |

## Таблица - `supliers`
Содержит информацию о поставщиках
##### Колонки таблицы `supliers`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | suplier_id | bigserial | ID поставщика (Primary key) | + |
| 2 | name | varchar | Название поставщика | + |
| 3 | address_id | int | Адрес поставщика (ссылка) | + |
| 4 | description | text | Описание поставщика | - |
| 5 | email | varchar | Email поставщика (Unique key) | + |
| 6 | main_phone | varchar | Основной телефон поставщика | + |
| 7 | additional_phone | varchar | Дополнительный телефон поставщика | - |
##### Ограничения таблицы `supliers`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | supliers_pk | suplier_id | |
| UNIQUE KEY | supliers_un | email | |
| FOREIGN KEY | supliers_fk | address_id | `addresses` |

## Таблица - `producers`
Содержит информацию о производителях
##### Колонки таблицы `producers`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | producer_id | serial | ID производителя (Primary key) | + |
| 2 | name | varchar | Название производителя | + |
| 3 | address_id | int | Адрес производителя (ссылка) | + |
| 4 | main_phone | varchar | Основной телефон производителя | + |
| 5 | additional_phone | varchar | Дополнительный телефон производителя | - |
| 6 | email | varchar | Email производителя (Unique key) | + |
##### Ограничения таблицы `producers`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | producers_pk | producer_id | |
| UNIQUE KEY | producers_un | email | |
| FOREIGN KEY | producers_fk | address_id | `addresses` |

## Таблица - `brands`
Содержит информацию о брендах
##### Колонки таблицы `brands`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | brand_id | serial | ID бренда (Primary key) | + |
| 2 | brand_name | varchar | Название бренда | + |
| 3 | description | text | Описание бренда | - |
##### Ограничения таблицы `brands`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | brands_pk | brand_id | |

## Таблица - `styles`
Содержит информацию о стилях пива и пивных напитков
##### Колонки таблицы `styles`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | style_id | serial | ID бренда (Primary key) | + |
| 2 | style_name | varchar | Название стиля | + |
| 3 | description | text | Описание стиля | - |
##### Ограничения таблицы `styles`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | styles_pk | style_id | |

## Таблица - `prices`
Содержит информацию о ценах на товары
##### Колонки таблицы `prices`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | product_id | bigserial | ID товара (Primary key) | + |
| 2 | sale_price | numeric | Цена розницы | + |
| 3 | suplier_price | numeric | Цена поставщика | + |
##### Ограничения таблицы `prices`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | prices_pk | product_id | |
| FOREIGN KEY | prices_fk | product_id | `products` |

## Таблица - `employees`
Содержит информацию о работниках интернет-магазина
##### Колонки таблицы `employees`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ---- |
| 1 | employee_id | serial | ID сотрудника (Primary key) | + |
| 2 | first_name | varchar | Имя сотрудника | + |
| 3 | last_name | varchar | Фамилия сотрудника | + |
| 4 | second_name | varchar | Отчество сотрудника | + |
| 5 | main_phone | varchar | Основной телефон сотрудника | + |
| 6 | additional_phone | varchar | Дополнительный телефон сотрудника | - |
| 7 | email | varchar | Email сотрудника (Unique key) | + |
| 8 | role_id | int | Роль сотрудника (Ссылка) | + |
| 9 | active | bool | Активность сотрудника (работает или уволен) | + |
| 10 | city_id | int | Город сотрудника (Ссылка) | - |
##### Ограничения таблицы `employees`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | users_pk | employee_id | |
| UNIQUE KEY | users_un | email | |
| FOREIGN KEY | employees_fk | city_id | `cities` |
| FOREIGN KEY | users_fk | role_id | `roles` |

## Таблица - `roles`
Содержит информацию о ролях сотрудников
##### Колонки таблицы `roles`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | role_id | serial | ID роли (Primary key) | + |
| 2 | role_name | varchar | Название роли | + |
##### Ограничения таблицы `roles`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | roles_pk | role_id | |

## Таблица - `customers`
Содержит информацию о покупателях интернет-магазина
##### Колонки таблицы `customers`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ---- |
| 1 | customer_id | bigserial | ID покупателя (Primary key) | + |
| 2 | first_name | varchar | Имя сотрудника | + |
| 3 | last_name | varchar | Фамилия сотрудника | + |
| 4 | second_name | varchar | Отчество сотрудника | + |
| 5 | main_phone | varchar | Основной телефон сотрудника | + |
| 6 | additional_phone | varchar | Дополнительный телефон сотрудника | - |
| 7 | email | varchar | Email сотрудника (Unique key) | + |
##### Ограничения таблицы `customers`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | customers_pk | customer_id | |
| UNIQUE KEY | customers_un | email | |

## Таблица - `sales`
Содержит информацию о продажах товаров
##### Колонки таблицы `sales`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | sale_id | bigserial | ID продажи (Primary key) | + |
| 2 | product_id | bigint | ID товара (Ссылка) | + |
| 3 | customer_id | int | ID покупателя (Ссылка) | + |
| 4 | amount | numeric | Количество товаров | + |
| 5 | date_created | timestamp | Дата создания | + |
##### Ограничения таблицы `sales`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | sales_pk | sale_id | |

## Таблица - `addresses`
Содержит информацию об адресах
##### Колонки таблицы `addresses`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | address_id | bigserial | ID адреса (Primary key) | + |
| 2 | street | varchar | Улица | + |
| 3 | city_id | bigint | ID города (Ссылка) | + |
| 4 | disctrict | varchar | Район | + |
| 5 | address_code | varchar | Индекс | + |
| 6 | phone | varchar | Телефон | + |
##### Ограничения таблицы `addresses`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | addresses_pk | address_id | |
| FOREIGN KEY | addresses_fk | city_id | `cities` |

## Таблица - `cities`
Содержит информацию о городах
##### Колонки таблицы `cities`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | city_id | serial | ID города (Primary key) | + |
| 2 | city_name | varchar | Название города | + |
| 3 | country_id | serial | ID страны (Ссылка) | + |
##### Ограничения таблицы `cities`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | cities_pk | city_id | |
| FOREIGN KEY | cities_fk | country_id | `countries` |

## Таблица - `countries`
Содержит информацию о странах
##### Колонки таблицы `countries`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | country_id | serial | ID страны (Primary key) | + |
| 2 | country_name | varchar | Название страны | + |
##### Ограничения таблицы `countries`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | countries_pk | country_id | |
