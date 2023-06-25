#!/bin/bash

 sudo apt-get install -y firewalld
 sudo service firewalld start
 sudo systemctl enable firewalld

 sudo apt-get install -y mariadb-server
 sudo service mariadb start
 sudo systemctl enable mariadb

 sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
 sudo firewall-cmd --reload

 cat > configure-db.sql <<-EOF
 CREATE DATABASE ecomdb;
 CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
 GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
 FLUSH PRIVILEGES;

EOF

 sudo mysql < configure-db.sql

 cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF

 
 sudo mysql < db-load-script.sql

 sudo apt install apache2
 sudo apt-get install -y php
 sudo apt-get install -y php-mysql

 sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
 sudo firewall-cmd --reload

 sudo sed -i 's/index.html/index.php/g' /etc/apache2/apache2.conf
 sudo service apache2 start
 sudo systemctl enable apache2

 sudo yum install -y git
 git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
 sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php

 curl http://localhost