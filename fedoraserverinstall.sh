#! /bin/bash

# update system
sudo dnf update -y

# configure dnf
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=true' | sudo tee -a /etc/dnf/dnf.conf

# add all rpm fusion repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade -y --refresh
sudo dnf groupupdate -y core
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf groupupdate -y core

# update firmware
sudo dnf update -y 
sudo dnf autoremove -y 
sudo fwupdmgr get-devices -y
sudo fwupdmgr refresh --force -y
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

# install unpackers
sudo dnf install -y zip unzip p7zip p7zip-plugins unrar

# install editors
sudo dnf install -y vim nano micro

# install htop and btop
sudo dnf install -y htop btop

# install development tools
sudo dnf install -y kernel-headers kernel-devel dkms
sudo dnf group install -y "C Development Tools and Libraries"
sudo dnf group install -y "Development Tools"
sudo dnf group install -y "Headless Management"
sudo dnf group install -y "Python Science"
sudo dnf group install -y "System Tools"
sudo dnf install -y gcc-c++ make cmake git clang 
sudo dnf install -y python3-devel
sudo dnf install -y python3-pip
sudo python -m pip install --upgrade pip
sudo pip install numpy pandas scipy matplotlib seaborn tensorflow nltk pyttsx3 scikit-learn theano scrapy beautifulsoup4 
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 20-tem
sudo dnf install -y nodejs npm

# install web server
sudo dnf install -y httpd
sudo systemctl enable httpd.service
sudo systemctl start httpd.service
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
