#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_fonts() {
  echo_title "!!!FONTS INSTALATION!!!"

  cp -r "$ROOT_DIR/fonts/zsh_powerline_fonts" "/Library/Fonts"
}


install_fonts
