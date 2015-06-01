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
