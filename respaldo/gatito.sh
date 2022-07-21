#!/bin/bash
echo "respadar lista (1) o reintalar respaldo (2)"
read opcion
pkgs=$(cat ./lista.txt)

case $opcion in
  1)
    touch lista.txt
    rpm -qa | sort > ./lista.txt
    echo "Listo"
    ;;
  2)
    sudo dnf reinstall $pkgs
    ;;
  *)
    echo "OPCION NO VALIDA"
    ;;
esac
