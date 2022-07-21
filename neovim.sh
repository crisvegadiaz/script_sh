#! /bin/sh
echo "Usuario actual o Root"

if[$(whoami)=='root']{
  echo "Usuario $(whoami)"
  dnf install neovim 
  dnf install git
  dnf install curl
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir /root/.config/nvim
  tree /root/.config
  cp init.vim  /root/.config/nvim/
}else{
  echo "Usuario $(whoami)"
  sudo dnf install neovim -y
  sudo dnf install git -y
  sudo dnf install curl -y
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir /home/$(whoami)/.config/nvim
  cp init.vim  /home/$(whoami)/.config/nvim/
}


