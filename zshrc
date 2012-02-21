# Zsh config:
#############


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

# Environment variables:
export EDITOR=vim
export BROWSER=chromium
export PATH=$PATH:$HOME/bin


# Load modules
autoload -U compinit promptinit
compinit
promptinit


# Completion rules:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:cd:*' force-list always

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'


# Setting up prompt:
prompt walters


# Directory colors:
eval `dircolors -b $HOME/.dircolors`


# Command aliasses:
alias ls='ls --color=always'


# Suffix aliasses:
alias -s txt=$EDITOR
alias -s tex=$EDITOR
alias -s c=$EDITOR
alias -s java=$EDITOR
alias -s py=$EDITOR

alias -s html=$BROWSER
alias -s pdf='xpdf'

alias -s jpg='feh -.'
alias -s png='feh -.'
alias -s gif='feh -.'

alias -s avi='mplayer'


# Key binds:
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# Oh-My-Zsh configuration:
#ZSH=$HOME/.oh-my-zsh
#plugin=(git)
#source $ZSH/oh-my-zsh.sh

