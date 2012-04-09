# This makefile is intended to speed up the setup of the environment.
# Still a WIP

PREFIX   = $(HOME)
CFGFILES = zshrc zshenv vimrc gitignore_global dircolors Xdefaults xpdfrc


all: $(CFGFILES)


zshrc: zshrc
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


zshenv: zshenv
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


vimrc: vimrc
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


gitignore_global: gitignore_global
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


dircolors: dircolors
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


Xdefaults: Xdefaults
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


xpdfrc: xpdfrc
	ln -s $(CURDIR)/$< $(PREFIX)/.$<


clean:
	$(foreach file, $(CFGFILES), rm -f $(PREFIX)/.$(file))


.PHONY: all install clean $(CFGFILES)

