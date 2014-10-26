#! /bin/sh
# Check system for certain software:

check () {
  if command -v $1 > /dev/null 2>&1; then
    echo -n "Command found: '$1'"
    if version=$(eval $2 2>&1 | head -1); then
      echo ", version found: $version"
    else
      echo ", version not found: $2"
    fi
  else
    echo "Command not found: '$1'";
  fi
}


get_system () {
  echo "System: $(uname -a)"
}

# Perform checks:
get_system
check "zsh" "zsh --version"
check "git" "git --version"
check "hg" "hg --version"
check "bash" "bash --version"
check "make" "make --version"
check "gcc" "gcc --version"
check "python" "python -V"
check "python2" "python2 -V"
check "python3" "python3 -V"
check "ghc" "ghc --version"
check "tclsh" "echo 'puts [info patchlevel]' | tclsh"
check "pdflatex" "pdflatex -version"

