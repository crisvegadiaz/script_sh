#! /bin/sh

sudo cp -r $( ls ./fuentes ) /usr/share/fonts/truetype
sudo fc-cache -f -v

