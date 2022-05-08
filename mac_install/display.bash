#!/bin/bash

SELF_DIR=`dirname "$BASH_SOURCE"`
source $SELF_DIR/colors.bash

echo_title() {
  echo "${LCYAN}$1${NORMAL}\n"
}

echo_info() {
  echo "${INVERSE}$1${NORMAL}\n"
}

echo_question() {
  echo "${LGREEN}$1${NORMAL}\n"
}
