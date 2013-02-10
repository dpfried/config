#!/bin/bash
if [ ! -d /tmp/$USER ] ; then
    mkdir /tmp/$USER
fi

hg clone https://vim.googlecode.com/hg/ /tmp/$USER/vim
cd /tmp/$USER/vim
./configure --prefix=$HOME --exec-prefix=$HOME --with-features=huge --enable-rubyinterp --with-features=huge --enable-gui=gnome2 --enable-conceal --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config 
make
make install
