#!/bin/sh
echo "Usuario actual o Root"

# Comprobar si el usuario es root
if [ "$(whoami)" = "root" ]; then
    echo "Usuario $(whoami)"
    dnf install -y neovim git curl
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p /root/.config/nvim
    cp init.vim /root/.config/nvim/
else
    echo "Usuario $(whoami)"
    sudo dnf install -y neovim git curl
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p /home/"$(whoami)"/.config/nvim
    cp init.vim /home/"$(whoami)"/.config/nvim/
fi

# Mostrar la estructura de directorios
echo "Estructura de directorios:"
tree /root/.config/nvim || tree /home/"$(whoami)"/.config/nvim
