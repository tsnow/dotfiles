source /etc/profile

export DEV_DOTFILES=~/dev-dotfiles #set this to what you like
export DEV_DIRECTORY=~/dev #set this to what you will
if [ -s "$DEV_DOTFILES/bash/main.sh" ]
  then source "$DEV_DOTFILES/bash/main.sh"
fi

[[ -s "/Users/tsnow/.rvm/scripts/rvm" ]] && source "/Users/tsnow/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/opt/local/lib/postgresql83/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH" 
export PATH=/opt/local/bin:/opt/local/sbin:/Users/tsnow/src/godi/bin:/Users/tsnow/src/godi/sbin:/usr/local/lib/erlang/lib/rabbitmq-server-1.5.3/scripts:$PATH

export EDITOR="mate -w"
export SVN_EDITOR="mate -w"
export ARCHFLAGS="-arch x86_64"
# ETHERPAD BITS #
alias java=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Commands/java
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export SCALA_HOME="/Users/tsnow/Downloads/scala-2.7.7.final/"
export JAVA="$JAVA_HOME/bin/java"
export SCALA="$SCALA_HOME/bin/scala"
export PATH="$JAVA_HOME/bin:$SCALA_HOME/bin:/usr/local/mysql/bin:$PATH"
export MYSQL_CONNECTOR_JAR="/Users/tsnow/Downloads/mysql-connector-java-5.1.9/mysql-connector-java-5.1.9-bin.jar"

# JRUBY BITS #
export JRUBY_OPTS="--1.9"

# Ether PAD BITS #
export GST_SITE=goseeportland.com

# EC2 BITS #
export EC2_HOME=/Users/tsnow/evreward/thesave/ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=$EC2_HOME/../config/keys/pk-blah.pem
export EC2_CERT=$EC2_HOME/../config/keys/cert-blah.pem
# END EC2 BITS #

# NODE BITS #
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

##
# Your previous /Users/tsnow/.profile file was backed up as /Users/tsnow/.profile.macports-saved_2009-06-08_at_18:21:10 #
##

# MacPorts Installer addition on 2009-06-08_at_18:21:10: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

#alias gitgrep='git grep -i -n'
 
#gci(){ git status; read -p "press any key to commit..." -n 1; echo ""; git commit -m "$1"; }
 
#gcia(){ git status; read -p "press any key to commit all files..." -n 1; echo ""; git commit -a -m "$1"; }
 
#git_new_remote_branch(){
#  read -p "press a key to continue if you have no uncommitted changes" -n 1;
#  echo "";
#  git branch $1;
#  git push origin $1;
#  git branch -D $1;
#  git checkout --track -b $1 origin/$1;
# } #



# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

#RVM
if [[ -s /Users/tsnow/.rvm/scripts/rvm ]] ; then source /Users/tsnow/.rvm/scripts/rvm ; fi

##
# Your previous /Users/tsnow/.profile file was backed up as /Users/tsnow/.profile.macports-saved_2010-07-18_at_11:11:42
##

# MacPorts Installer addition on 2010-07-18_at_11:11:42: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#MAPNIK

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH

# Settings for Mapnik.framework Installer to enable Mapnik programs and python bindings
export PATH=/Library/Frameworks/Mapnik.framework/Programs:$PATH
export PYTHONPATH=/Library/Frameworks/Mapnik.framework/Python:$PYTHONPATH

#END MAPNIK

#brew tab-completion
if [[ $SHELL == "/bin/bash" ]]; then
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh;
fi

#PROMPT 
. /Users/tsnow/git-prompt/git-prompt.sh

#RVM Prompt
export PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
source "$rvm_path/contrib/ps1_functions"
ps1_set


# Bash snippet to open new shells in most recently visited dir.
# Useful if you want to open a new terminal tab at the present 
# tab's location.
#
# Put this in your .bashrc or whatever. 
pathed_cd () {
    if [ "$1" == "" ]; then
        cd
    else
        cd "$1"
    fi
#	echo "Going to $1 from "`cat ~/.cdpath`
    pwd > ~/.cdpath
}
alias cd="pathed_cd"
 
if [ -f ~/.cdpath ]; then
  cd $(cat ~/.cdpath)
fi


#KCachegrind
QTDIR=/opt/local/lib/qt3; export QTDIR

#Testing clojure
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar

##From: http://amitp.blogspot.com/2009/09/bash-prompts-on-mac.html#comments
#
## Username (if root or remote)
#if [ "$(whoami)" = "root" ]; then
#    PS1="\[\e[41;1;37m\] root"
#elif [ -n "$SSH_CLIENT" ]; then
#    PS1="\[\e[30;107m\]\u"
#else
#    PS1=""
#fi
#
## Machine (if remote)
#if [ -n "$SSH_CLIENT" ]; then
#    PS1="$PS1@$hostname:"
#fi
#
## Current directory
#PS1="$PS1\[\e[34m\]\w/ \[\e[0m\]\$ "
#
## Current date and time
#PS1="\[\e[0;90m\] \d \[\e[1m\]\t\[\e[0m\]\r\n$PS1"
#
## Screen name (if inside a screen)
#if [ -n "$STY" ]; then
#    PS1=" \[\e[32m\]$STY\[\e[0m\]$PS1"
#fi
#
## Display a smiley for success/failure 
#PS1="\`if [ \$? = 0 ]; then echo \[\e[42\;37m\]:\\);\
# else echo \[\e[41\;37m\]:\\(; fi\`\[\e[0m\] $PS1"
#
##END FROM
