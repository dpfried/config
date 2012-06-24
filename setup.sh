#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR
git pull && git submodule init && git submodule update && git submodule status

rm ~/.emacs ; ln -s $DIR/emacs ~/.emacs
rm -rf ~/.oh-my-zsh ; ln -s $DIR/oh-my-zsh ~/.oh-my-zsh
rm -rf ~/.vim ; ln -s $DIR/vim ~/.vim
rm ~/.vimrc ; ln -s $DIR/vimrc ~/.vimrc
rm ~/.xmobarrc ; ln -s $DIR/xmobarrc ~/.xmobarrc
rm -rf ~/.xmonad ; ln -s $DIR/xmonad ~/.xmonad
rm ~/.zsh-aliases ; ln -s $DIR/zsh-aliases ~/.zsh-aliases
rm ~/.zshrc ; ln -s $DIR/zshrc ~/.zshrc
rm ~/.gitconfig ; ln -s $DIR/gitconfig ~/.gitconfig
