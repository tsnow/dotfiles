source /etc/profile

#source ~/.bash_login
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

uname=`uname -a`;
os="${uname%% *}";
#uname="${uname#* }";
if [ -s "$DOTFILES/bash/$os.sh" ]
  then source "$DOTFILES/bash/$os.sh";
fi
if [ -s "$DOTFILES/bash/local.sh" ]
  then source "$DOTFILES/bash/local.sh";
fi
#while [ -s "$DOTFILES/bash/$os.sh" ]
#  then 
#  source "$DOTFILES/bash/$os.sh";
#  os="$os/${uname%% *}";
#  uname="${uname#* }";
#done

#if [ -s "$DOTFILES/bash/resty" ]
#  then source "$DOTFILES/bash/resty"
#fi

## Needed for completions, from http://www.schuerig.de/michael/blog/index.php/2007/02/24/gem-bash-completion/
have()
{
  unset -v have
  PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
  have="yes"
}

## Completions
#if [ -s "$DOTFILES/bash/completions_dir" ]
#  then for i in `find "$DOTFILES/bash/completions_dir/" -type f -name "*.sh"`; do
#        source "$i";
#        done
#fi

emacs="emacs -nw"
export	EDITOR="$emacs"
export	VISUAL=$EDITOR
alias emacs="$emacs"

export	ARCHFLAGS="-arch x86_64"
export	JAVA_HOME=`/usr/libexec/java_home`
export  P4CONFIG=.p4config
export	PS1='$(__git_ps1 "[%s] ")\w\\$ '
export 	NODE_PATH="/usr/local/lib/node"

export	PLAN9=/usr/local/plan9 export PLAN9
export	PATH=$PATH:$PLAN9/bin export PATH
export GOPATH=/Users/tsnow/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
