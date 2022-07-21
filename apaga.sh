#! /bin/sh

date
echo -n "ingrese la la hora hh:mm=";
read hora;
echo -n "(1)Apagar o (2)Reiniciar ";
read opcion;
case $opcion in
  1)
    shutdown $hora +m "Guarde su trabajo, la PC se apagará en 5 minutos" 
    ;;
  2)
    shutdown -r $hora +m "Guarde su trabajo, la PC se reiniciará en 5 minutos"
    ;;
  *)
    echo "OPCION NO VALIDA";
    ;;
esac

