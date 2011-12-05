# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 rails osx github gem vagrant git textmate ruby rvm)

source ~/.rvm/scripts/rvm
source ~/.profile
__rvm_project_rvmrc
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [[ -s /Users/tsnow/.rvm/scripts/rvm ]] ; then source /Users/tsnow/.rvm/scripts/rvm ; fi

export TERM=xterm-256color
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify #correct_all
unsetopt beep
bindkey -e
