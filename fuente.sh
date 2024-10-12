#!/bin/sh

# Directorios
FUENTES_DIR="./fuentes"
DESTINO_DIR="/usr/share/fonts"

# Verificar si el directorio de fuentes existe
if [ ! -d "$FUENTES_DIR" ]; then
    echo "El directorio de fuentes no existe: $FUENTES_DIR"
    exit 1
fi

# Verificar si el directorio de destino existe
if [ ! -d "$DESTINO_DIR" ]; then
    echo "El directorio de destino no existe: $DESTINO_DIR"
    exit 1
fi

# Copiar las carpetas de fuentes al destino
for carpeta in "$FUENTES_DIR"/*; do
    if [ -d "$carpeta" ]; then
        nombre_carpeta=$(basename "$carpeta")
        if [ ! -d "$DESTINO_DIR/$nombre_carpeta" ]; then
            echo "Copiando $nombre_carpeta a $DESTINO_DIR..."
            sudo cp -r "$carpeta" "$DESTINO_DIR"
        else
            echo "La carpeta $nombre_carpeta ya existe en $DESTINO_DIR, omitiendo."
        fi
    fi
done

# Actualizar la caché de fuentes
sudo fc-cache -f -v

echo "Carpetas copiadas y caché de fuentes actualizada correctamente."
