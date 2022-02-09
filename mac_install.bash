#!/bin/bash
export HOMEBREW_NO_AUTO_UPDATE=1

source mac_install/before_install.bash
source mac_install/install_git.bash
source mac_install/install_brew.bash
source mac_install/install_system_configs.bash
source mac_install/install_programs.bash
source mac_install/install_fonts.bash
source mac_install/install_steam.bash
source mac_install/install_ruby.bash
source mac_install/install_vim.bash
source mac_install/install_zsh.bash
