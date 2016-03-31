CURDIR ?= $(.CURDIR)
TARGET = ~/remote
TARGETCONH = ~/remote/code/downloads

symlinks = bash_profile \
           bashrc \
           conkyrc \
           dircolors \
           emacs \
           gitconfig \
           nvimrc \
           terminfo \
           themes \
           tmux \
           tmux.conf \
           vim \
           vimrc \
           vimrc.bundles \
           zshrc

confighlink = dmenu \
              tabbed \
              st

all:
	@echo to install dotfiles to $(TARGET) run \'make install\'

install: $(symlinks) $(confighlink)
	ln -fsn $(CURDIR)/bin $(TARGET)/bin

$(symlinks):
	@if [ -e $(TARGET)/.$@ ]; then \
		if [ -L $(TARGET)/.$@ ]; then \
			rm -f $(TARGET)/.$@; \
		else \
			echo mv $(TARGET)/.$@ $(TARGET)/$@-old; \
			mv $(TARGET)/.$@ $(TARGET)/$@-old; \
		fi \
	fi
	ln -sn $(CURDIR)/$@ $(TARGET)/.$@

$(confighlink):
	@if [ -e $(TARGETCONH)/$@ ]; then \
		echo ln -fsn $(CURDIR)/config.h/$@.config.h $(TARGETCONH)/$@/config.h; \
		ln -fsn $(CURDIR)/config.h/$@.config.h $(TARGETCONH)/$@/config.h; \
	fi

.PHONY: all install $(symlinks) $(confighlink)
