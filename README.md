Данная схема позволяет создать интернет магазин с возможностями:
- вывод товаров с разбивкой по категориям
- добавления товара в корзину
- создание административной панели для редактирования списков категорий товаров, товаров, поставщиков, производителей

[Ссылка на схему](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/ShopScheme.png)

## Документация базы данных интернет-магазина крафтового пива
## Таблица - `products`
Содержит информацию о товарах
##### Колонки таблицы `products`
| № | Название | Тип данных | Описание |
| -- | --- | ----------- | ----- |
| 1 | product_id | bigserial | ID товара (Primary key) |
| 2 | name | varchar | Название товара |
| 3 | description | text | Описание товара |
| 4 | category_id | int | ID категории |
| 5 | suplier_id | bigint | ID поставщика |
| 6 | producer_id | int | ID производителя |
| 7 | brand_id | int | Бренд товара |
| 8 | style_id | int | Стиль напитка |
| 9 | density | varchar | Плотность напитка |
| 10 | fortress | varchar | Крепость напитка |
| 11 | color | varchar | Цвет напитка |
| 12 | capacity_type | varchar | Тип ёмкости |
| 13 | active | bool | Активность товара |
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
Содержит информацию о товарах
##### Колонки таблицы `categories`
| № | Название | Тип данных | Описание |
| -- | --- | ----------- | ----- |
| 1 | category_id | serial | ID категории (Primary key) |
| 2 | name | varchar | Название категории |
| 3 | description | text | Описание категории |
| 4 | active | bool | Активность категории |
##### Ограничения таблицы `categories`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | categories_pk | category_id | |
