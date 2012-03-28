# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python svn extract rails rails3 rvm ruby vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.zsh-aliases

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/dfried/bin:/home/dfried/eclipse:/home/dfried/scripts:/home/dfried/Protege_4.1:.

source $ZSH/zsh-aliases.sh
[[ $EMACS = t ]] && unsetopt zle
umask 066
[[ -s "/home/dfried/.rvm/scripts/rvm" ]] && source "/home/dfried/.rvm/scripts/rvm"  # This loads RVM into a shell session.
bindkey -e

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

[[ -f "/opt/ros/electric/setup.zsh" ]] && source /opt/ros/electric/setup.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting