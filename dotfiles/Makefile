# This makefile is intended to speed up the setup of the environment.

DESTDIR   = $(HOME)
CFGFILES  = zshrc zshenv vimrc gitignore_global dircolors Xdefaults xpdfrc
DESTFILES = $(addprefix .,$(CFGFILES))


all: $(CFGFILES)
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


# Little cheat, all files can be dotfiles...
.%: %
	ln -s $(CURDIR)/$< $(DESTDIR)/.$<


uninstall:
	$(foreach file, $(CFGFILES), rm -f $(DESTDIR)/.$(file);)
	@echo uninstall: done


.PHONY: all install uninstall

