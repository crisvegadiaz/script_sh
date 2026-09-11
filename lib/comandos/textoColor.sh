#!/bin/bash

# Función para mostrar texto con colores
function texColor() {
    local mensaje="$1"
    local tipo="$2"
    
    # Mapa asociativo con los colores (soporta español e inglés)
    declare -A colores=(
        [red]=31       [rojo]=31
        [green]=32     [verde]=32
        [yellow]=33    [amarillo]=33
        [blue]=34      [azul]=34
        [purple]=35    [morado]=35    [purpura]=35
        [cyan]=36      [celeste]=36
        [white]=37     [blanco]=37
    )
    
    # Verificar si el color proporcionado existe en el mapa
    if [[ -n ${colores[$tipo]} ]]; then
        echo -e "\e[${colores[$tipo]}m${mensaje}\e[0m"
    else
        # Si no se encuentra el color, se muestra el mensaje sin color
        echo "$mensaje"
    fi
}


