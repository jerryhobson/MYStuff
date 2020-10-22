#!/bin/bash

clear
echo "*****Docker Install Script*****"
echo "*******************************"
apt update && apt upgrade -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt autoremove -y
clear
echo "******Installing Docker and Docker-Compose*****"
echo "***********************************************"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y docker-compose
clear
sleep 3 && clear && echo ">>>Docker and Docker-Compose Versions<<<" && docker --version && docker-compose --version && echo "********************************************"
sleep 3
clear
echo "*****Testing Docker*****"
echo "************************"
sleep 3
docker run hello-world
sleep 3
clear
echo "*****Portainer Install*****"
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
echo ">>>>Login to Portainer using IP Address:9000<<<<"
echo "*****Below is your IP Address*****"
ip -4 addr show ens3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'


