#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_zsh() {
  echo_title "!!!ZSH INSTALATION!!!"

  brew install zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  brew install powerlevel10k
  #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  ln -vsf "$ROOT_DIR/zsh/zshrc" "$HOME/.zshrc"
  ln -vsf "$ROOT_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
  cp "$ROOT_DIR/zsh/hushlogin" "$HOME/.hushlogin"
  mkdir -pv "$HOME/.zsh/backup"
  mv -v "$HOME/.zsh/themes" "$HOME/.zsh/backup/themes"
  ln -vsf "$ROOT_DIR/zsh/themes" "$HOME/.zsh"
  ln -vsf "$ROOT_DIR/zsh/aliases.zsh" "$HOME/.zsh"
  ln -vsf "$ROOT_DIR/zsh/kuberaliases.zsh" "$HOME/.zsh"

  ln -vsf "$ROOT_DIR/zsh/iterm2-color-ssh.zsh" "$HOME/.oh-my-zsh/custom"

  chsh -s /bin/zsh
}


install_zsh
