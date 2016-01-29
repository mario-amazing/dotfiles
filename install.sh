SELF_DIR="$(dirname $0)"

install_pachages() {
  sudo apt-get install -y $@
}

remove_pachages(){
  sudo apt-get purge -y $@
}

install_git() {
  install_pachages git
  git config --global user.name  "$1"
  git config --global user.email "$2"
  git config --global push.default simple
}

install_heroku() {
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

install_tmux() {
  cp "$SELF_DIR/tmux.conf" "$HOME/.tmux.conf"
}

install_vim() {
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt-get update
  install_pachages vim-gnome neovim
  install_pachages software-properties-common exuberant-ctags
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  cp "$SELF_DIR/vimrc/vimrc" "$HOME/.vimrc"
  cp -r "$SELF_DIR/vimrc/vim" "$HOME/.vim"
  vim +NeoBundleInstall +qall
}

install_zsh() {
  cp "$SELF_DIR/zshrc" "$HOME/.zshrc"
  install_pachages zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_term_colors() {
  cd /tmp
  local target_dir=base16
  git clone https://github.com/chriskempson/base16-builder.git "$target_dir"
  cd "$target_dir"
  ./base16
  bash "./output/gnome-terminal/base16-eighties.dark.sh"
  cd "$SELF_DIR"
}

install_ruby() {
  install_pachages git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone git://github.com/tpope/rbenv-aliases.git \
    ~/.rbenv/plugins/rbenv-aliases
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"

  rbenv install -v 2.2.1
  rbenv global 2.2.1
  rbenv alias --auto

  cp "$SELF_DIR/pryrc" "$HOME/.pryrc"
  cp "$SELF_DIR/irbrc" "$HOME/.irbrc"
  cp "$SELF_DIR/gemspec_template" "$HOME/.gemspec_template"
}

install_gems() {
  gem install bundler
  gem install pry
  gem install interactive_editor
  gem install awesome_print
}

install_numix(){
  sudo add-apt-repository -y ppa:numix/ppa
  sudo apt-get update && install_pachages numix-gtk-theme numix-icon-theme-circle
  install_pachages unity-tweak-tool
}

install_programs(){
  install_pachages curl
  install_pachages ubuntu-restricted-extras   #Flash,java,audio-,video-codecs
  install_pachages chromium-browser pepperflashplugin-nonfree
  install_pachages sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386 libasound2-plugins:i386
  install_pachages skype
  install_pachages vlc krita  #Video-player and paint
  install_pachages clementine
  install_pachages dconf-tools  #configs
  install_pachages preload  #cache the most used programs
  install_pachages nodejs
  install_pachages ncurses-dev #libs-dev
  install_pachages libpq-dev
  install_pachages silversearcher-ag #ag to ctrl-p plagin

  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update && install_pachages google-chrome-stable

  wget -q -O- http://download.opensuse.org/repositories/home:olav-st/xUbuntu_14.04/Release.key | sudo apt-key add -  #screen window
  sudo add-apt-repository -y 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_14.04/ /'
  sudo apt-get update && install_pachages screencloud	

  sudo add-apt-repository -y ppa:nilarimogard/webupd8   #Equalizer for fix audio
  sudo apt-get update && install_pachages pulseaudio-equalizer

  sudo add-apt-repository -y ppa:linrunner/tlp    #save energy
  sudo apt-get update && install_pachages tlp tlp-rdw
  sudo tlp start
}

install_steam() {
  install_pachages steam
  sudo add-apt-repository -y ppa:xorg-edgers/ppa
  install_pachages xserver-xorg-core xserver-xorg-video-intel libcheese7 libcheese-gtk23 libclutter-1.0-0 libclutter-gtk-1.0-0 libcogl15 libclutter-gst-2.0-0 gstreamer1.0-clutter     #libs for font
}

fix_logs(){
  sudo bash -c "echo 'vm.swappiness=0'>> /etc/sysctl.conf"
  sudo bash -c "echo 'SUSPEND_MODULES="xhci-hcd"'>> /etc/pm/config.d/unload_module"
  sudo bash -c "echo 'blacklist btusb'>> /etc/modprobe.d/blacklist.conf"
  gsettings set com.canonical.desktop.interface scrollbar-mode normal  #Normal scroll
  gsettings set org.gnome.settings-daemon.plugins.power button-power shutdown
  gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action nothing
  gsettings set org.gnome.settings-daemon.plugins.power percentage-low 25
  gsettings set org.gnome.settings-daemon.plugins.power percentage-critical 5
}

remove_programs(){
  remove_pachages zeitgeist zeitgeist-core zeitgeist-datahub gnome-orca unity-webapps-common
  remove_pachages rhythmbox totem totem-common
  remove_pachages empathy empathy-common nautilus-sendto-empathy  #center fast message
  remove_pachages thunderbird
}

install_git
install_programs
install_steam
install_tmux
install_heroku
install_ruby
install_gems
install_term_colors
install_numix
remove_programs
fix_logs
install_vim
install_zsh
