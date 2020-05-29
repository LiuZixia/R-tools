#!/bin/bash
echo "Install Rstudio-Server (v1.3.959) with custom version.\nBy LiuZixia@GitHub \nUrl: https://github.com/LiuZixia/R-tools"
read -p "Enter R version [3.6.3]: " R_VERSION
R_VERSION=${R_VERSION:-3.6.3}
read -p "Enter Rstudio-Server Web Interface port [80]: " RSTUDIO_PORT
RSTUDIO_PORT=${RSTUDIO_PORT:-80}
yum install sudo -y
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo subscription-manager repos --enable "rhel-*-optional-rpms" -y
curl -O https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpm
sudo yum install R-${R_VERSION}-1-1.x86_64.rpm -y
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
pwhash=$(sudo getent shadow root | cut -d: -f2)
sudo useradd -p "$pwhash" rstudio -d /data
chown -R rstudio /data
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm
sudo yum install rstudio-server-rhel-1.3.959-x86_64.rpm -y
echo "www-port=${RSTUDIO_PORT}" >> /etc/rstudio/rserver.conf
echo "www-address=0.0.0.0" >> /etc/rstudio/rserver.conf
sudo rstudio-server restart
firewall-cmd --zone=public --add-port=${RSTUDIO_PORT}/tcp --permanent
firewall-cmd --reload
