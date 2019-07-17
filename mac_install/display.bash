#!/bin/bash

SELF_DIR=`dirname "$BASH_SOURCE"`
source $SELF_DIR/colors.bash

echo_title() {
  echo -e "${LCYAN}$1${NORMAL}\n"
}

