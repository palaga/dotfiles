# Zsh config:
#############

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load .bashrc where all compatible defaults are stored:
# Environment variables
# General startup settings (dircolors, etc)
source ~/.bashrc
fpath=($fpath ~/.zshfunctions)

# Load modules
autoload -U compinit promptinit edit-command-line
compinit
promptinit
zle -N edit-command-line

if [ -d /usr/share/zplug ]; then
  ZPLUG_HOME=/usr/share/zplug
elif [ -d "$HOME/.zplug" ]; then
  ZPLUG_HOME="$HOME/.zplug"
fi

if [ ! -z "$ZPLUG_HOME" ]; then
  source "$ZPLUG_HOME/init.zsh"

  zplug mafredri/zsh-async, from:github
  zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

  zstyle :prompt:pure:git:fetch only_upstream yes
  zstyle ':prompt:pure:prompt:success' color green
  zstyle ':prompt:pure:prompt:error' color red

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
else
  USE_ZPLUG=0
  printf "\e[33mWARNING\e[m: Failed to load zplug, won't load extensions!!\n"
fi


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


# Completion rules:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

zstyle ':completion:*:cd:*' force-list always

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %B%d%b'


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

# Enable bash completion compatibility
autoload bashcompinit && bashcompinit


# Enable zed editor
autoload zed


# Zsh aliases:
source ~/.zshaliases

# Load local host configurations
if [ -d ~/.zshcustom.d ]; then
  for script in $(find $HOME/.zshcustom.d/ \( -type f -o -type l \) -name '*.zsh' | sort); do
    source "$script"
  done
fi
