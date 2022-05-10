#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
source $SELF_DIR/display.bash

install_brew() {
  echo_title "!!!Initialize INSTALATION!!!"

  xcode-select --install
  sudo xcodebuild -license accept
}


install_brew
