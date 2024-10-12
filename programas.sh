#!/bin/bash

# Función para mostrar texto con colores
function texColor() {
    mensaje="$1"
    tipo="$2"
    colores=(31 32 33 34 35)
    nombres=('rojo' 'verde' 'amarillo' 'azul' 'morado')

    for i in "${!nombres[@]}"; do
        if [[ $tipo == "${nombres[i]}" ]]; then
            echo -e "\e[${colores[i]}m${mensaje}\e[0m"
        fi
    done
}

# Función para detectar la distribución de Linux
function detectarDistro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo $ID
    else
        echo "desconocido"
    fi
}

# Mostrar título
texColor "---------------------------------------------" azul
texColor "       🐧 INSTALADOR MULTIPLATAFORMA         " verde
texColor "---------------------------------------------" azul
printf "\n"

# Detectar distribución
distro=$(detectarDistro)
texColor "Detectando distribución: $distro" amarillo
printf "\n"

# Listas de programas a instalar
programas_base=('snapd' 'flatpak' 'git' 'tmux' 'htop' 'neofetch' 'tree' 'locate' 'curl' 'neovim' 'ncdu')
programas_snap=('bottom' 'speedtest-cli' 'cpufetch')
programas_flatpak=('telegram')

# Función para instalar programas según el gestor de paquetes
function instalarPaquete() {
    local paquete="$1"
    case $distro in
        fedora)
            sudo dnf install -y "$paquete"
            ;;
        arch | manjaro)
            sudo pacman -Syu --noconfirm "$paquete"
            ;;
        ubuntu | debian)
            sudo apt update && sudo apt install -y "$paquete"
            ;;
        *)
            texColor "❌ Distribución no soportada: $distro" rojo
            return 1
            ;;
    esac
}

# Instalación de programas básicos
for prog in "${programas_base[@]}"; do
    printf "\n"
    texColor "Instalando: $prog" verde
    printf "\n"
    instalarPaquete "$prog"
    texColor "---------------------------------------------" amarillo
done

# Instalación de programas vía Snap
for prog in "${programas_snap[@]}"; do
    printf "\n"
    texColor "Instalando con Snap: $prog" verde
    printf "\n"
    sudo snap install "$prog"
    texColor "---------------------------------------------" amarillo
done

# Instalación de programas vía Flatpak
for prog in "${programas_flatpak[@]}"; do
    printf "\n"
    texColor "Instalando con Flatpak: $prog" verde
    printf "\n"
    sudo flatpak install -y "$prog"
    texColor "---------------------------------------------" amarillo
done

# Finalizar el script
texColor "---------------------------------------------" azul
texColor "        ✅ INSTALACIÓN COMPLETADA ✅          " verde
texColor "---------------------------------------------" azul
