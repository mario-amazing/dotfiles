#!/bin/bash

SELF_DIR=`dirname "$BASH_SOURCE"`
source $SELF_DIR/colors.bash

echo_title() {
  printf "${LCYAN}$1${NORMAL}\n"
}

echo_info() {
  printf "${INVERSE}$1${NORMAL}\n"
}

echo_question() {
  printf "${LGREEN}$1${NORMAL}\n"
}
