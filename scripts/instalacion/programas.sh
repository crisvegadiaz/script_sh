#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." >/dev/null 2>&1 && pwd)"

if [ -f "$PROJECT_ROOT/lib/comandos/textoColor.sh" ]; then
    source "$PROJECT_ROOT/lib/comandos/textoColor.sh"
else
    echo "No se encontró textoColor.sh" >&2
    exit 1
fi

function detectarDistro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        printf '%s\n' "${ID:-desconocido}"
    else
        printf '%s\n' "desconocido"
    fi
}

function requiereSudo() {
    if [ "$(id -u)" -ne 0 ]; then
        if command -v sudo >/dev/null 2>&1; then
            printf '%s\n' "sudo"
        else
            texColor "❌ Se requiere sudo o ejecutar el script como root." red
            exit 1
        fi
    else
        printf '%s\n' ""
    fi
}

function esInstalado() {
    local paquete="$1"
    case "$distro" in
        fedora)
            rpm -q "$paquete" >/dev/null 2>&1
            ;;
        arch|manjaro)
            pacman -Qi "$paquete" >/dev/null 2>&1
            ;;
        ubuntu|debian|linuxmint|pop)
            dpkg -s "$paquete" >/dev/null 2>&1
            ;;
        *)
            return 1
            ;;
    esac
}

function instalarPaquete() {
    local paquete="$1"

    if esInstalado "$paquete"; then
        texColor "✔ Ya instalado: $paquete" green
        return 0
    fi

    case "$distro" in
        fedora)
            texColor "Instalando $paquete con dnf..." yellow
            $SUDO dnf install -y "$paquete"
            ;;
        arch|manjaro)
            texColor "Instalando $paquete con pacman..." yellow
            $SUDO pacman -Syu --noconfirm "$paquete"
            ;;
        ubuntu|debian|linuxmint|pop)
            texColor "Actualizando repositorios para $paquete..." yellow
            $SUDO apt-get update
            texColor "Instalando $paquete con apt-get..." yellow
            $SUDO apt-get install -y "$paquete"
            ;;
        *)
            texColor "❌ Distribución no soportada: $distro" red
            return 1
            ;;
    esac
}

function instalarSnap() {
    local paquete="$1"

    if ! command -v snap >/dev/null 2>&1; then
        texColor "⚠ snap no está disponible en este sistema; se omite: $paquete" yellow
        return 0
    fi

    if snap list "$paquete" >/dev/null 2>&1; then
        texColor "✔ Ya instalado con Snap: $paquete" green
        return 0
    fi

    texColor "Instalando con Snap: $paquete" green
    $SUDO snap install "$paquete"
}

function instalarFlatpak() {
    local paquete="$1"

    if ! command -v flatpak >/dev/null 2>&1; then
        texColor "⚠ flatpak no está disponible en este sistema; se omite: $paquete" yellow
        return 0
    fi

    if flatpak list --app | grep -qi "^${paquete}$"; then
        texColor "✔ Ya instalado con Flatpak: $paquete" green
        return 0
    fi

    texColor "Instalando con Flatpak: $paquete" green
    $SUDO flatpak install -y "$paquete"
}

# Mostrar título
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
texColor '      🐧 INSTALADOR MULTIPLATAFORMA     ' green
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
printf '\n'

distro=$(detectarDistro)
texColor "Sistema detectado: $distro" yellow
printf '\n'

SUDO="$(requiereSudo)"

if [ -z "$SUDO" ]; then
    texColor "Ejecutando como root." green
else
    texColor "Usando sudo para instalar paquetes." yellow
fi

programas_base=("git" "tmux" "htop" "neofetch" "tree" "locate" "curl" "neovim" "ncdu")
programas_snap=("bottom" "speedtest-cli" "cpufetch")
programas_flatpak=("telegram")

for prog in "${programas_base[@]}"; do
    printf '\n'
    texColor "Procesando: $prog" cyan
    instalarPaquete "$prog" || texColor "❌ No se pudo instalar $prog" red
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
    printf '\n'
done

for prog in "${programas_snap[@]}"; do
    printf '\n'
    instalarSnap "$prog" || texColor "❌ No se pudo instalar con Snap: $prog" red
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
    printf '\n'
done

for prog in "${programas_flatpak[@]}"; do
    printf '\n'
    instalarFlatpak "$prog" || texColor "❌ No se pudo instalar con Flatpak: $prog" red
    texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' yellow
    printf '\n'
done

texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
texColor '     ✅ INSTALACIÓN COMPLETADA ✅       ' green
texColor '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄' blue
