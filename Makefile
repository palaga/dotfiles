# This makefile is intended to speed up the setup of the environment.
# Still a WIP

PREFIX   = $(HOME)
CFGFILES = zshrc zshenv vimrc gitignore_global dircolors Xdefaults xpdfrc

all: install

install: $(CFGFILES)
	$(foreach file, $(CFGFILES),ln -s $(CURDIR)/$(file) $(PREFIX)/.$(file);)

clean:
	$(foreach file, $(CFGFILES),rm -f $(PREFIX)/.$(file);)


.PHONY: all install clean
