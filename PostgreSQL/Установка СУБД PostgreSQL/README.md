## Установка СУБД PostgreSQL на Ubuntu 20.04
#### Шаг 1.
sudo apt install postgresql - При установке пакета инсталлятор создаст новый PostgreSQL-кластер.
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-1.png)
#### Шаг 2.
Проверка активности службы
sudo systemctl is-active postgresql
sudo systemctl is-enabled postgresql
sudo systemctl status postgresql
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/PostgreSQL/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A1%D0%A3%D0%91%D0%94%20PostgreSQL/step-2.png)
