#! /bin/bash

#Paleta de colores texto
function texColor(){
    
    mensaje="$1"
    tipo="$2"
    
    arry1=(31 32 33 34 35)
    arry2=('red' 'green' 'yellow' 'blue' 'purple')
    
    for (( c=0; c<=${#arry2[@]}; c++ ))
    do
        if [[ $tipo == ${arry2[c]} ]]; then
            echo -en "\e[${arry1[c]}m${mensaje}\e[0m"
        fi
    done
}

echo $0

texColor "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀█   █▀█ █▀█ █▀█ █▀▀ █▀█ ▄▀█ █▀▄▀█ ▄▀█ █▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▀▄   █▀▀ █▀▄ █▄█ █▄█ █▀▄ █▀█ █░▀░█ █▀█ ▄█
" purple
printf "\n\n"
texColor "Debe usar Sudo:" yellow
printf "\n\n"

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n"
texColor "
█▀▄ █▄░█ █▀▀
█▄▀ █░▀█ █▀░
" purple

texColor ""
arry1=('git' 'tmux' 'htop' 'neofetch' 'tree' 'locate' 'curl' 'neovim' 'ncdu')

for i in "${arry1[@]}"
do
    printf "\n\n"
    texColor " Programa a Intalar ${i}" green
    printf "\n\n"
    dnf install ${i} -y
    printf "\n\n"
    texColor "_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶" yellow
done
printf "\n"
texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n"
texColor "
█▀ █▄░█ ▄▀█ █▀█
▄█ █░▀█ █▀█ █▀▀
" purple

arry2=('bottom' 'speedtest-cli' 'cpufetch')

for i in "${arry2[@]}"
do
    printf "\n\n"
    texColor " Programa a Intalar ${i}" green
    printf "\n\n"
    snap install ${i}
    printf "\n\n"
    texColor "_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶" yellow
done
printf "\n"
texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n"
texColor "
█▀▀ █░░ ▄▀█ ▀█▀ █▀█ ▄▀█ █▄▀
█▀░ █▄▄ █▀█ ░█░ █▀▀ █▀█ █░█
" purple

arry3=('telegram')

for i in "${arry3[@]}"
do
    printf "\n\n"
    texColor " Programa a Intalar ${i}" green
    printf "\n\n"
    flatpak install ${i} -y
    printf "\n\n"
    texColor "_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶_̶" yellow
done
printf "\n"
texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
