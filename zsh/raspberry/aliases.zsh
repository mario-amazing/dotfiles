# Common
alias vim='vim'
alias be='bundle exec'
alias x='exit'
alias v='nvim'
alias sv="sudo nvim"
alias s='subl'
alias t='touch'
alias md='mkdir'
alias g='gedit'
alias p='pry'
# alias mysql='mysql --auto-rehash'
alias kl='kill -9'
alias o='open'

#Ctags
alias ctg="ctags -R --languages=ruby --exclude=.git --exclude=log --exclude='*.js' ."
alias rtg="ripper-tags -R --extra=q"

alias ls='ls -G'
alias sk='sudo kill -9'

# alias ls='ls --color=auto'

# Git
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gce='git commit --amend --no-edit'
alias gcam='git commit --amend -m'
alias gcmf='git commit -m "Minor fix"'
alias gcmfs='git commit -m "Minor fixes"'
alias gp='git push'
alias gs='git status -s'
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

alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grb='git rebase'
alias grbm='git rebase master'
grbih () { git rebase -i HEAD~$1 ;}

alias grs='git reset'
alias gcn='git clean -di'

alias gplu='git pull upstream'
alias gplum='git pull upstream master'
alias gplud='git pull upstream develop'
alias gplom='git pull origin master'
alias gplod='git pull origin develop'
alias gplrbm='git checkout master && git pull --rebase && git checkout - && git rebase master'

alias gpum='git push upstream master'
alias gpud='git push upstream develop'
alias gpom='git push origin master'
alias gpod='git push origin develop'

alias gl="git log --date-order --date=iso --graph --full-history --all --pretty=format:'%x08%x09%C(red)%h %C(cyan)%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %C(bold blue)%<(10)%aN%C(reset) %C(reset)%<(70,trunc)%s%C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset) '"

alias ss="spring stop && pkill spring"

# alias rg='bundle exec rails g'
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
alias ea="vim ~/.zsh/aliases.zsh"
alias ev="vim ~/.vimrc"
alias ep="vim ~/.pryrc"
alias ee="vim .env"
alias eph="vim ~/.pryrc_helpers.rb"

alias rc='bundle exec rails c'
alias drc='dotenv bundle exec rails c'
alias rs='bundle exec rails s'

alias rdb='bundle exec rake db:migrate'
alias rdbr='bundle exec rake db:rollback'
alias rr='bundle exec rake routes'
alias rrg='bundle exec rake routes | grep'
alias rs2='ruby script/server -u'
alias rc2='ruby script/console'
alias be='bundle exec'
alias re='bundle exec rspec'
alias rf='bundle exec rspec --only-failures'
alias bre='bundle exec bin/rspec'

#go
alias gor='go run'

#start WORK
WORK_PATH='/Users/mario_amazing/work/itterritory'
alias cdw='cd $WORK_PATH'
alias cdd='cd ~/Documents/dotfiles'

alias cdpt='cd $WORK_PATH/ptero'
alias cdpts='cd $WORK_PATH/ptero-share'
alias cdpr='cd $WORK_PATH/promo'
alias cdh='cd $WORK_PATH/helpdesk'
# alias run_fidor='osascript $WORK_PATH/fidor/scripts/fidor_services.scpt'

#overmind
alias oc='overmind connect'
alias ok='overmind kill'
alias or='overmind restart'
