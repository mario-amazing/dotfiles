#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

source $SELF_DIR/display.bash

install_system_configs() {
  echo_title "!!!CONFIG INSTALATION!!!"

  configure_system
  # sudo bash -c "echo '127.0.0.1  localhost www.some.domain'>> /etc/hosts"
}

configure_system() {
  osascript -e 'tell application "System Preferences" to quit' >/dev/null 2>&1
  /bin/bash "${SELF_DIR}"/system/macos.sh
}

install_system_configs
