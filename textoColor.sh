#! /bin/sh

function texColor(){
    
    mensaje="$1"
    tipo="$2"
    
    arry1=(31 32 33 34 35)
    arry2=('red' 'green' 'yellow' 'blue' 'purple')
    
    for (( c=0; c<=${#arry2[@]}; c++ ))
    do
        if [[ $tipo == ${arry2[c]} ]]; then
            echo -en "\e[${arry1[c]}m${mensaje}\e[0m"
        fi
    done
}

