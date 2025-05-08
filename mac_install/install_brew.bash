#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
source $SELF_DIR/display.bash

install_brew() {
  echo_title "!!!BREW INSTALATION!!!"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  export PATH="/opt/homebrew/bin:$PATH"
  brew update && brew upgrade
}


install_brew
