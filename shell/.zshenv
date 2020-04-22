# Start ssh/gpg agent if needed. If one already exists, just set the environment
# variables, so that ssh/gpg clients can use them. Keys should be added
# manually, through ssh-add.
# This line tells keychain to start agents when needed (-Q). Do not print any
# information about yourself (--quiet), but do print some environment variables,
# containing information about the agents (--eval).
if (($+commands[keychain])); then
    eval $(keychain --eval --quiet -Q)
fi

export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/.local/lib:$LIBRARY_PATH
export CPATH=$HOME/.local/include:$CPATH
export CPLUS_INCLUDE_PATH=$HOME/.local/include:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=$HOME/.local/include:$C_INCLUDE_PATH

# Load local host configurations
if [ -d ~/.zshenv.d ]; then
  for script in $(find $HOME/.zshenv.d/ -type f -name '*.zsh' | sort -n); do
    source "$script"
  done
fi
