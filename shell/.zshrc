# Zsh config:
#############

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load .bashrc where all compatible defaults are stored:
# Environment variables
# General startup settings (dircolors, etc)
source ~/.bashrc
fpath=($fpath ~/.zshfunctions)
limit coredumpsize unlimited

# History configuration:
export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

setopt hist_ignore_all_dups # Do not keep duplicate entries
setopt hist_find_no_dups    # Do not show dupplicates, when searching
setopt hist_no_store        # Do not store history commands (fc)
setopt hist_no_functions    # Do not store function definitions
setopt hist_ignore_space    # Do not store commands, which start with a space
setopt prompt_subst         # Enable prompt substitution


# Load modules
autoload -U compinit promptinit edit-command-line
compinit
promptinit
zle -N edit-command-line


# Completion rules:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:cd:*' force-list always

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'


# Setting up prompt:
prompt palaga


# Key binds emacs style:
bindkey -e
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^w' kill-region
bindkey '^R' history-incremental-search-backward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# Explicitly set word characters
WORDCHARS='~?'


# Zsh aliases:
source ~/.zshaliases
if [[ -e ~/.zshcustom ]]; then
  source ~/.zshcustom;
fi


# Oh-My-Zsh configuration:
#ZSH=$HOME/.oh-my-zsh
#plugin=(git)
#source $ZSH/oh-my-zsh.sh

# Enable bash completion compatibility
autoload -U +X bashcompinit && bashcompinit
