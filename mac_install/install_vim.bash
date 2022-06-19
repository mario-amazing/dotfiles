#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_vim() {
  echo_title "!!!VIM INSTALATION!!!"

  brew install vim neovim

  brew install npm
  npm install -g neovim
  npm install -g livedown # shime/vim-livedown

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p ~/.vim

  ln -vsf "$ROOT_DIR/vim/vimrc" "$HOME/.vimrc"
  ln -vsf "$ROOT_DIR/vim/vim/modules" "$HOME/.vim"

  mkdir -p ~/.config/nvim
  ln -vsf "$ROOT_DIR/vim/init.lua" "$HOME/.config/nvim/init.lua"
  ln -vsf "$ROOT_DIR/vim/lua" "$HOME/.config/nvim/lua"
  mkdir -p "$HOME/.config/nvim/tmp/backup"

  nvim +PlugInstall +qa
  nvim +PlugUpdate +qa
  nvim +UpdateRemotePlugins +qa
}

install_vim
