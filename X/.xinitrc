#! /usr/bin/env bash

# Load Xdefaults, if exist
#[[ -f ~/.Xdefaults]] && xrdb -merge ~/.Xdefaults

eval $(cat $HOME/.fehbg)          # Set wallpaper
urxvtd -q -o -f                   # Start terminal daemon
wmname LG3D                       # Rename my WM, for java GUI
syndeamon -d                      # Disable touchpad when typing
xsetroot -cursor_name left_ptr    # Change cursor from cross to pointer
unclutter -idle 3 &               # Hide cursor after 3 seconds


#exec $HOME/local/bin/dwm-clock &
#exec $HOME/local/bin/dwm
xmodmap .xmodmap
exec xmonad

