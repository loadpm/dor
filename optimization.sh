#!/bin/bash
# FOR CENTOS 7.X

# Only root
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

# Set the locale US
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"
export LANGUAGE=en_US.UTF-8

#-----------------

# dhparams
openssl dhparam -dsaparam -out /etc/nginx/dhparam.pem 4096

# nginx
wget https://raw.githubusercontent.com/loadpm/dor/master/nginx_fast.conf -O /etc/nginx/nginx.conf

#bad bot
wget https://raw.githubusercontent.com/loadpm/dor/master/ddos.conf -O /etc/nginx/fastpanel2-includes/ddos.conf

#mariadb
wget https://raw.githubusercontent.com/loadpm/VestaCP-Server-Installer/master/CentOS7/my.cnf -O /etc/my.cnf


#restart service

systemctl restart mariadb
systemctl restart nginx

		echo "....";
		echo " ";
		echo " ";
		echo " ";
		echo " ";
		echo " ";
		echo "Done!";
