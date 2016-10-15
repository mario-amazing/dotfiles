# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"
stty -ixon

plugins=(git)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mario/.rvm/bin:/home/mario/.rvm/bin"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Aliases
alias x='exit'
alias v='vim'
alias sv="sudo vim"
alias s='subl'
alias t='touch'
alias md='mkdir'
alias g='gedit'
alias p='pry'

alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status -s'
alias gcl='git clone'
alias grр='git reset HEAD'

alias sudo apt-get install='sudo apt-get install -y'
alias sudo apt-get add-apt-repository='sudo apt-get add-apt-repository -y'
alias f=fg
alias si='sudo apt-get install -y'
alias sp='sudo apt-get purge'
alias bi='bundle init --gemspec=~/.gemspec_template'
alias bl='bundle install'

alias ez="vim ~/.zshrc"
alias ev="vim ~/.vimrc"

alias rc='rails c'
alias rs='rails s'
alias rr='rake routes'
alias rdb='rake db:migrate'
# alias tmux=«TERM=screen-256color tmux»
# alias tmux='tmux attach || tmux new' #save sessions
tmux_session=common

zstyle ':completion:*' rehash true
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

alias rs="bundle exec rails s"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
