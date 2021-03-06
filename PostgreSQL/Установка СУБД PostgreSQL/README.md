## Установка СУБД PostgreSQL на Ubuntu 20.04
#### Шаг 1.
sudo apt install postgresql - При установке пакета инсталлятор создаст новый PostgreSQL-кластер.
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-1.png)
#### Шаг 2.
Проверка активности службы
* sudo systemctl is-active postgresql
* sudo systemctl is-enabled postgresql
* sudo systemctl status postgresql  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-2.png)
##### Шаг 3.
Создание базы данных и учетной записи для работы
* создаем пользователя `dba`
* создаем базу данных `myShop`
* выдаем права пользователю `dba` на БД `myShop`  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-3.png)
##### Шаг 4.
Установка pgAdmin
* sudo apt install pgadmin4 - запуск установки pgAdmin4
* sudo /usr/pgadmin4/bin/setup-web.sh - установка необходимых веб-компонентов
* sudo ufw allow 'Apache' - выдать разрешение для Apache2 на доступ через брандмауэр
* sudo ufw enable - запуск брандмауэра
##### Шаг 5.
Авторизуемся в веб-интерфейсе и наслаждаемся!
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-5.png)
