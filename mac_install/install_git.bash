#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_git() {
  echo_title "!!!GIT INSTALATION!!!"

  ln -vsf "$ROOT_DIR/config/gitignore_global" "$HOME/.gitignore_global"

  read -e -p "$(echo ${LGREEN}Enter Your git name: ${NORMAL})" gitname
  gitname="${gitname:=mario-amazing}"

  read -e -p "$(echo ${LGREEN}Enter Your git email: ${NORMAL})" gitemail
  gitemail="${gitemail:=marian1amazing@gmail.com}"

  git config --global user.name ${gitname}
  git config --global user.email ${gitemail}
  git config --global init.defaultBranch master
  git config --global color.ui true
  git config --global push.default current
  git config --global core.excludesfile ~/.gitignore_global
  git config --global core.editor nvim
  git config --global branch.autosetuprebase always

  git config --global help.autoCorrect -1

  # delta
  git config --global core.pager delta
  git config --global delta.features decorations
  git config --global delta.syntax-theme gruvbox-dark
  git config --global delta.minus-style "#ea6962"
  git config --global delta.plus-style "#a9b665"
  git config --global delta.navigate true # use n and N to move between diff sections
  git config --global delta.decorations.file-style omit
  git config --global delta.decorations.hunk-header-style 'file line-number syntax'
}

install_git
