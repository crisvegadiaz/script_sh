#! /bin/sh

function texColor() {
    mensaje="$1"
    tipo="$2"

    declare -A colores=(
        [rojo]=31
        [verde]=32
        [amarillo]=33
        [azul]=34
        [morado]=35
    )

    if [[ ${colores[$tipo]} ]]; then
        echo -e "\e[${colores[$tipo]}m${mensaje}\e[0m"
    fi
}

texColor $1 $2