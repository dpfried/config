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

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

autoload zmv

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

# theme modified from terminal party
#PROMPT='%{$fg[red]%}%(1j.[%j].)%{$fg[green]%} %% '
PROMPT='%{$fg[red]%}%(1j.[%j].)%{$fg[green]%} %% %{$reset_color%}'
# RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[blue]%}%2~$(git_prompt_info) %{$fg_bold[green]%}%* %{$fg_bold[blue]%}%m%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *%{$fg[yellow]%}"

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"
