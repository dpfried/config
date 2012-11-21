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
export PATH=/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/home/$USER/bin:/home/$USER/eclipse:/home/$USER/scripts:/home/$USER/Protege_4.1:.

[[ $EMACS = t ]] && unsetopt zle
[[ -s "/home/$USER/.rvm/scripts/rvm" ]] && source "/home/$USER/.rvm/scripts/rvm"  # This loads RVM into a shell session.
bindkey -e

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

[[ -f "/opt/ros/electric/setup.zsh" ]] && source /opt/ros/electric/setup.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

autoload zmv

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
