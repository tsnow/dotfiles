git submodule update --init

. ~/my-dotfiles/staging/install.sh
ln -s ~/my-dotfiles/bash/main.sh ~/.profile
ln -s ~/.profile ~/.bash_profile
ln -s ~/.profile ~/.bashrc

ln -s ~/my-dotfiles/emacs ~/.emacs.d
ln -s ~/my-dotfiles/emacs-tsnow ~/emacs-tsnow

ln -s ~/my-dotfiles/gitconfig ~/.gitconfig
#ln -s ~/my-dotfiles/hoe/hoerc ~/.hoerc
#ln -s ~/my-dotfiles/hoe/template ~/.hoe_template
ln -s ~/my-dotfiles/zshrc ~/.zshrc
ln -s ~/my-dotfiles/oh-my-zsh ~/.oh-my-zsh


. ~/.profile

if [ -e ~/dev-dotfiles/install.sh ];
    . ~/dev-dotfiles/install.sh
fi
if [ -e ~/site-dotfiles/install.sh ];
    . ~/site-dotfiles/install.sh
fi
