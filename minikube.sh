#!/bin/bash

#Script d'installation et de configuration de Minikube sur un serveur Ubuntu 

#Mise a jour du systeme d'exploitation
sudo apt update && sudo apt-get upgrade -y 

# Recuperation du script d'installation de Docker
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh

#Demarrage du Daemon Docker
sudo service docker start

#Ajout de l'utilisateur Courant au groupe Docker
sudo usermod -aG docker $USER

#Installation des Dependances de Minikube
sudo apt install -y curl wget apt-transport-https

#Telechargement et installation des fichiers Binaires Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube


#Installation de l'invite de commande Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

#Lancement de Minikube
minikube start --driver=docker
