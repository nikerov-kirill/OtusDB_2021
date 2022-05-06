#### Структура БД  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A1%D1%82%D1%80%D0%BE%D0%B8%D0%BC%20%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20MySQL/Screenshot_2.png)  
## Таблица - `customers`
Содержит информацию о покупателях
##### Колонки таблицы `customers`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | id | int | ID покупателя (Primary key) | + |
| 2 | first_name | varchar | Имя покупателя | - |
| 3 | last_name | varchar | Фамилия покупателя | - |
| 4 | correspondence_language_id | int | Страна соответствия покупателя (ссылка) | - |
| 5 | birth_date | date | Дата рождения покупателя | - |
| 6 | gender | enum | Пол покупателя | - |
| 7 | marialt_status | varchar | Семейное положение покупателя | - |
| 8 | address_id | int | Адрес покупателя (ссылка) | - |
##### Ограничения таблицы `customers`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | pk_customer | id | |
| FOREIGN KEY | fk_customer_country | correspondence_language_id | `countries` |


## Таблица - `countries`
Содержит информацию о странах
##### Колонки таблицы `countries`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | id | int | ID страны (Primary key) | + |
| 2 | title | varchar | Название страны | - |
##### Ограничения таблицы `countries`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | pk_country | id | |

## Таблица - `cities`
Содержит информацию о городах
##### Колонки таблицы `cities`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | id | int | ID города (Primary key) | + |
| 2 | title | varchar | Название города | - |
| 3 | country_id | id | Страна (ссылка) | - |
##### Ограничения таблицы `cities`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | pk_country | id | |
| FOREIGN KEY | fk_city_country | country_id | `countries` |

## Таблица - `addresses`
Содержит информацию о адресах
##### Колонки таблицы `addresses`
| № | Название | Тип данных | Описание | Not NULL |
| -- | --- | ----------- | ----- | ----- |
| 1 | id | int | ID адреса (Primary key) | + |
| 2 | postal_code | varchar | Индекс | - |
| 3 | region | varchar | Регион | - |
| 4 | street | varchar | Улица | - |
| 5 | building_number | int | Номер дома | - |
| 6 | city_id | int | Город (ссылка) | - |
| 7 | country_id | int | Страна (ссылка) | - |
##### Ограничения таблицы `addresses`
| Тип ограничения | Название | Поле | Связанная сущность |
| -- | --- | ----------- | ---- |
| PRIMARY KEY | pk_country | id | |
| FOREIGN KEY | fk_address_city | city_id | `cities` |
| FOREIGN KEY | fk_address_country | country_id | `countries` |

### DDL
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A1%D1%82%D1%80%D0%BE%D0%B8%D0%BC%20%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%20MySQL/Screenshot_1.png)
