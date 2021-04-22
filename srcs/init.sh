service mysql start

# Config Access
chown -R www-data /var/www/*
chmod -R 777 /var/www/*

# SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/amdedieu.pem -keyout /etc/nginx/ssl/amdedieu.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=yanboudr/CN=amdedieu"

# Config NGINX
rm /etc/nginx/sites-available/default
rm /var/www/html/index.nginx-debian.html
cp /tmp/nginx-conf-on /etc/nginx/sites-available/default

# Config MYSQL
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
mysql -u root -e "CREATE USER 'amdedieu'@'localhost' IDENTIFIED BY 'password'"
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'amdedieu'@'localhost'"
mysql -u root -e "FLUSH PRIVILEGES;"

# Config WORDPRESS
mv /tmp/wordpress /var/www/html/

# Config PhpMyAdmin
mv /tmp/phpMyAdmin /var/www/html/

# Config autoindex-switcher
mkdir /etc/autoindex
mv /tmp/autoindex.sh /tmp/nginx-conf-off /tmp/nginx-conf-on /etc/autoindex
alias autoindex="bash /etc/autoindex/autoindex.sh"

# Start services
service php7.3-fpm start
service nginx start
bash
