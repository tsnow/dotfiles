#!/bin/bash
export PATH=/usr/local/bin:/usr/local/sbin:$PATH; # For homebrew git and svn

# Not quite:  https://github.com/jclem/gifify/blob/master/gifify.sh
# but: https://gist.github.com/SlexAxton/4989674#file-zshrc

#brew install ffmpeg
#brew tap phinze/homebrew-cask
#brew install brew-cask
#brew cask install x-quartz
#open /usr/local/Cellar/x-quartz/2.7.4/XQuartz.pkg
# click through the stuff
#brew install gifsicle
#brew install imagemagick
 
# I had a weird problem with Convert/imagemagick where I had to do:
#ln -s /usr/local/Cellar/libtool/2.4.2/lib/libltdl.7.dylib libltdl.7.dylib
# But hopefully you don't have to

gif-ify() {
  if [[ -n "$1" && -n "$2" ]]; then
    ffmpeg -i $1 -pix_fmt rgb24 temp.gif
    convert -layers Optimize temp.gif $2
    rm temp.gif
  else
    echo "proper usage: gif-ify <input_movie.mov> <output_file.gif>. You DO need to include extensions."
  fi
}
