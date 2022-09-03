#! /bin/bash

echo 'Debes usar sudo'
arry=('git' 'tilix' 'htop' 'neofetch' 'vlc')
for i in "${arry[@]}"
do
  dnf install ${i} -y
  echo "<-------------------->"
done

