#!/bin/bash
wget -O /etc/yum.repos.d/CentOS-Base.repo 'https://raw.githubusercontent.com/LiuZixia/R-tools/master/Rstudio-Server/CentOS-Base.repo'
yum clean all
yum update -y
yum install sudo -y
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo subscription-manager repos --enable "rhel-*-optional-rpms" -y
export R_VERSION=3.6.3
curl -O https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpm
sudo yum install R-${R_VERSION}-1-1.x86_64.rpm -y
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
sudo useradd rstudio -d /data
chown -R rstudio /data
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.959-x86_64.rpm
sudo yum install rstudio-server-rhel-1.3.959-x86_64.rpm -y
echo -e "www-port=80\nwww-address=0.0.0.0" > /etc/rstudio/rserver.conf
sudo rstudio-server restart
echo "CloudRaft2020" | sudo passwd rstudio --stdin  &>/dev/null
service firewalld stop
systemctl disable firewalld
