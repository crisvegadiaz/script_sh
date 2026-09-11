#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." >/dev/null 2>&1 && pwd)"

if [ -f "$PROJECT_ROOT/lib/comandos/textoColor.sh" ]; then
    source "$PROJECT_ROOT/lib/comandos/textoColor.sh"
else
    echo "No se encontró textoColor.sh" >&2
    exit 1
fi

texColor "Configuración de Git" yellow 
printf "\n"
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
printf "\n\n"

texColor "Ingrese un nombre ☺️ :" purple
read -r name
git config --global user.name "$name"  # Añadido comillas

texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
printf "\n\n"

texColor "Ingrese un email ✉️ : " purple
read -r email
git config --global user.email "$email"  # Añadido comillas

texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
printf "\n\n"

texColor "Ingrese el editor 👨‍💻 : " purple
read -r editor
git config --global core.editor "$editor"  # Añadido comillas
git config --global -e

texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
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
