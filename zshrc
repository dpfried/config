# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="dpf"
#ZSH_THEME="terminalparty"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_UPDATE_PROMPT="true"

DISABLE_AUTO_PROMPT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(django heroku git python svn extract vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.zsh-aliases

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:$HOME/eclipse:$HOME/scripts:$HOME/.local/bin:.

[[ $EMACS = t ]] && unsetopt zle
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
bindkey -e

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

[[ -f "/opt/ros/electric/setup.zsh" ]] && source /opt/ros/electric/setup.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# export PYTHONPATH=$PATH:$HOME/.local

autoload zmv

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export VICARE_LIBRARY_PATH=/home/dfried/scheme-tools:$VICARE_LIBRARY_PATH
export PATH=/home/dfried/scheme-tools/bin:$PATH

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
# source /etc/bash_completion.d/virtualenvwrapper
# source $HOME/.local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper.sh

# vicare
export VICARE_LIBRARY_PATH=.:$HOME/vicare/bher:$HOME/vicare/scheme-tools
export PATH=$HOME/vicare/bher:$PATH

# scala build tool (sbt)
# export PATH=$HOME/sbt/bin:$PATH

# ~/bin
export PATH=$HOME/bin:$PATH

# pylearn2
export PYLEARN2_DATA_PATH=$HOME/pylearn2data
#
# perl
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

export TERM=xterm-256color

export EDITOR=vim

# from chneukirchen.org/blog/category/zsh.html
# use C-z to resume vim if suspended, even if something's on the command line
foreground-vi() {
    fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

setopt extended_glob

export IDEA_JDK=/usr/lib/jvm/java-1.6.0-openjdk-amd64/

#alias sbt='JAVA_HOME=/home/dfried/jdk1.8.0_60 sbt'

alias sbt='/home/dfried/bin/sbt -java-home /home/dfried/jdk1.8.0_60/'

# theme modified from terminal party
PROMPT='%{$fg[red]%}%(1j.[%j].)%{$fg[green]%} %% '
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[blue]%}%2~$(git_prompt_info) %{$fg_bold[green]%}%* %{$fg_bold[blue]%}%m%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *%{$fg[yellow]%}"

export LD_LIBRARY_PATH=/home/dfried/coursework/287/ec4/EC4-PS-starter/mujoco_linux:$LD_LIBRARY_PATH

# added by Anaconda3 4.0.0 installer
# export PATH="/home/dfried/anaconda3/bin:$PATH"
#
# added by Anaconda2 4.1.1 installer
export PATH="/home/dfried/anaconda2/bin:$PATH"

export EIGEN3_INCLUDE_DIR=$HOME/projects/eigen

export LD_PRELOAD=$LD_PRELOAD:/opt/intel/mkl/lib/intel64/libmkl_def.so:/opt/intel/mkl/lib/intel64/libmkl_avx2.so:/opt/intel/mkl/lib/intel64/libmkl_core.so:/opt/intel/mkl/lib/intel64/libmkl_intel_lp64.so:/opt/intel/mkl/lib/intel64/libmkl_intel_thread.so:/opt/intel/lib/intel64_lin/libiomp5.so
export MKL_NUM_THREADS=4

export LD_LIBRARY_PATH=$HOME/projects/boost_1_60_0/stage/lib:$LD_LIBRARY_PATH

source $HOME/bin/ssh_hpc.sh

export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH

export PATH="/usr/local/berkeley_upc/bin:$PATH"

export MUJOCO_PY_MJPRO_PATH="${HOME}/lib/mjpro131"
export MUJOCO_PY_MJKEY_PATH="${MUJOCO_PY_MJPRO_PATH}/bin/mjkey.txt"

# for tensorflow 1.0 crash bug, https://github.com/tensorflow/tensorflow/issues/6968#issuecomment-279060156
export LD_PRELOAD="/usr/lib/libtcmalloc_minimal.so.4":$LD_PRELOAD

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

export MALMO_XSD_PATH="/home/dfried/Malmo-0.21.0-Linux-Ubuntu-16.04-64bit_withBoost/Schemas"

export NVM_DIR="/home/dfried/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PYTHONPATH="${HOME}/projects/Matterport3DSimulator/build:$PYTHONPATH"

export PATH="${PATH}:${HOME}/projects/expvcs/local"
