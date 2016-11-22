#TODO  settings, su, sudo update after install
# SELF_DIR="$(dirname $0)"
SELF_DIR=$PWD

copy(){
  yes | cp -f $@
}

install_pachages() {
  for i in $@; do
    sudo apt-get install -y --force-yes $i
  done
}

remove_pachages(){
  for i in $@; do
    sudo apt-get purge -y $i
  done
}

init_settings() {
  sudo add-apt-repository -y "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
  sudo add-apt-repository -y "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
  install_pachages curl
}

install_git() {
  install_pachages git
  git config --global color.ui true
  git config --global user.name  "$1"
  git config --global user.email "$2"
  git config --global push.default simple
  git config --global core.excludesfile ~/.gitignore_global
  copy $SELF_DIR/gitignore_global $HOME/.gitignore_global
}

install_heroku() {
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

install_tmux() {
  copy "$SELF_DIR/tmux.conf" "$HOME/.tmux.conf"
}

install_vim() {
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt-get update
  install_pachages vim-gnome neovim
  install_pachages python-neovim python3-neovim python-pip python3-pip python-pip python-dev python3-dev
  install_pachages software-properties-common exuberant-ctags
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir $HOME/.vim -p
  copy -r $SELF_DIR/vim/vim/* $HOME/.vim
  copy $SELF_DIR/vim/vimrc $HOME/.vimrc
  mkdir ~/.config
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugInstall
}

install_fonts() {
  mkdir $HOME/.fonts -p
  copy -r $SELF_DIR/fonts/* $HOME/.fonts
  fc-cache
}

install_zsh() {
  install_pachages zsh git-core
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  copy $SELF_DIR/zshrc $HOME/.zshrc
  chsh -s `which zsh`
}

install_terminator() {
  sudo add-apt-repository -y ppa:gnome-terminator/nightly
  sudo apt-get update ; install_pachages terminator
  mkdir $HOME/.config/terminator -p
  copy $SELF_DIR/terminator/config $HOME/.config/terminator/
}

install_term_colors() {
  cd /tmp
  local target_dir=base16
  git clone https://github.com/chriskempson/base16-builder.git "$target_dir"
  cd "$target_dir"
  ./base16
  bash "chmod +x output/gnome-terminal/base16-eighties.dark.sh"
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

  rbenv install -v 2.3.0
  rbenv global 2.3.0
  rbenv alias --auto

  copy "$SELF_DIR/pryrc" "$HOME/.pryrc"
  copy "$SELF_DIR/irbrc" "$HOME/.irbrc"
  copy "$SELF_DIR/gemspec_template" "$HOME/.gemspec_template"

  install_pachages postgresql postgresql-contrib
}

install_gems() {
  gem install bundler
  gem install pry
  gem install pry-rails
  gem install interactive_editor
  gem install awesome_print
  gem install neovim
  gem install rmagick
}

install_numix(){
  sudo add-apt-repository -y ppa:numix/ppa
  sudo apt-get update ; install_pachages numix-gtk-theme numix-icon-theme-circle numix-wallpaper-*
  install_pachages unity-tweak-tool gnome-tweak-tool
}

install_programs(){
  install_pachages htop
  install_pachages ubuntu-restricted-extras   #Flash,java,audio-,video-codecs
  install_pachages chromium-browser pepperflashplugin-nonfree
  install_pachages sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386 libasound2-plugins:i386
  install_pachages skype
  install_pachages vlc krita  #Video-player and paint
  install_pachages clementine
  install_pachages dconf-tools  #configs
  install_pachages preload  #cache the most used programs
  install_pachages nodejs
  install_pachages npm
  install_pachages ncurses-dev #libs-dev
  install_pachages libpq-dev
  install_pachages silversearcher-ag #ag to ctrl-p plagin
  install_pachages imagemagick libmagickwand-dev
  cd /tmp

  install_pachages gdebi
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update ; install_pachages google-chrome-stable

  wget http://de.archive.ubuntu.com/ubuntu/pool/universe/q/qtmobility/libqtmultimediakit1_1.2.0-1ubuntu2_amd64.deb  #screen window
  sudo dpkg -i libqtmultimediakit1_1.2.0-1ubuntu2_amd64.deb
  sudo apt-get install -f
  wget http://download.opensuse.org/repositories/home:olav-st/xUbuntu_14.04/Release.key | sudo apt-key add -
  sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/screencloud.list"
  sudo apt-get update ; install_pachages screencloud

  sudo add-apt-repository -y ppa:nilarimogard/webupd8   #Equalizer for fix audio
  sudo apt-get update ; install_pachages pulseaudio-equalizer

  sudo add-apt-repository -y ppa:linrunner/tlp    #save energy
  sudo apt-get update ; install_pachages tlp tlp-rdw
  sudo tlp start

  sudo dpkg --add-architecture i386 ; sudo apt-get update #teamviewer
  install_pachages libdbus-1-3:i386 libasound2:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libjpeg62:i386 libpng12-0:i386 libsm6:i386 libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386 libc6:i386
  wget http://download.teamviewer.com/download/teamviewer_i386.deb
  yes | sudo gdebi teamviewer*.deb
  sudo dpkg --remove-architecture i386
  cd "$SELF_DIR"
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
  gsettings set org.compiz.integrated show-hud "['']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys terminator "<Alt>t"
}

remove_programs(){
  remove_pachages zeitgeist zeitgeist-core zeitgeist-datahub gnome-orca unity-webapps-common
  remove_pachages rhythmbox totem totem-common
  remove_pachages empathy empathy-common nautilus-sendto-empathy  #center fast message
  # remove_pachages thunderbird
}

tmp_configs() {
  sudo bash -c "echo '127.0.0.1  localhost www1.centerv.by www.centerv.by crm1.centerv.by centerv.by centerv.by.local'>> /etc/hosts"
}

finish_fix() {
  sudo apt-get autoremove -y
}

init_settings
install_vim
install_steam
install_git
install_programs
install_fonts
install_heroku
install_ruby
install_gems
install_numix
install_term_colors
install_terminator
remove_programs
fix_logs
tmp_configs
finish_fix
install_zsh
