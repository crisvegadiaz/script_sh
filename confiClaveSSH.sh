#!/bin/bash
source ./comandos/textoColor.sh

# Ruta del directorio SSH
DIR_SSH="$HOME/.ssh"

# Crear el directorio SSH si no existe
if [[ ! -d "$DIR_SSH" ]]; then
    texColor "El directorio $DIR_SSH no existe. Creándolo..." yellow
    mkdir -p "$DIR_SSH" || { texColor "Error al crear el directorio $DIR_SSH." red; exit 1; }
fi

# Mostrar contenido del directorio .ssh
texColor "Contenido del directorio SSH:" red
printf "\n"
ls -la "$DIR_SSH"

# Preguntar si se desea generar una nueva clave
texColor "¿Deseas generar una nueva clave SSH? (si/no):" yellow
read -r respuesta
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]' | xargs) # Normalizar entrada

# Validar respuesta
if [[ "$respuesta" == "si" ]]; then
    texColor "Introduce tu correo electrónico para asociar con la clave SSH:" purple
    read -r email

    # Verificar si existe una clave por defecto
    if [[ -f "$DIR_SSH/id_rsa" ]]; then
        texColor "Ya existe una clave SSH llamada id_rsa. ¿Deseas sobrescribirla? (si/no):" red
        read -r sobreescribir
        sobreescribir=$(echo "$sobreescribir" | tr '[:upper:]' '[:lower:]' | xargs)
        
        if [[ "$sobreescribir" != "si" ]]; then
            texColor "Operación cancelada. No se generó una nueva clave." red
            exit 0
        fi
    fi

    # Generar clave SSH
    if ssh-keygen -t rsa -b 4096 -C "$email" -f "$DIR_SSH/id_rsa" -N ""; then
        texColor "Clave SSH generada exitosamente." green
    else
        texColor "Error al generar la clave SSH." red
        exit 1
    fi
elif [[ "$respuesta" == "no" ]]; then
    texColor "No se generó una nueva clave SSH. Finalizando." purple
    exit 0
else
    texColor "Respuesta no válida. Por favor, ejecuta el script de nuevo y responde 'si' o 'no'." red
    exit 1
fi

# Iniciar el agente SSH
texColor "Iniciando el agente SSH..." yellow
if eval "$(ssh-agent -s)"; then
    texColor "Agente SSH iniciado correctamente." green
else
    texColor "Error al iniciar el agente SSH." red
    exit 1
fi

# Agregar clave privada al agente SSH
if ssh-add "$DIR_SSH/id_rsa"; then
    texColor "Clave privada SSH agregada al agente correctamente." green
else
    texColor "Error al agregar la clave privada al agente SSH." red
    exit 1
fi

# Copiar clave pública al portapapeles (si xclip está instalado)
if command -v xclip &> /dev/null; then
    cat "$DIR_SSH/id_rsa.pub" | xclip -selection clipboard
    texColor "La clave pública se ha copiado al portapapeles." green
else
    texColor "xclip no está instalado. Por favor, copia manualmente la clave pública:" red
    cat "$DIR_SSH/id_rsa.pub"
fi
