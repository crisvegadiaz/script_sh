#!/bin/bash

# Función para imprimir texto con colores
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

# Ruta del directorio SSH
DIR_SSH="/home/$(whoami)/.ssh"

# Imprimir información de la clave SSH
texColor "Ver Clave SSH:" rojo
printf "\n\n"
ls -la "$DIR_SSH"

# Preguntar al usuario si quieren generar una nueva clave
texColor "¿Quieres generar una nueva? (si o no):" amarillo
read -r respuesta
printf "\n\n"

if [ "$respuesta" == "si" ]; then
    # Generar una nueva clave SSH
    texColor "Ingrese su correo electrónico:" morado
    read -r email
    printf "\n"
    ssh-keygen -t rsa -b 4096 -C "$email" -f "$DIR_SSH/id_rsa"
else
    texColor "No válido" morado
    printf "\n"
fi

# Asegurarse de que el agente de claves SSH esté en ejecución
texColor "Asegúrate de que el agente de claves SSH esté en ejecución:" rojo
printf "\n"
eval "$(ssh-agent -s)"

# Agregar la clave privada al agente SSH
texColor "Agrega tu clave privada SSH al agente:" rojo
printf "\n"
ls -la "$DIR_SSH"

texColor "Ingrese el nombre de la clave privada:" amarillo
read -r clavePrivada
printf "\n\n"
ssh-add "$DIR_SSH/$clavePrivada"

# Verificar si xclip está instalado
if ! command -v xclip &> /dev/null; then
    texColor "xclip no está instalado. Por favor, instálalo para copiar la clave al portapapeles." rojo
    exit
fi

# Copiar la clave pública al portapapeles
cat "$DIR_SSH/${clavePrivada}.pub" | xclip -selection clipboard
texColor "La clave pública se ha copiado al portapapeles." verde

