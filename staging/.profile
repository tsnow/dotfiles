export PATH="/opt/local/lib/postgresql83/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH" 
export PATH=/opt/local/bin:/opt/local/sbin:/Users/tsnow/src/godi/bin:/Users/tsnow/src/godi/sbin:/usr/local/lib/erlang/lib/rabbitmq-server-1.5.3/scripts:$PATH
#EVREWARD IS EATING MY LIFE
#export PATH="$HOME/Desktop/evreward/thesave/vendor/jruby/jruby-linux/bin:$PATH"
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
# Ether PAD BITS #
export GST_SITE=goseeportland.com

# EC2 BITS #
export EC2_HOME=/Users/tsnow/evreward/thesave/ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=$EC2_HOME/../config/keys/pk-blah.pem
export EC2_CERT=$EC2_HOME/../config/keys/cert-blah.pem
# END EC2 BITS #
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

