#!/bin/bash

# -----------------------------------------------------------------------------
# Carga dinámica de textoColor.sh con fallback seguro
# -----------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
LIST_FILE="$SCRIPT_DIR/lista.txt"

if [ -f "$SCRIPT_DIR/../comandos/textoColor.sh" ]; then
    source "$SCRIPT_DIR/../comandos/textoColor.sh"
elif [ -f "$SCRIPT_DIR/textoColor.sh" ]; then
    source "$SCRIPT_DIR/textoColor.sh"
elif [ -f "/usr/bin/textoColor.sh" ]; then
    source "/usr/bin/textoColor.sh"
elif [ -f "/usr/local/bin/textoColor.sh" ]; then
    source "/usr/local/bin/textoColor.sh"
else
    function texColor() {
        local mensaje="$1"
        local tipo="$2"
        declare -A colores=([red]=31 [rojo]=31 [green]=32 [verde]=32 [yellow]=33 [amarillo]=33 [blue]=34 [azul]=34 [purple]=35 [morado]=35 [white]=37 [blanco]=37)
        if [[ -n ${colores[$tipo]} ]]; then
            echo -e "\e[${colores[$tipo]}m${mensaje}\e[0m"
        else
            echo "$mensaje"
        fi
    }
fi

# Trapear interrupción de usuario (Ctrl+C)
trap 'echo -e "\n\nOperación cancelada por el usuario."; exit 0' INT

# -----------------------------------------------------------------------------
# Ayuda y uso
# -----------------------------------------------------------------------------
function mostrar_ayuda() {
    texColor "----------------------------------------------------------------------" azul
    texColor "📦 Script para Respaldar y Reinstalar Paquetes RPM / DNF" azul
    texColor "----------------------------------------------------------------------" azul
    echo "Uso: $(basename "$0") [opciones]"
    echo ""
    echo "Opciones:"
    echo "  -b, --backup   Genera un respaldo de los paquetes instalados en lista.txt"
    echo "  -r, --restore  Reinstala los paquetes listados en lista.txt"
    echo "  -h, --help     Muestra esta ayuda"
    echo ""
    echo "Si no se proporcionan opciones, el script abrirá el menú interactivo."
    texColor "----------------------------------------------------------------------" azul
}

# -----------------------------------------------------------------------------
# Funciones principales
# -----------------------------------------------------------------------------
function respaldar_paquetes() {
    texColor "➜ Obteniendo lista de paquetes instalados..." amarillo
    if ! command -v rpm >/dev/null 2>&1; then
        texColor "❌ No se encontró el comando 'rpm' en el sistema." rojo
        return 1
    fi

    rpm -qa | sort > "$LIST_FILE"
    local total
    total=$(wc -l < "$LIST_FILE")
    
    texColor "✅ Lista de paquetes respaldada con éxito." verde
    texColor "📊 Total de paquetes guardados: $total" azul
    texColor "📁 Archivo: $LIST_FILE" azul
}

function restaurar_paquetes() {
    if [[ ! -s "$LIST_FILE" ]]; then
        texColor "⚠️ El archivo lista.txt no existe o está vacío. ($LIST_FILE)" rojo
        texColor "ℹ️ Genera un respaldo primero usando la opción 1 o --backup." amarillo
        return 1
    fi

    if ! command -v dnf >/dev/null 2>&1; then
        texColor "❌ No se encontró el comando 'dnf' en el sistema." rojo
        return 1
    fi

    local total
    total=$(wc -l < "$LIST_FILE")
    texColor "📦 Paquetes encontrados para reinstalar: $total" azul
    
    read -p "¿Deseas proceder con la reinstalación? (s/N): " confirmacion
    if [[ "$confirmacion" != "s" && "$confirmacion" != "S" ]]; then
        texColor "ℹ️ Operación cancelada por el usuario." amarillo
        return 0
    fi

    texColor "🔐 Reinstalando paquetes con dnf (solicitando sudo)..." amarillo
    local pkgs
    pkgs=$(<"$LIST_FILE")
    
    if sudo dnf reinstall -y $pkgs; then
        texColor "✅ Reinstalación de paquetes completada exitosamente." verde
    else
        texColor "❌ Ocurrió un error al reinstalar algunos paquetes." rojo
    fi
}

function mostrar_menu() {
    texColor "---------------------------------------------------" azul
    texColor "       📦 GESTOR DE RESPALDO DE PAQUETES          " verde
    texColor "---------------------------------------------------" azul
    echo "1) Respaldar lista de paquetes"
    echo "2) Reinstalar paquetes desde respaldo"
    echo "3) Salir"
    texColor "---------------------------------------------------" azul
}

# -----------------------------------------------------------------------------
# Procesamiento de argumentos o menú interactivo
# -----------------------------------------------------------------------------
case "$1" in
    -b|--backup)
        respaldar_paquetes
        exit 0
        ;;
    -r|--restore)
        restaurar_paquetes
        exit 0
        ;;
    -h|--help)
        mostrar_ayuda
        exit 0
        ;;
    "")
        while true; do
            mostrar_menu
            read -p "Ingresa tu opción [1-3]: " opcion
            printf "\n"
            case $opcion in
                1)
                    respaldar_paquetes
                    ;;
                2)
                    restaurar_paquetes
                    ;;
                3)
                    texColor "¡Hasta luego! 👋" azul
                    exit 0
                    ;;
                *)
                    texColor "❌ Opción no válida. Intenta de nuevo." rojo
                    ;;
            esac
            printf "\n"
        done
        ;;
    *)
        texColor "❌ Opción desconocida: $1" rojo
        mostrar_ayuda
        exit 1
        ;;
esac
