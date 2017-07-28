# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="awesomepanda"
ZSH_THEME="powerlevel9k/powerlevel9k"

# export DEFAULT_USER="v1rgul"
export TERM="xterm-256color"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-patched'


POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="cyan"
# POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="178"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

POWERLEVEL9K_CONTEXT_TEMPLATE="%m"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d/%m/%Y}"

POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh context root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv rvm  background_jobs time)

# HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

stty -ixon

plugins=(git)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mario/.rvm/bin:/home/mario/.rvm/bin"


export LANG=en_US.UTF-8

export HOMEBREW_AUTO_UPDATE_SECS=86400
export HISTSIZE=200000
export SAVEHIST=200000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Aliases
alias vim='vim'
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
alias o='xdg-open'
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
alias rr='bundle exec rake routes'
alias rs2='ruby script/server -u'
alias rc2='ruby script/console'
alias rdb='bundle exec rake db:migrate'
alias rdbr='bundle exec rake db:rollback'
alias be='bundle exec'

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
