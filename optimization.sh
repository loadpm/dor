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

#ulimits
echo 'fs.file-max = 500000' >> /etc/sysctl.conf
tee /etc/security/limits.conf <<-'EOF'
* soft nproc 500000
* hard nproc 500000
* soft nofile 500000
* hard nofile 500000
EOF

sysctl -p
#permanent
ulimit -n 500000
ulimit -u 500000

# dhparams
openssl dhparam -dsaparam -out /etc/nginx/dhparam.pem 4096

# nginx
wget https://raw.githubusercontent.com/loadpm/dor/master/nginx_fast.conf -O /etc/nginx/nginx.conf

#bad bot
wget https://raw.githubusercontent.com/loadpm/dor/master/ddos.conf -O /etc/nginx/fastpanel2-includes/ddos.conf

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
