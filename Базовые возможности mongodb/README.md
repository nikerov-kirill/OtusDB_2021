##### 1. Установить MongoDB одним из способов: ВМ, докер.
- wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -  
- sudo apt-get install gnupg  
- wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -  
- echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list  
- sudo apt-get update  
- sudo apt-get install -y mongodb-org  
- sudo systemctl start mongod  
- sudo systemctl daemon-reload  
- sudo systemctl enable mongod  
- sudo systemctl status mongod  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%91%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20mongodb/Screenshot_1.png)  
- mongosh  
![](https://github.com/nikerov-kirill/OtusDB_2021/blob/master/%D0%91%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20mongodb/Screenshot_2.png)  
