#!/bin/bash

echo "Selecciona una opción:"
echo "1) Respaldar lista"
echo "2) Reinstalar respaldo"
read -p "Ingresa tu opción: " opcion

# Verificar si el archivo lista.txt existe antes de intentar leerlo
if [[ ! -f ./lista.txt ]]; then
    touch lista.txt
fi

case $opcion in
    1)
        rpm -qa | sort > ./lista.txt
        echo "Lista de paquetes respaldada en lista.txt."
    ;;
    2)
        # Verificar si el archivo lista.txt tiene contenido antes de reinstalar
        if [[ -s ./lista.txt ]]; then
            pkgs=$(<./lista.txt)  # Leer contenido del archivo en la variable pkgs
            sudo dnf reinstall -y $pkgs
            echo "Reinstalando paquetes..."
        else
            echo "El archivo lista.txt está vacío. No hay paquetes para reinstalar."
        fi
    ;;
    *)
        echo "OPCIÓN NO VÁLIDA"
    ;;
esac
