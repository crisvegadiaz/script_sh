#!/bin/bash

# Función para mostrar texto con colores
function texColor() {
    local mensaje="$1"
    local tipo="$2"
    
    # Mapa asociativo con los colores
    declare -A colores=(
        [red]=31
        [green]=32
        [yellow]=33
        [blue]=34
        [purple]=35
    )
    
    # Verificar si el color proporcionado existe en el mapa
    if [[ -n ${colores[$tipo]} ]]; then
        echo -e "\e[${colores[$tipo]}m${mensaje}\e[0m"
    else
        echo "Color no válido. Colores disponibles: red, green, yellow, blue, purple."
    fi
}

