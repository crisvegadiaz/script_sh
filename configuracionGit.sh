#! /bin/bash 

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

texColor "Ｃｏｎｆｉｇｕｒａｃｉｏｎ ｄｅ Ｇｉｔ" yellow 
printf "\n"
texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese un nombre ☺️ :" purple;
read name;
git config --global user.name $name

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese un email ✉️ : " purple;
read email;
git config --global user.email $email


texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese el editor 👨‍💻 : " purple;
read editor;
git config --global core.editor $editor
git config --global -e

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese un el sitema operativo(🪟 windows,🐧 linux,🍎mac) : " purple;
read sistema;
if [ $sistema = "windows" ] 
then 
    echo " 🪟 windows: True"
    git config --global core.autocrlf true
elif [ $sistema = "linux" ] 
then
    echo "🐧 linux: input"
    git config --global core.autocrlf input
elif [ $sistema = "mac" ] 
then
    echo "🍎 mac: input"
    git config --global core.autocrlf input
else 
    echo "No valido operativo ❌"
fi
