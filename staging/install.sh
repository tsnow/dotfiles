#!/bin/bash

# install Cask for emacs http://cask.github.io/installation/
curl -fsSkL https://raw.github.com/cask/cask/master/go | sh
export PATH="/Users/tsnow/.cask/bin:$PATH"
