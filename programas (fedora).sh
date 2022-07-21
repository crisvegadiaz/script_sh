#! /bin/bash

sudo dnf install neofetch -y
sudo dnf install tilix -y
sudo dnf install vlc -y
sudo dnf install redshift redshift-gtk -y
sudo dnf install synaptic -y
sudo dnf install rar unrar unrar-free zip unzip unace unace-nonfree bzip2 lzop p7zip-full p7zip-rar gzip lzip -y

# Iconos Papirus


#tema Adapta

# ZSH
sudo dnf install zsh -y
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# COLOR DE LA TERMINAL
sudo dnf install imagemagick -y
sudo dnf install python3-pip -y
sudo pip3 install pywal -y
sed -i '$a ' .zshrc
sed -i '$a #COLOR DE LA TERMINAL' .zshrc
sed -i '$a #wallpaper=$(gsettings get org.gnome.desktop.background picture-uri)' .zshrc
sed -i '$a #wallpaper=${wallpaper/file:\/\//""}' .zshrc
sed -i '$a #wallpaper=${wallpaper//\/""}' .zshrc
sed -i '$a wal -n -q -i /home/cristian/Imágenes/' .zshrc

