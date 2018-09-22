#!/bin/bash
if [ ! -d /tmp/$USER ] ; then
    mkdir /tmp/$USER
fi

git clone --depth 1 https://github.com/vim/vim.git /tmp/$USER/vim
cd /tmp/$USER/vim
#./configure --prefix=$HOME --exec-prefix=$HOME --with-features=huge --enable-rubyinterp --with-features=huge --enable-gui=gnome2 --enable-conceal --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
--prefix=$HOME \
--exec-prefix=$HOME
make
make install
