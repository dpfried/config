# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(django heroku git python svn extract rails rails3 rvm ruby vi-mode virtualenvwrapper)

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
export PYTHONPATH=$PATH:$HOME/.local

autoload zmv

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export VICARE_LIBRARY_PATH=/home/dfried/scheme-tools:$VICARE_LIBRARY_PATH
export PATH=/home/dfried/scheme-tools/bin:$PATH

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /etc/bash_completion.d/virtualenvwrapper

# vicare
export VICARE_LIBRARY_PATH=.:$HOME/vicare/bher:$HOME/vicare/scheme-tools
export PATH=$HOME/vicare/bher:$PATH

# scala build tool (sbt)
export PATH=$HOME/sbt/bin:$PATH

# ~/bin
export PATH=$HOME/bin:$PATH

# pylearn2
export PYLEARN2_DATA_PATH=$HOME/pylearn2data
