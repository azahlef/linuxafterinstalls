#!/bin/bash

# repo setup, system update, drivers, build-essential
sudo apt-add-repository multiverse
sudo apt-add-repository universe
sudo apt-add-repository restricted
sudo apt-add-repository main
sudo apt update -y && sudo apt upgrade -y
sudo apt autoremove -y
sudo ubuntu-drivers autoinstall
sudo apt install build-essential
sudo apt install software-properties-common

# editors
sudo apt install -y nano vim micro

# install openssh-server
sudo apt install -y openssh-server
sudo apt install -y openssh-client
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# python
sudo apt install -y python3-pip
sudo pip install --upgrade pip
sudo pip install venv pandas numpy scipy matplotlib seaborn scrapy scikit-learn tensorflow

# firewall setup
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow proto tcp from 10.0.0.0/8 to any port 5900
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable



sudo apt install -y neofetch
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y vim
sudo apt install -y net-tools
sudo apt install -y openssh-server
sudo apt install -y openssh-client
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y python3-dev
sudo apt install -y build-essential
sudo apt install -y libssl-dev
sudo apt install -y libffi-dev
sudo apt install -y python3-setuptools
sudo apt install -y htop btop
sudo apt install -y apt-transport-https
