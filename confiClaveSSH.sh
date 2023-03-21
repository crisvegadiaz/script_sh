#! /bin/bash 

function texColor(){    
    mensaje="$1"
    tipo="$2"
    
    arry1=(31 32 33 34 35)
    arry2=('red' 'green' 'yellow' 'blue' 'purple')
    
    for (( c=0; c<=${#arry2[@]}; c++ ))
    do
        if [[ $tipo == ${arry2[c]} ]]; then
            echo -en "\e[${arry1[c]}m${mensaje}\e[0m"
            printf "\n"
        fi
    done
}

texColor "Ver Claver SSH:" red
ls -la ~/.ssh

texColor "¿Quieres generar uno nuevo? (si o no):" yellow
read respuesta

if [ $respuesta = "si" ] 
then
    texColor "Ingrese su email:" purple
    read email
    ssh-keygen -t rsa -b 4096 -C $email
else
    texColor "No valido" purple
fi

texColor "Asegúrate de que el agente de claves SSH esté ejecutándose:" red
cd ~/.ssh
ls -la 
eval '$(ssh-agent -s)'

texColor "Agrega tu clave privada SSH al agente:" red
ls -la 
texColor "Ingrese el nombre de la clave privada:" yellow
read clavePrivada
ssh-add ~/.ssh/$clavePrivada
cat ~/.ssh/$clavePrivada.pub | xclip -selection clipboard
