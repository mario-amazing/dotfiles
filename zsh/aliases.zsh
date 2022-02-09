# Additional aliases
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rails
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/bundler/README.md
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker-compose/README.md

# Common
alias vim='vim'
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
# alias ctg='ctags -R --exclude=.git --exclude=log --exclude=*.js -f tmp/tags *'
# alias ctg="ctags -R --languages=ruby --exclude=.git --exclude=log --exclude='*.js' `bundle show --paths` ."
# alias ctags="`brew --prefix`/bin/ctags"
alias ctg="ctags -R --languages=ruby --exclude=.git --exclude=log --exclude='*.js' ."
alias rtg="ripper-tags -R --extra=q --exclude=.git --exclude=log"

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
alias gcrf='git commit -m "Fix rubocop"'
alias gcfr='git commit -m "Fix rubocop"'
alias gcfl='git commit -m "Fix linters"'
alias gcwc='git commit -m "Webpacker compile"'
alias gp='git push'
alias gs='git status -s'
alias gcl='git clone'
alias wcp='RAILS_ENV=production RACK_ENV=production NODE_ENV=production rails webpacker:clobber | RAILS_ENV=production RACK_ENV=production NODE_ENV=production rails webpacker:compile'

alias gsh='git stash --include-untracked'
alias gsha="git stash apply"
alias gshl="git stash list"
alias gshc="git stash clear"

alias gco='git checkout'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'

alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gm='git merge'

alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grb='git rebase'
alias grbm='git rebase master'
grbih () { git rebase -i HEAD~$1 ;}

alias grs='git reset'
grsh () { git reset HEAD~$1 ;}
alias gcn='git clean -di'

# alias gpl='git pull --rebase'
alias gpl='git pull origin $(git rev-parse --abbrev-ref HEAD)'
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

alias sudo apt-get install='sudo apt-get install -y'
alias sudo apt-get add-apt-repository='sudo apt-get add-apt-repository -y'
alias f=fg
alias si='sudo apt-get install -y'
alias sp='sudo apt-get purge'
# alias bi='bundle install'

alias ez="nvim ~/.zshrc"
alias ea="nvim ~/.zsh/aliases.zsh"
alias ev="nvim ~/.vimrc"
alias ep="nvim ~/.pryrc"
alias ee="nvim .env"
alias eph="nvim ~/.pryrc_helpers.rb"

# alias rc='bundle exec rails c'
# alias drc='dotenv bundle exec rails c'
# alias rs='bundle exec rails s'
alias rsb='bundle exec rails s -b 0.0.0.0'

# alias rdm='bundle exec rake db:migrate'
# alias rdr='bundle exec rake db:rollback'
# rdrs () { bundle exec rake db:rollback STEP=$1 ;}
# alias rr='bundle exec rails routes'
# alias rrg='bundle exec rails routes | grep'
# alias be='bundle exec'
alias re='bundle exec rspec'
alias rf='bundle exec rspec --only-failures'
alias guard='bundle exec guard'
alias rub='bundle exec rubocop -P'
alias ruba='bundle exec rubocop -A'

alias dck='docker-compose kill'
alias dbr='docker build -t tout_bot:latest .; docker run -d --restart="always" --name tb tout_bot:latest'
alias ds='docker stop $(docker ps -aq)'
alias dca='docker stop $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -q)'
alias dvc='docker volume rm $(docker volume ls -q)'

# python
alias py='ipython3'
alias py_clean='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'
alias pt='py -m pytest'
alias ptp='pt --pdb'


#start WORK
WORK_PATH='~/work'
alias cdw='eval cd $WORK_PATH'
alias cdd='cd ~/Documents/dotfiles'

# projects
alias cds='eval cd ~/Documents/Github/socialchorus'
alias cdsw='eval cd ~/Documents/Github/socialchorus/workstation'
alias cdsh='eval cd ~/Documents/Github/socialchorus/hermes'
alias cdsma='eval cd ~/Documents/Github/socialchorus/marco'
alias cdshed='eval cd ~/Documents/Github/socialchorus/hedwig'
alias cdsk='eval cd ~/Documents/Github/socialchorus/kai'
alias cdspo='eval cd ~/Documents/Github/socialchorus/pony'
alias cdspa='eval cd ~/Documents/Github/socialchorus/patron'
alias cdspas='eval cd ~/Documents/Github/socialchorus/patronus'
alias cdsg='eval cd ~/Documents/Github/socialchorus/governor'
alias cdsb='eval cd ~/Documents/Github/socialchorus/bossanova'
alias cdtm='eval cd $WORK_PATH/this_moment'

# alias run_fidor='osascript $WORK_PATH/fidor/scripts/fidor_services.scpt'

#overmind
alias oc='overmind connect'
alias ok='overmind kill'
alias or='overmind restart'
