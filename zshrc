# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes
# ZSH_THEME="awesomepanda"
source ~/.zsh/themes/powerlevel9k.bash

HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

stty -ixon

plugins=(
  sudo
  globalias
  gem
  git
  osx
  dotenv
  ruby
  bundler
  rake
  rails
)

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mario/.rvm/bin:/home/mario/.rvm/bin"


export LANG=en_US.UTF-8

export HOMEBREW_AUTO_UPDATE_SECS=86400
export HISTSIZE=200000
export SAVEHIST=200000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Aliases
alias vim='nvim'
alias be='bundle exec'
alias x='exit'
alias v='vim'
alias sv="sudo vim"
alias s='subl'
alias t='touch'
alias md='mkdir'
alias g='gedit'
alias p='pry'
alias mysql='mysql --auto-rehash'
alias kl='kill -9'
alias o='open'
alias ctg='ctags -R --exclude=.git --exclude=log -f tmp/tags *'
alias ctags="`brew --prefix`/bin/ctags -R --exclude=.git --exclude=log *"

alias ls='ls -G'

# alias ls='ls --color=auto'

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
alias gsha="git stash apply"
alias gshl="git stash list"
alias gshc="git stash clear"

alias gco='git checkout'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'

alias gpr='git pull --rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grm='git rebase master'
alias grd='git rebase develop'
grih () { git rebase -i HEAD~$1 ;}

alias gplum='git pull upstream master'
alias gplud='git pull upstream develop'
alias gplom='git pull origin master'
alias gplod='git pull origin develop'

alias gpum='git push upstream master'
alias gpud='git push upstream develop'
alias gpom='git push origin master'
alias gpod='git push origin develop'

alias gl="git log --date-order --date=iso --graph --full-history --all --pretty=format:'%x08%x09%C(red)%h %C(cyan)%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %C(bold blue)%<(10)%aN%C(reset) %C(reset)%<(70,trunc)%s%C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset) '"

alias rgi="bundle exec rails generate i18n"
alias rgsc="bundle exec rails generate scaffold"
alias rgmg="bundle exec rails generate migration"
alias rgmo="bundle exec rails generate model"
alias rgma="bundle exec rails generate mailer"
alias rgco="bundle exec rails generate controller"
alias rgo="bundle exec rails generate observer"

alias drgsc="bundle exec rails d scaffold"
alias drgmg="bundle exec rails d migration"
alias drgmo="bundle exec rails d model"
alias drgma="bundle exec rails d mailer"
alias drgco="bundle exec rails d controller"

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

alias rc='bundle exec rails c'
alias drc='dotenv bundle exec rails c'
alias rs='bundle exec rails s'
# alias rr='bundle exec rake routes'
# alias rrg='bundle exec rake routes | grep'
alias rs2='ruby script/server -u'
alias rc2='ruby script/console'
alias rdb='bundle exec rake db:migrate'
alias rdbr='bundle exec rake db:rollback'
alias be='bundle exec'
alias rr='bundle exec rspec'
alias rf='bundle exec rspec --only-failures'

#go
alias gor='go run'

#fidor aliases
alias onboarding='dotenv bundle exec rails s -p 3007'
alias adapter='dotenv bundle exec rails s -p 7000'
alias banking='dotenv bundle exec rails s'
alias backoffice='dotenv bundle exec rails s -p 3002'
alias api_gateway='dotenv rackup -p 3004'
alias frontend='dotenv bundle exec rails s -p 4000'
alias transfer_cart='dotenv bundle exec rails s -p 7001'
alias event_store='dotenv bundle exec rails s -p 7002'
alias card_management='dotenv bundle exec rails s -p 7003'
alias card_gateway='bundle exec rails s -p 7004'
alias transaction_query_service='bundle exec rails s -p 3008'
alias cash_transfer='dotenv bundle exec rails s -p 3009'
alias confirmable_actions='bundle exec rails s -p 3010'

#start fidor services
alias run_fidor='osascript ~/work/fidor/scripts/fidor_services.scpt'
alias fidor_pull='osascript ~/work/fidor/scripts/fidor_services_pull.scpt'
alias jobs_run='cd ~/work/fidor/utils && ./jobs'

alias rg='rails g'

# al as tmux=«TERM=screen-256color tmux»
# al as tmux='tmux attach || tmux new' #save sessions
tmux_session=common

zstyle ':completion:*' rehash true
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# eval "$(rbenv init -)"

alias rs="bundle exec rails s"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
# GO
export GOPATH=$HOME/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
