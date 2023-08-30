!#/bin/bash

#Mise a jour du systeme
sudo apt update && sudo apt-get upgrade -y

#Telechargement des packages 
wget -O - https://download.gluster.org/pub/gluster/glusterfs/8/rsa.pub | apt-key add -
echo deb [arch=amd64] https://download.gluster.org/pub/gluster/glusterfs/9/LATEST/Debian/buster/amd64/apt buster main > /etc/apt/sources.list.d/gluster.list

#Installation du service glusterfs
apt-get install glusterfs-server

#Installation de L'outils de provionning de l'espace de stockage
dpkg -L thin-provisioning-tools
apt-get install lvm2 thin-provisionning-tools

#Installation de l'outils XFS
apt-get install xfsprogs

