#!/bin/bash

install_realpath() {
  if ! command -v realpath &> /dev/null
  then
    brew install coreutils
  fi
}

install_realpath
