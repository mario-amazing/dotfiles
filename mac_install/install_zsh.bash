#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_zsh() {
  echo_title "!!!ZSH INSTALATION!!!"

  ln -vsf "$ROOT_DIR/zsh/zshrc" "$HOME/.zshrc"
  mkdir -pv "$HOME/.zsh/backup"
  mv -v "$HOME/.zsh/themes" "$HOME/.zsh/backup/themes"
  ln -vsf "$ROOT_DIR/zsh/themes" "$HOME/.zsh"

  brew install zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  brew tap sambadevi/powerlevel9k
  brew install powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

  # chsh -s `which zsh`
  chsh -s /bin/zsh
}


install_zsh
