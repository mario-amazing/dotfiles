#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
source $SELF_DIR/display.bash

install_ssh() {
  echo_title "!!!SSH INSTALATION!!!"

  while true; do
    read -p "Do you want to install ssh?(Y/n) " yn_ssh
    case $yn_ssh in
      ''|[Yy]* ) ssh_setup; break;;
      [Nn]* ) break;;
    esac
  done
}

ssh_setup() {
  mkdir -p "${HOME}"/.ssh
  ssh-keygen -t rsa -b 4096 -C "marian1amazing@gmail"
  ssh-keyscan -t rsa github.com >>"${HOME}"/.ssh/known_hosts
  brew install gh
  gh auth login
  # gh ssh-key add ~/.ssh/id_rsa.pub --title "$(hostname)-$(date)"
}


install_ssh
