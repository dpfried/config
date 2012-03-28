#!/bin/bash
if [ ! -d /tmp/$USER ] ; then
    mkdir /tmp/$USER
fi

hg clone https://vim.googlecode.com/hg/ /tmp/$USER/vim
cd /tmp/$USER/vim
./configure --prefix=~ --enable-rubyinterp --with-features=huge --enable-gui=gnome2 --enable-conceal
make
make install
