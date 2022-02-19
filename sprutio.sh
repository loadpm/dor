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

## Docker
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
yum install docker-ce docker-ce-cli containerd.io -y
systemctl enable docker.service
systemctl start docker
### sprut.io
mkdir /opt/sprutio && cd /opt/sprutio
wget https://raw.githubusercontent.com/LTD-Beget/sprutio/master/run.sh
chmod +x run.sh && ./run.sh
tee /lib/systemd/system/sprutio.service <<-'EOF'
[Unit]
Description=Sprutio
After=multi-user.target

[Service]
Type=idle
ExecStart=/opt/sprutio/run.sh

[Install]
WantedBy=multi-user.target
EOF

chmod 644 /lib/systemd/system/sprutio.service
systemctl daemon-reload
systemctl enable sprutio.service
systemctl start sprutio.service


		echo "Done!";
		echo " ";
		echo " ";
		echo " ";
		echo " ";
		echo " ";
		echo "PLEASE REBOOT THE SERVER ONCE YOU HAVE COPIED THE DETAILS ABOVE. REBOOT COMMAND:    shutdown -r now";
