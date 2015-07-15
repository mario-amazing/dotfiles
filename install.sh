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

install_tmux() {
  cp "$SELF_DIR/tmux.conf" "$HOME/.tmux.conf"
}

install_vim() {
  install_pachages vim-gnome
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  cp "$SELF_DIR/vimrc" "$HOME/.vimrc"
  vim +NeoBundleInstall +qall
}

install_zsh() {
  install_pachages zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp "$SELF_DIR/zshrc" "$HOME/.zshrc"
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
  install_pachages git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
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

  gem install bundler
}

install_numix(){
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-get update && install_pachages numix-gtk-theme numix-icon-theme-circle
install_pachages unity-tweak-tool
}

install_programs(){
install_pachages ubuntu-restricted-extras   #Flash,java,audio-,video-codecs
install_pachages chromium-browser pepperflashplugin-nonfree
install_pachages sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386 libasound2-plugins:i386
install_pachages skype
install_pachages vlc krita  #Video-player and paint

wget -q -O-
http://download.opensuse.org/repositories/home:olav-st/xUbuntu_14.04/Release.key | sudo apt-key add -  #screen window
sudo add-apt-repository -y 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_14.04/ /'
sudo apt-get update && install_pachages screencloud

sudo add-apt-repository -y ppa:me-davidsansome/clementine  #Audio player
sudo apt-get update && install_pachages clementine

sudo add-apt-repository -y ppa:nilarimogard/webupd8   #Equalizer for fix audio
sudo apt-get update && install_pachages pulseaudio-equalizer
}

fix_logs(){
sudo bash -c "echo 'vm.swappiness=0'>> /etc/sysctl.conf"
}

remove_programs(){
remove_pachages zeitgeist zeitgeist-core zeitgeist-datahub gnome-orca unity-webapps-common
remove_pachages rhythmbox totem totem-common
remove_pachages empathy empathy-common nautilus-sendto-empathy  #center fast message
}

install_git
install_vim
install_tmux
install_ruby
install_term_colors
install_numix
install_programs
remove_programs
fix_logs
install_zsh
