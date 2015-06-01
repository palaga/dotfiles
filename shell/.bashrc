# Just to have some propper functionality in a bash session.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash only setup:
PS1='[\u@\h \W]\$ '

# GUI only setup:
if [ $DISPLAY ]; then
    xset -b;
fi

# General setup:
eval `dircolors -b $HOME/.dircolors`
ulimit -c unlimited

# Environment variables:
export EDITOR=vim
export BROWSER=chromium
export PDFVIEWER=xpdf
export IMAGEVIEWER='feh -.'
export MEDIAPLAYER='mplayer'
export PATH=$HOME/.bin:$HOME/.local/bin:$HOME/.cabal/bin:$PATH
export TCLLIBPATH=". $TCLLIBPATH"

# Less configuration:
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

source ~/.bashaliases
[ -e ~/.bashcustom ] && source ~/.bashcustom
