Данная схема позволяет создать интернет магазин с возможностями:
- вывод товаров с разбивкой по категориям
- добавления товара в корзину
- создание административной панели для редактирования списков категорий товаров, товаров, поставщиков, производителей

[Ссылка на схему](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/ShopScheme.png)

## Документация базы данных интернет-магазина крафтового пива
## Таблица - `products`
Содержит информацию о товарах
##### Колонки таблицы `products`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ---- |
| 1 | product_id | bigserial | ID товара (Primary key) | + |
| 2 | name | varchar | Название товара | + |
| 3 | description | text | Описание товара | - |
| 4 | category_id | int | Категория товара (ссылка) | + |
| 5 | suplier_id | bigint | Поставщик товара (ссылка) | + |
| 6 | producer_id | int | Производитель товара (сссылка) | + |
| 7 | brand_id | int | Бренд товара (ссылка) | + |
| 8 | style_id | int | Стиль напитка (ссылка) | + |
| 9 | density | varchar | Плотность напитка | - |
| 10 | fortress | varchar | Крепость напитка | - |
| 11 | color | varchar | Цвет напитка | - |
| 12 | capacity_type | varchar | Тип ёмкости | - |
| 13 | active | bool | Активность товара | - |
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
