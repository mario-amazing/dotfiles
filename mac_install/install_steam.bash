#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

source $SELF_DIR/display.bash

install_steam() {
  echo_title "!!!STEAM INSTALATION!!!"

  brew install --cask steam
}


install_steam
