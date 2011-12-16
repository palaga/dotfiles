# Zsh config:
#############


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Environment variables:
export EDITOR=vim
export BROWSER=chromium
export PATH=$PATH:$HOME/bin


# Load modules
autoload -U compinit promptinit
compinit
promptinit


# Completion style:
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'


# Setting up prompt:
prompt walters


# Command aliasses:
alias ls='ls --color=always'


# Suffix aliasses:
alias -s txt=$EDITOR
alias -s tex=$EDITOR
alias -s c=$EDITOR
alias -s java=$EDITOR

alias -s html=$BROWSER
alias -s pdf='xpdf'

alias -s jpg='feh -.'
alias -s png='feh -.'
alias -s gif='feh -.'

alias -s avi='mplayer'

