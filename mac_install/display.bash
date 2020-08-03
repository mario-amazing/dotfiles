#!/bin/bash

SELF_DIR=`dirname "$BASH_SOURCE"`
source $SELF_DIR/colors.bash

echo_title() {
  echo -e "${LCYAN}$1${NORMAL}\n"
}

echo_info() {
  echo -e "${INVERSE}$1${NORMAL}\n"
}

echo_question() {
  echo -e "${LGREEN}$1${NORMAL}\n"
}
