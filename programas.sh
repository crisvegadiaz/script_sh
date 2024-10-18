#!/bin/bash
source ./comandos/textoColor.sh

# Función para detectar la distribución de Linux
function detectarDistro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo $ID
    else
        echo 'desconocido'
    fi
}

# Mostrar título
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
texColor '      🐧 INSTALADOR MULTIPLATAFORMA     ' green
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
printf '\n'

# Detectar distribución
distro=$(detectarDistro)
texColor 'Detectando distribución: $distro' yellow
printf '\n'

# Listas de programas a instalar
programas_base=('snapd' 'flatpak' 'git' 'tmux' 'htop' 'neofetch' 'tree' 'locate' 'curl' 'neovim' 'ncdu')
programas_snap=('bottom' 'speedtest-cli' 'cpufetch')
programas_flatpak=('telegram')

# Función para instalar programas según el gestor de paquetes
function instalarPaquete() {
    local paquete='$1'
    case $distro in
        fedora)
            sudo dnf install -y '$paquete'
            ;;
        arch | manjaro)
            sudo pacman -Syu --noconfirm '$paquete'
            ;;
        ubuntu | debian)
            sudo apt update && sudo apt install -y '$paquete'
            ;;
        *)
            texColor '❌ Distribución no soportada: $distro' red
            return 1
            ;;
    esac
}

# Instalación de programas básicos
for prog in '${programas_base[@]}'; do
    printf '\n'
    texColor 'Instalando: $prog' green
    printf '\n'
    instalarPaquete '$prog'
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
done

# Instalación de programas vía Snap
for prog in '${programas_snap[@]}'; do
    printf '\n'
    texColor 'Instalando con Snap: $prog' green
    printf '\n'
    sudo snap install '$prog'
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
done

# Instalación de programas vía Flatpak
for prog in '${programas_flatpak[@]}'; do
    printf '\n'
    texColor 'Instalando con Flatpak: $prog' green
    printf '\n'
    sudo flatpak install -y '$prog'
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
done

# Finalizar el script
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
texColor '     ✅ INSTALACIÓN COMPLETADA ✅       ' green
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
