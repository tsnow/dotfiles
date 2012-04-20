source /etc/profile

export DOTFILES=~/my-dotfiles
export DEV_DOTFILES=~/dev-dotfiles
if [ -s "$DEV_DOTFILES/bash/main.sh" ]
  then source "$DEV_DOTFILES/bash/main.sh"
fi

source "$DOTFILES/bash/aliases.sh"
source "$DOTFILES/bash/git.sh"
source "$DOTFILES/bash/prompt.sh"

if [ -s "$DOTFILES/bash/private.sh" ]
  then source "$DOTFILES/bash/private.sh"
fi

export EDITOR="emacs -nw"
export VISUAL=$EDITOR

export ARCHFLAGS="-arch x86_64"
export JAVA_HOME=`/usr/libexec/java_home`
export  P4CONFIG=.p4config
export       PS1='$(__git_ps1 "[%s] ")\w\\$ '
export NODE_PATH="/usr/local/lib/node"
