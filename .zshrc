# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mick"

DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew gem z osx rbenv rake ruby history startup mybackup osx-dev ansiweather)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

ulimit -S -c 0

setopt noclobber

set -g visual-bell on

# for Postgress.app
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
PATH="/Applications/MAMP/bin/php5.2/bin:$PATH"
PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/local/sbin:$PATH;

# Android SDK
PATH="${HOME}/Applications/Android Developer Toolkit/sdk/platform-tools:$PATH"

# From
# http://misc.twam.info/lscolors/

# For BSD (osx)
export LSCOLORS='cxfxFxDxGxDxDxhbhdacEc'

# for linux
export LS_COLORS="di=32:ln=35:so=01;35:pi=01;33:ex=01;36:bd=01;33:cd=01;33:su=37;41:sg=37;43:tw=00;42:ow=01;34;42:"

# see http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#export LSCOLORS='cxgxhxhxbxhxhxbabacaca'

#fix hard to read autocompletion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zmv!!! $ zmv '(*).txt' '${1}.bak'
autoload zmv

if [[ -f $(which rbenv) ]]; then
  echo "installing rbenv"
  export RBENV_ROOT="${HOME}/.rbenv"
  eval "$(rbenv init -)"
fi

export EDITOR="${ZSH}/custom/plugins/editor/editor.plugin.zsh"
export VISUAL="nano"
export PAGER=less
alias ls="ls -lFhG"


# LESS termcap
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export EDITOR="mvim"

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"
