# This makefile is intended to speed up the setup of the environment.
# Still a WIP

PREFIX   = $(HOME)
CFGFILES = zshrc zshenv vimrc gitignore_global dircolors Xdefaults xpdfrc

RED      = `tput setaf 1`
GREEN    = `tput setaf 2`
BOLD     = `tput bold`
BRED     = $(BOLD)$(RED)
BGREEN   = $(BOLD)$(GREEN)
CLEAR    = `tput sgr0`


all: install


install: $(CFGFILES)
	@$(foreach\
		file,\
		$(CFGFILES),\
		echo -n "Installing .$(file): " && ln -s $(CURDIR)/$(file) $(PREFIX)/.$(file) 2>/dev/null && echo $(BGREEN)done$(CLEAR) || echo $(BRED)failed$(CLEAR);\
	)
	@echo "Installation complete."


clean:
	@$(foreach\
		file,\
		$(CFGFILES),\
		echo -n "Removing .$(file): " && rm -f $(PREFIX)/.$(file) && echo $(BGREEN)done$(CLEAR) || echo $(BRED)failed$(CLEAR);\
	)
	@echo "Done"


.PHONY: all install clean

