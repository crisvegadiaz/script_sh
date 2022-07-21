#! /bin/bash

sudo apt install neofetch -y
sudo apt install tilix -y
sudo apt install vlc -y
sudo apt install redshift redshift-gtk -y
sudo apt install synaptic -y
sudo apt install rar unrar unrar-free zip unzip unace unace-nonfree bzip2 lzop p7zip-full p7zip-rar gzip lzip -y

# Iconos Papirus
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme -y

#tema Adapta
sudo apt-add-repository ppa:tista/adapta
sudo apt-get install adapta-gtk-theme -y

# ZSH
sudo apt install zsh -y
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# COLOR DE LA TERMINAL
sudo apt install imagemagick -y
sudo apt install python3-pip -y
sudo pip3 install pywal -y
sed -i '$a ' .zshrc
sed -i '$a #COLOR DE LA TERMINAL' .zshrc
sed -i '$a #wallpaper=$(gsettings get org.gnome.desktop.background picture-uri)' .zshrc
sed -i '$a #wallpaper=${wallpaper/file:\/\//""}' .zshrc
sed -i '$a #wallpaper=${wallpaper//\/""}' .zshrc
sed -i '$a wal -n -q -i /home/cristian/Imágenes/' .zshrc

