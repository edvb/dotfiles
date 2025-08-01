CURDIR ?= $(.CURDIR)
TARGET = ~
TARGETSL = ~/code/dl/sl

symlinks = bash_profile \
           bashrc \
           config/clipit \
           config/htop \
           config/openbox \
           config/tint2 \
           config/sxhkd \
           conkyrc \
           ctags \
           dircolors \
           emacs \
           gdbinit \
           gitconfig \
           gitignore \
           nvimrc \
           pylintrc \
           terminfo \
           themes \
           tmux \
           tmux.conf \
           vim \
           vimrc \
           vimrc.bundles \
           xinitrc \
           xmonad/xmonad.hs \
           xmonad/xmobarrc \
           zshrc

sllinks = dmenu \
          dwm \
          dvtm \
          slock \
          slstatus \
          st \
          surf \
          tabbed

all:
	@echo to install dotfiles to $(TARGET) run \'make install\'

install-dotfiles: $(symlinks)

install-sl: $(sllinks)

install: $(symlinks) $(sllinks)
	ln -fsn $(CURDIR)/bin $(TARGET)/bin

# create symbolic link in home to dotfile
# remove link if one already exists or save file as a backup
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

# if suckless project is downloaded, link config header there
$(sllinks):
	@if [ -e $(TARGETSL)/$@ ]; then \
		echo ln -fsn $(CURDIR)/sl/$@.h $(TARGETSL)/$@/config.h; \
		ln -fsn $(CURDIR)/sl/$@.h $(TARGETSL)/$@/config.h; \
	fi

.PHONY: all install-dotfiles install-sl install $(symlinks) $(sllinks)
