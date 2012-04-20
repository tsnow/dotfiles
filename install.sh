#!/bin/bash

# from https://github.com/adamv/dotfiles/commit/54f571c2cf52a8eabd21043602f3bbfca430fd84 #adamv's dotfiles
# relink target-file source-file
relink() {
  if [[ -h "$1" ]]; then
    echo "Relinking $1"
    # Symbolic link? Then recreate.
    rm "$1"
    ln -sn "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    echo "Linking $1 to $2"
    ln -sn "$2" "$1"
  else
    echo "$1 exists as a real file, skipping."
  fi
}

DIR=$( cd "$( dirname "$0" )" && pwd )

# relink ~/.bash_profile $DIR/bash_profile
# relink ~/.bashrc       $DIR/bashrc


git submodule update --init

relink  ~/.profile $DIR/bash/main.sh

relink ~/.bash_profile ~/.profile 
relink ~/.bashrc ~/.profile 

relink ~/.gitconfig    $DIR/gitconfig

relink ~/.emacs.d $DIR/emacs 
relink ~/emacs-tsnow $DIR/emacs-tsnow 

#relink ~/.hoerc $DIR/hoe/hoerc 
#relink ~/.hoe_template $DIR/hoe/template 

relink  ~/.oh-my-zsh $DIR/oh-my-zsh
relink ~/.zshrc $DIR/zshrc

. ~/.profile


# Recurse into subdirectories
for i in `find $DIR/staging ~/dev-dotfiles ~/site-dotfiles -type f -name 'install.sh' 2>/dev/null`; do 
    echo "Running: $i";
    source $i;
done