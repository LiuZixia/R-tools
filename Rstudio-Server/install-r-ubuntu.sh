#!/bin/bash
apt install --no-install-recommends software-properties-common dirmngr -y
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
apt install r-base-dev -y
apt install gdebi-core -y
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb
yes | gdebi rstudio-server-1.4.1717-amd64.deb
