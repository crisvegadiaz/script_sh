#!/bin/bash

# Función para mostrar texto con colores
function texColor() {
    local mensaje="$1"
    local tipo="$2"

    # Mapa asociativo con los colores
    declare -A colores=(
        [rojo]=31
        [verde]=32
        [amarillo]=33
        [azul]=34
        [morado]=35
    )

    # Verificar si el color proporcionado existe en el mapa
    if [[ -n ${colores[$tipo]} ]]; then
        echo -e "\e[${colores[$tipo]}m${mensaje}\e[0m"
    else
        echo "Color no válido. Colores disponibles: rojo, verde, amarillo, azul, morado."
    fi
}

# Verificar si se proporcionaron los argumentos
if [[ $# -ne 2 ]]; then
    echo "Uso: $0 'mensaje' 'color'"
    echo "Colores disponibles: rojo, verde, amarillo, azul, morado."
    exit 1
fi

# Llamar a la función con los argumentos proporcionados
texColor "$1" "$2"
