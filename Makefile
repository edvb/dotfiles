CURDIR ?= $(.CURDIR)
TARGET = ~
TARGETSL = ~/code/downloads

symlinks = bash_profile \
           bashrc \
           config/clipit \
           config/htop \
           config/openbox \
           config/tint2 \
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

sllinks = dmenu \
          dwm \
          slock \
          st \
          surf \
          tabbed

all:
	@echo to install dotfiles to $(TARGET) run \'make install\'

install-dotfiles: $(symlinks)

install-sl: $(sllinks)

install: $(symlinks) $(sllinks)
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

$(sllinks):
	@if [ -e $(TARGETSL)/$@ ]; then \
		echo ln -fsn $(CURDIR)/sl/$@.h $(TARGETSL)/$@/config.h; \
		ln -fsn $(CURDIR)/sl/$@.h $(TARGETSL)/$@/config.h; \
	fi

.PHONY: all install-dotfiles install-sl install $(symlinks) $(sllinks)
