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

# install htop and btop and neofetch
sudo dnf install -y htop btop neofetch

# mosh
sudo dnf install -y mosh

# install development tools
sudo dnf install -y kernel-headers kernel-devel dkms
sudo dnf group install -y "C Development Tools and Libraries"
sudo dnf group install -y "Development Tools"
sudo dnf group install -y "Headless Management"
sudo dnf group install -y "Python Science"
sudo dnf group install -y "System Tools"
sudo dnf group install -y "Web Tools"
sudo dnf group install -y "Server Configuration Tools"
sudo dnf group install -y "Hardware Support for Server Systems"
sudo dnf group install -y "Python Classroom"
sudo dnf group install -y "Printing Support"
sudo dnf group install -y "PHP"
sudo dnf group install -y "MariaDB (MySQL) Database"
sudo dnf group install -y "MongoDB Database"
sudo dnf group install -y "Editors"
sudo dnf group install -y "Critical Path (Server)"
sudo dnf group install -y "Development Libraries"
sudo dnf group install -y "Virtualization"
sudo dnf group install -y "Headless Virtualization"
sudo dnf group install -y "Perl Development"
sudo dnf group install -y "Perl for Web"
sudo dnf group install -y "Java"
sudo dnf group install -y "Java Development"
sudo dnf group install -y "Java Application Server"
sudo dnf group install -y "Administration Tools"
sudo dnf install -y gcc-c++ make cmake git clang
sudo dnf install -y ansible*
sudo dnf install -y python3-devel
sudo dnf install -y python3-pip
sudo python -m pip install --upgrade pip
sudo pip install notebook numpy pandas scipy ansible matplotlib polyglot sympy ipython seaborn tensorflow nltk pyttsx3 scikit-learn theano scrapy beautifulsoup4 
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

# install everything cockpit
sudo dnf install -y cockpit*

# don't turn off if lid close
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=ignore/g' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchDocked=suspend/HandleLidSwitchDocked=ignore/g' /etc/systemd/logind.conf
sudo systemctl restart systemd-logind.service