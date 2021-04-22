FROM debian:buster

# INSTALL NGINX
RUN apt-get update && apt-get upgrade -y && apt-get -y install nginx
# INSTALL WIN
RUN apt -y install vim
# INSTALL WGET
RUN apt-get -y install wget
# INSTALL MYSQL
RUN apt-get -y install mariadb-server
# INSTALL PHP
RUN apt-get -y install php7.3 php-mysql php-xml php-fpm php-pdo php-gd php-cli php-mbstring
# CREATE ALIAS FOR AUTOINDEX
RUN echo 'alias autoindex="bash /etc/autoindex/autoindex.sh"' >> ~/.bashrc
# COPY ALL SOURCE TO TMP
COPY ./srcs /tmp
# EXPOSE PORTS
EXPOSE 80 443
# START CONTAINER WITH SCRIPT
CMD bash /tmp/init.sh
