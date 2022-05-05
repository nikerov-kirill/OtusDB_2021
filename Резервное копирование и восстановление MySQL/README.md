##### Требуется восстановить таблицу world.city из бэкапа
- Расшифровка архива  
openssl des3 -salt -k 'password' -d -in backup_des.xbstream.gz-195395-35d9cd.des3 -out backup_des.xbstream.gz  
- Распаковка архива  
gzip -d backup_des.xbstream.gz  
Текущее количество записей в таблице city  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%A0%D0%B5%D0%B7%D0%B5%D1%80%D0%B2%D0%BD%D0%BE%D0%B5%20%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%B8%20%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20MySQL/Screenshot_7.png)
