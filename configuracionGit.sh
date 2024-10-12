#!/bin/bash

function texColor() {
    mensaje="$1"
    tipo="$2"
    
    arry1=(31 32 33 34 35)
    arry2=('red' 'green' 'yellow' 'blue' 'purple')
    
    for (( c=0; c<${#arry2[@]}; c++ ))  # Cambiado para evitar "out of bounds"
    do
        if [[ $tipo == ${arry2[c]} ]]; then
            echo -en "\e[${arry1[c]}m${mensaje}\e[0m"
            return  # Salir una vez que se encuentra el tipo
        fi
    done
}

texColor "Configuración de Git" yellow 
printf "\n"
texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese un nombre ☺️ :" purple
read -r name
git config --global user.name "$name"  # Añadido comillas

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese un email ✉️ : " purple
read -r email
git config --global user.email "$email"  # Añadido comillas

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese el editor 👨‍💻 : " purple
read -r editor
git config --global core.editor "$editor"  # Añadido comillas
git config --global -e

texColor "▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ " blue
printf "\n\n"

texColor "Ingrese el sistema operativo (🪟 windows, 🐧 linux, 🍎 mac) : " purple
read -r sistema
if [[ $sistema == "windows" ]]; then 
    echo "🪟 windows: True"
    git config --global core.autocrlf true
elif [[ $sistema == "linux" ]]; then
    echo "🐧 linux: input"
    git config --global core.autocrlf input
elif [[ $sistema == "mac" ]]; then
    echo "🍎 mac: input"
    git config --global core.autocrlf input
else 
    echo "No válido operativo ❌"
fi
