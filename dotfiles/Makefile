# This makefile is intended to speed up the setup of the environment.

DESTDIR   = $(HOME)
CFGFILES  = zshrc zshaliases zshenv vimrc gitignore_global dircolors Xdefaults xpdfrc bashrc bashaliases conkyrc xinitrc inputrc
DESTFILES = $(addprefix $(DESTDIR)/.,$(CFGFILES))


all:
	@echo "Usage: make [DESTDIR=<stage_dir>] [install|uninstall|.<filename>]"
	@echo "    install       Install all dotfiles."
	@echo "    uninstall     Uninstall all dotfiles."
	@echo "    .<filename>   Install a single file."
	@echo
	@echo "Options:"
	@echo "    DESTDIR=...   Set the destination directory (defaults to \$$HOME)."
	@echo
	@echo "Available files:"
	@$(foreach file, $(DESTFILES), echo "    $(file)";)


install: $(DESTFILES)
	@echo install: done


# Special case
$(DESTDIR)/.xmonad/xmonad.hs: xmonad/xmonad.hs
	echo mkdir -p $(DESTDIR)/.xmonad
	echo ln -s $(CURDIR)/$< $(DESTDIR)/.$<


# Little cheat, all files can be dotfiles...
$(DESTDIR)/.%: %
	ln -s $(CURDIR)/$< $(DESTDIR)/.$<


uninstall:
	$(foreach file, $(CFGFILES), rm -f $(DESTDIR)/.$(file);)
	@echo uninstall: done


.PHONY: all install uninstall

