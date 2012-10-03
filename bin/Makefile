# Simplify installing scripts

DESTDIR   = $(HOME)/bin
SCRIPTS   = chromovie git_diff_wrapper vu_proxy
DESTFILES = $(addprefix $(DESTDIR)/,$(SCRIPTS))


install: $(DESTFILES)


$(DESTDIR):
	mkdir -p $(DESTDIR)


$(DESTDIR)/%: % $(DESTDIR)
	ln -s $(CURDIR)/$< $(DESTDIR)/$<


uninstall:
	rm -f $(DESTFILES)


.PHONY: install uninstall

