#!/bin/bash

sudo pacman -Syyuu

sudo systemctl enable bluetooth && sudo systemctl start bluetooth

# firewall ufw
sudo pacman -S ufw

sudo systemctl enable ufw && sudo systemctl start ufw

sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable

# print services
sudo pacman -S cups bluez-cups cups-browsed cups-pdf system-config-printer ipp-usb gutenprint hplip foomatic-db foomatic-db-gutenprint-ppds foomatic-db-nonfree foomatic-db-nonfree-ppds foomatic-db-ppds
#print-manager

sudo systemctl enable cups && sudo systemctl start cups

#firefox gesture mod
#echo 'MOZ_ENABLE_WAYLAND=1 firefox' | sudo tee -a /etc/environment

#other stuff
sudo pacman -S pacman-contrib mpv lrzip lzop compress lzip gparted bash-completion dnsmasq lxc neofetch libimobiledevice gvfs-gphoto2 gvfs-afc nftables libreoffice-fresh cpupower networkmanager-l2tp networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-strongswan networkmanager-vpnc network-manager-sstp ntfs-3g snapper gptfdisk micro
#spectacle
#kfind
#dolphin-plugins

#install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

#install aur packages

#hyprland-git
#git clone https://aur.archlinux.org/hyprland-git.git
#cd hyprland-git
#makepkg -si
#cd

#visual-studio-code-bin
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si
cd

#ttf-ms-fonts
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts
makepkg -si
cd

#ventoy-bin
git clone https://aur.archlinux.org/ventoy-bin.git
cd ventoy-bin
makepkg -si
cd

#spotify
git clone https://aur.archlinux.org/spotify.git
cd spotify
makepkg -si
cd

#pamac-aur
git clone https://aur.archlinux.org/pamac-all.git
cd pamac-all
makepkg -si
cd

#zoom
git clone https://aur.archlinux.org/zoom.git
cd zoom
makepkg -si
cd

#wlogout
got clone https://aur.archlinux.org/wlogout.git
cd wlogout
makepkg -si
cd

#aurutils
git clone https://aur.archlinux.org/aurutils.git
cd aurutils
makepkg -si
cd

#btrfs-assistant
git clone https://aur.archlinux.org/btrfs-assistant.git
cd btrfs-assistant
makepkg -si
cd

#qbittorrent-enhanced
git clone https://aur.archlinux.org/qbittorrent-enhanced.git
cd qbittorrent-enhanced
makepkg -si
cd

#jetbrains-toolbox
git clone https://aur.archlinux.org/jetbrains-toolbox.git
cd jetbrains-toolbox
makepkg -si
cd

#auto-cpufreq
git clone https://aur.archlinux.org/auto-cpufreq.git
cd auto-cpufreq
makepkg -si
cd

#appimagelauncher
git clone https://aur.archlinux.org/appimagelauncher.git
cd appimagelauncher
makepkg -si
cd

#jdk-temurin
git clone https://aur.archlinux.org/jdk-temurin.git
cd jdk-temurin
makepkg -si
cd

#vmware-workstation
git clone https://aur.archlinux.org/vmware-workstation.git
cd vmware-workstation
makepkg -si
cd

#debtap
git clone https://aur.archlinux.org/debtap.git
cd debtap
makepkg -si
cd

#shutter-encoder-bin
gir clone https://aur.archlinux.org/shutter-encoder-bin.git
cd shutter-encoder-bin
makepkg -si
cd

#git-extras
git clone https://aur.archlinux.org/git-extras.git
cd git-extras
makepkg -si
cd

#tradingview
git clone https://aur.archlinux.org/tradingview.git
cd tradingview
makepkg -si
cd

#mongodb
git clone https://aur.archlinux.org/mongodb.git
cd mongodb
makepkg -si
cd
sudo systemctl enable --now mongodb && sudo systemctl start mongodb

git clone https://aur.archlinux.org/mongosh-bin.git
cd mongosh-bin
makepkg -si
cd

git clone https://aur.archlinux.org/mongodb-compass.git
cd mongodb-compass
makepkg -si
cd

git clone https://aur.archlinux.org/mongodb-tools.git
cd mongodb-tools
makepkg -si
cd

#edge
git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
cd microsoft-edge-stable-bin
makepkg -si
cd

#preload
git clone https://aur.archlinux.org/preload.git
cd preload
makepkg -si
cd

#cisco-anyconnect
git clone https://aur.archlinux.org/cisco-anyconnect.git
cd cisco-anyconnect
makepkg -si
cd

#github-desktop-bin
git clone https://aur.archlinux.org/github-desktop-bin.git
cd github-desktop-bin
makepkg -si
cd

#rapidminer-studio
git clone https://aur.archlinux.org/rapidminer-studio.git
cd rapidminer-studio
makepkg -si
cd

#wine-stable
git clone https://aur.archlinux.org/wine-stable.git
cd wine-stable
makepkg -si
cd

# vmware
sudo systemctl enable --now vmware-networks-configuration.service && sudo systemctl start vmware-networks-configuration.service
sudo systemctl enable --now vmware-networks.service && sudo systemctl start vmware-networks.service
sudo systemctl enable --now vmware-usbarbitrator.service && sudo systemctl start vmware-usbarbitrator.service
sudo systemctl enable --now vmware-hostd.service && sudo systemctl start vmware-hostd.service
sudo modprobe -a vmw_vmci vmmon

#auto-cpufreq
sudo systemctl enable --now auto-cpufreq && sudo systemctl start auto-cpufreq

#debtap
sudo debtap -u
sudo pacman -Syyuu

#ansible && terraform
sudo pacman -S ansible ansible-bender ansible-language-server ansible-lint terraform

#ansible-collection-community-general
git clone https://aur.archlinux.org/ansible-collection-community-general.git
cd ansible-collection-community-general
makepkg -si
cd

#semaphore-bin
git clone https://aur.archlinux.org/semaphore-bin.git
cd semaphore-bin
makepkg -si
cd

#python-ansible-toolbox
git clone https://aur.archlinux.org/python-ansible-toolbox.git
cd python-ansible-toolbox
makepkg -si
cd

#ansible-bundler 
git clone https://aur.archlinux.org/ansible-bundler.git
cd ansible-bundler
makepkg -si
cd

#ansible-aur
git clone https://aur.archlinux.org/ansible-aur.git
cd ansible-aur
makepkg -si
cd

#tflint
git clone https://aur.archlinux.org/tflint.git
cd tflint
makepkg -si
cd

#terraform-ls
git clone https://aur.archlinux.org/terraform-ls.git
cd terraform-ls
makepkg -si
cd


#tailscale
curl -fsSL https://tailscale.com/install.sh | sh
