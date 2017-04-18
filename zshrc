# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"
stty -ixon

plugins=(git)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mario/.rvm/bin:/home/mario/.rvm/bin"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export HISTSIZE=200000
export SAVEHIST=200000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Aliases
alias x='exit'
alias v='nvim'
alias sv="sudo nvim"
alias s='subl'
alias t='touch'
alias md='mkdir'
alias g='gedit'
alias p='pry'
alias mysql='mysql --auto-rehash'
alias kl='kill -9'
alias o='xdg-open'
alias ctg='ctags -R --exclude=.git --exclude=log -f tmp/tags *'

alias ls='ls --color=auto'

alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gcmf='git commit -m "Minor fix"'
alias gcmfs='git commit -m "Minor fixes"'
alias gp='git push'
alias gs='git status -s'
alias gr='git reset'
alias gcl='git clone'
alias gpl='git pull --rebase'
alias gsh='git stash'
alias gsha='git stash apply'
alias gco='git checkout'

alias gl="git log --date-order --date=iso --graph --full-history --all --pretty=format:'%x08%x09%C(red)%h %C(cyan)%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %C(bold blue)%<(10)%aN%C(reset) %C(reset)%<(70,trunc)%s%C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset) '"


alias sudo apt-get install='sudo apt-get install -y'
alias sudo apt-get add-apt-repository='sudo apt-get add-apt-repository -y'
alias f=fg
alias si='sudo apt-get install -y'
alias sp='sudo apt-get purge'
alias bi='bundle init --gemspec=~/.gemspec_template'
alias bl='bundle install'
alias bgi='gem install'

alias ez="vim ~/.zshrc"
alias ev="vim ~/.vimrc"

alias rc='rails c'
alias rs='rails s'
alias rr='rake routes'
alias rs2='ruby script/server -u'
alias rc2='ruby script/console'
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
