source /etc/profile
export DOTFILES=~/my-dotfiles
export DEV_DOTFILES=~/dev-dotfiles #set this to what you like
export DEV_DIRECTORY=~/dev #set this to what you will
if [ -s "$DOTFILES/bash/main.sh" ]
  then source "$DOTFILES/bash/main.sh"
fi

[[ -s "/Users/tsnow/.rvm/scripts/rvm" ]] && source "/Users/tsnow/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
