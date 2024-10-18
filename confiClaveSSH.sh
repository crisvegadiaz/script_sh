#!/bin/bash
source ./comandos/textoColor.sh

# Ruta del directorio SSH
DIR_SSH="/home/$(whoami)/.ssh"

# Imprimir información de la clave SSH
texColor "Ver Clave SSH:" red
printf "\n\n"
ls -la "$DIR_SSH"

# Preguntar al usuario si quieren generar una nueva clave
texColor "¿Quieres generar una nueva? (si o no):" yellow
read -r respuesta
printf "\n\n"

if [[ "$respuesta" == "si" ]]; then
    # Generar una nueva clave SSH
    texColor "Ingrese su correo electrónico:" purple
    read -r email
    printf "\n"
    
    # Verificar si ya existe una clave con el mismo nombre
    if [[ -f "$DIR_SSH/id_rsa" ]]; then
        texColor "La clave id_rsa ya existe. ¿Deseas sobreescribirla? (si o no):" red
        read -r sobreescribir
        if [[ "$sobreescribir" != "si" ]]; then
            texColor "Operación cancelada." red
            exit
        fi
    fi
    
    # Generar la clave SSH
    ssh-keygen -t rsa -b 4096 -C "$email" -f "$DIR_SSH/id_rsa" -N ""
else
    texColor "Operación cancelada. No se generó una nueva clave." purple
    printf "\n"
fi

# Asegurarse de que el agente de claves SSH esté en ejecución
texColor "Asegúrate de que el agente de claves SSH esté en ejecución:" red
printf "\n"
eval "$(ssh-agent -s)"

# Agregar la clave privada al agente SSH
texColor "Agrega tu clave privada SSH al agente:" red
printf "\n"
ls -la "$DIR_SSH"

texColor "Ingrese el nombre de la clave privada (por defecto: id_rsa):" yellow
read -r clavePrivada
clavePrivada=${clavePrivada:-id_rsa}  # Usar id_rsa por defecto si está vacío

if ssh-add "$DIR_SSH/$clavePrivada"; then
    texColor "Clave agregada exitosamente al agente SSH." green
else
    texColor "Error al agregar la clave al agente SSH." red
    exit
fi

# Verificar si xclip está instalado
if ! command -v xclip &> /dev/null; then
    texColor "xclip no está instalado. Por favor, instala xclip o copia manualmente la clave pública." red
    cat "$DIR_SSH/${clavePrivada}.pub"
    exit
fi

# Copiar la clave pública al portapapeles
cat "$DIR_SSH/${clavePrivada}.pub" | xclip -selection clipboard
texColor "La clave pública se ha copiado al portapapeles." green
