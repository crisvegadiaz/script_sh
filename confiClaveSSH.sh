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

if [[ "$respuesta" == "si" ]]; then
    # Generar una nueva clave SSH
    texColor "Ingrese su correo electrónico:" morado
    read -r email
    printf "\n"
    
    # Verificar si ya existe una clave con el mismo nombre
    if [[ -f "$DIR_SSH/id_rsa" ]]; then
        texColor "La clave id_rsa ya existe. ¿Deseas sobreescribirla? (si o no):" rojo
        read -r sobreescribir
        if [[ "$sobreescribir" != "si" ]]; then
            texColor "Operación cancelada." rojo
            exit
        fi
    fi
    
    # Generar la clave SSH
    ssh-keygen -t rsa -b 4096 -C "$email" -f "$DIR_SSH/id_rsa" -N ""
else
    texColor "Operación cancelada. No se generó una nueva clave." morado
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

texColor "Ingrese el nombre de la clave privada (por defecto: id_rsa):" amarillo
read -r clavePrivada
clavePrivada=${clavePrivada:-id_rsa}  # Usar id_rsa por defecto si está vacío

if ssh-add "$DIR_SSH/$clavePrivada"; then
    texColor "Clave agregada exitosamente al agente SSH." verde
else
    texColor "Error al agregar la clave al agente SSH." rojo
    exit
fi

# Verificar si xclip está instalado
if ! command -v xclip &> /dev/null; then
    texColor "xclip no está instalado. Por favor, instala xclip o copia manualmente la clave pública." rojo
    cat "$DIR_SSH/${clavePrivada}.pub"
    exit
fi

# Copiar la clave pública al portapapeles
cat "$DIR_SSH/${clavePrivada}.pub" | xclip -selection clipboard
texColor "La clave pública se ha copiado al portapapeles." verde
