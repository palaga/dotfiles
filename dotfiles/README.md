Dotfiles
========

My personal dotfiles are stored in this directory. When I want to install them,
I will create soft links to these files, in my home directory. This is automated
a bit with the Makefile.

Installation
------------
The makefile is kept simple. There are three main calls:

```make install
make uninstall
make .<filename>```

The first installs all dotfiles in the home directory. The second uninstalls
all dotfiles. The last installs a single file. In addition, `DESTDIR` can be set
to different directory, to tryout the installation process.

