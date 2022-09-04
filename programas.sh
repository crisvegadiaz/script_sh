#! /bin/bash

echo -e "\e[1;34m Debe usar Sudo\e[0m"

# DNF
arry1=('git' 'tmux' 'htop' 'neofetch' 'tree' 'locate' 'curl' 'neovim')

for i in "${arry1[@]}"
do
    echo -e "\e[31m  Programa a Intalar ${i}\e[0m"
    dnf install ${i} -y
    echo -e "\e[1;34m <------------------------>\e[0m"
done

# SNAP
arry2=('bottom' 'speedtest-cli' 'cpufetch')

for i in "${arry2[@]}"
do
    echo -e "\e[31m  Programa a Intalar ${i}\e[0m"
    snap install ${i}
    echo -e "\e[1;34m <------------------------>\e[0m"
done

# FLATPAK
arry3=('telegram')

for i in "${arry3[@]}"
do
    echo -e "\e[31m  Programa a Intalar ${i}\e[0m"
    flatpak install ${i} -y
    echo -e "\e[1;34m <------------------------>\e[0m"
done
