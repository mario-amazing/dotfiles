#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_git() {
  echo_title "!!!GIT INSTALATION!!!"

  ln -vsf "$ROOT_DIR/gitignore_global" "$HOME/.gitignore_global"

  read -e -p "$(echo ${LGREEN}Enter Your git name: ${NORMAL})" gitname
  gitname="${gitname:=mario_amazing}"

  read -e -p "$(echo ${LGREEN}Enter Your git email: ${NORMAL})" gitemail
  gitemail="${gitemail:=marian1amazing@gmail.com}"

  git config --global user.name ${gitname}
  git config --global user.email ${gitemail}
  git config --global color.ui true
  git config --global push.default current
  git config --global core.excludesfile ~/.gitignore_global
  git config --global core.editor vim
  git config --global branch.autosetuprebase always

  git config --global help.autoCorrect -1
}

install_git
