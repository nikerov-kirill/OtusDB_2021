##### Требуется восстановить таблицу world.city из бэкапа
- Расшифровка архива  
openssl des3 -salt -k 'password' -d -in backup_des.xbstream.gz-195395-35d9cd.des3 -out backup_des.xbstream.gz  
- Распаковка архива  
gzip -d backup_des.xbstream.gz  
