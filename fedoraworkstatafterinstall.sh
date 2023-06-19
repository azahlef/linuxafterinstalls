#! /bin/bash

#update 
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

# enable flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub
flatpak update -y

# update firmware
sudo dnf update -y 
sudo dnf autoremove -y 
sudo fwupdmgr get-devices -y
sudo fwupdmgr refresh --force -y
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

# install unpackers
sudo dnf install -y unzip p7zip p7zip-plugins unrar

# install mutimedia stuff
sudo dnf groupupdate -y --allowerasing sound-and-video
sudo dnf groupinstall -y --allowerasing multimedia
sudo dnf install -y libdvdcss libdrm-devel gtk3-devel pkg-config
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia
sudo dnf install -y vlc
sudo dnf install -y ffmpeg ffmpeg-libs libva libva-utils
sudo dnf install -y intel-media-driver

# install gnome-tweaks & customizers
sudo dnf install -y gnome-tweaks gnome-extensions-app 
sudo dnf install -y grub-customizer #TODO add "mitigations=off" and "zswap.enabled=1" in Kernel Parameters under General Settings in Grub Customizer

# install libreoffice suite
sudo dnf install -y libreoffice

# install extra fonts
sudo dnf install -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts google-noto-sans-fonts
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install -y mscore-fonts-all

# install power management
sudo dnf install -y tlp tlp-rdw
sudo systemctl mask power-profiles-daemon
sudo dnf install -y powertop
sudo powertop --auto-tune

# KVM virtualization software
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm
sudo dnf -y install libvirt-devel virt-top libguestfs-tools guestfs-tools
sudo systemctl enable libvirtd
sudo dnf -y install virt-manager

# install network stuff
sudo dnf install -y openconnect NetworkManager-openconnect NetworkManager-openconnect-gnome
sudo dnf install -y openvpn NetworkManager-openvpn NetworkManager-openvpn-gnome
sudo dnf install -y blueman

# install balena-etcher
curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.rpm.sh' | sudo -E bash
sudo dnf install -y balena-etcher

# install brave browser
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser

# get vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-toolsai.jupyter
code --install-extension visualstudioexptteam.vscodeintel
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension formulahendry.code-runner
code --install-extension cschlosser.doxdocgen
code --install-extension vscjava.vscode-java-pack
code --install-extension github.copilot
code --install-extension github.copilot-labs
code --install-extension github.heygithub
code --install-extension visualstudioexptteam.vscodeintellicode-completions
code --install-extension ms-vscode.live-server
code --install-extension ms-python.pylint
code --install-extension tomoki1207.pdf
code --install-extension jeff-hykin.better-cpp-syntax
code --install-exrension hars.cppsnippets

# install editors
sudo dnf install -y vim nano micro

# tilix
sudo dnf install -y tilix tilix-nautilus

# install guake
sudo dnf install -y guake

# install zeal
sudo dnf install -y zeal

# install octave
sudo dnf install -y octave

# install filezilla
sudo dnf install -y filezilla

# install neofetch
sudo dnf install -y neofetch

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

# installing docker
#sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
#sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service
#sudo systemctl start docker
#sudo groupadd docker
#sudo usermod -aG docker $USER
#sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0 && sudo firewall-cmd --reload
#sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
#wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.13.0-x86_64.rpm
#sudo dnf install -y docker-desktop-4.13.0-x86_64.rpm

# install wine
sudo dnf install -y wine

# install dnfdragora
sudo dnf install -y dnfdragora

# install htop and btop
sudo dnf install -y htop btop

# LaTeX
sudo dnf install -y texlive-scheme-full
sudo dnf install -y texstudio

# enable fractional scaling, maximize/minimize buttons plus more gnome tweaks
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.wm.preferences button-layout ':close'
gsettings set org.gnome.gedit.preferences.editor auto-save true
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor tab-size 4
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature "5000"
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing "rgba"
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting "slight"
gsettings set org.gnome.Terminal.Legacy.Settings dark-theme true
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true

# save your eyes and install redshift
sudo dnf install -y redshift

# install ufw and set up firewall
sudo dnf install -y ufw
sudo systemctl enable --now ufw.service
sudo systemctl disable --now firewalld.service
#sudo wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
#sudo chmod +x /usr/local/bin/ufw-docker
#ufw-docker install
sudo systemctl restart ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow proto tcp from 10.0.0.0/8 to any port 5900
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable

#install ssh and enable 
sudo dnf install -y openssh-server
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
sudo systemctl restart sshd.service

# generate ssh keys
# ssh-keygen -t ed25519 -C "alexis.aguilar1892@gmail.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519

# import ssh keys after putting .ssh folder on /home/aaguilar
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# install fail2ban and set up
#sudo dnf install -y fail2ban
#echo '[DEFAULT]' | sudo tee -a $HOME/jail.local
#echo 'ignoreip = 127.0.0.1/8 ::1' | sudo tee -a $HOME/jail.local
#echo 'bantime = 3600' | sudo tee -a $HOME/jail.local
#echo 'findtime = 600' | sudo tee -a $HOME/jail.local
#echo 'maxretry = 5' | sudo tee -a $HOME/jail.local
#echo '' | sudo tee -a $HOME/jail.local
#echo '[sshd]' | sudo tee -a $HOME/jail.local
#echo 'enabled = true' | sudo tee -a $HOME/jail.local
#sudo cp jail.local /etc/fail2ban/
#sudo systemctl enable fail2ban
#sudo systemctl start fail2ban

#install twingate
curl -s https://binaries.twingate.com/client/linux/install.sh | sudo bash

# reboot system
sudo reboot now
