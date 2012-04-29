# This makefile is intended to speed up the setup of the environment.

CC      = gcc
CFLAGS  = -Wall -pedantic -std=c99 -lX11
LDFLAGS = -lX11
DWMDIR  = $(HOME)/dwm
PREFIX  = $(HOME)/local


all: $(DWMDIR)/dwm dwm-clock


dwm-clock.o: dwm-clock.c
	$(CC) $(CFLAGS) -c $<


dwm-clock: dwm-clock.o
	$(CC) $(LDFLAGS) -o $@ $<


$(DWMDIR)/dwm: $(DWMDIR)/dwm.c $(DWMDIR)/Makefile config.def.h
	cp config.def.h $(DWMDIR)/config.h
	make -C $(DWMDIR)


install: $(DWMDIR)/dwm $(DWMDIR)/Makefile dwm-clock
	make -C $(DWMDIR) PREFIX=$(PREFIX) install
	cp dwm-clock $(PREFIX)/bin


uninstall:
	make -C $(DWMDIR) PREFIX=$(PREFIX) uninstall
	rm -f $(PREFIX)/bin/dwm-clock


clean:
	rm -f dwm-clock{,.o}


.PHONY: all install uninstall

