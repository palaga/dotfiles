#! /bin/sh

set -e

: ${NF_VERSION=v3.2.1}
: ${XDG_CACHE_HOME=${HOME}/.cache}
: ${NF_CACHE_DIR="${XDG_CACHE_HOME}/nerdfont"}
: ${FONTS_DIR="${HOME}/.local/share/fonts"}


extract_zip() {
  unzip "$1" -d "$2"
}

extract_xz() {
  tar -xvJf "$1" -C "$2"
}

get_file() {
  filename="$1"
  curl --clobber -OLJ https://github.com/ryanoasis/nerd-fonts/releases/download/${NF_VERSION}/$filename
}

install_missing_fonts() {
  compression="$1"

  printf "Updating cache using %s files...\n" "$compression"

  sum_file="SHA-256.${compression}.txt"
  grep "\.${compression}$" SHA-256.txt > "$sum_file"

  sha256sum -c "$sum_file" 2>/dev/null \
  | grep FAILED \
  | cut -d: -f1 \
  | while read fn; do
    printf "Downloading missing font zip '%s'...\n" "$fn"
    get_file "$fn"

    printf "Unpacking font zip '%s'..." "$fn"
    "extract_$compression" "$fn" "$FONTS_DIR"
  done
}


printf "Create directories...\n"
mkdir -p "$NF_CACHE_DIR"
mkdir -p "$FONTS_DIR"

printf "Go to the cache directory...\n"
cd "$NF_CACHE_DIR"

printf "Download the SHA-256 sums files...\n"
get_file SHA-256.txt

if which xz > /dev/null; then
  install_missing_fonts xz
else
  install_missing_fonts zip
fi

printf "Update font cache...\n"
fc-cache -fv

printf "DONE!!!\n"
