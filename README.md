# dotfiles

This is the place I use to store all my configuration files for programs such
as Vim, Bash, Tmux, etc. These files are designed to be used on Linux and most
likely won't work on other machines. I recommend you not to just copy whole
files, but instead copy one line at a time that you understand and slowly build
up a huge file. This way you have a setup that fits you best.

## Installation

First you have to download the files by using:

	git clone git://github.com/edvb54/dotfiles.git ~/dotfiles

After the files have been downloaded you need to link the files to where the
system looks for them:

	ln -s ~/dotfiles/vim ~/.vim
	ln -s ~/dotfiles/vimrc ~/.vimrc
	ln -s ~/dotfiles/bashrc ~/.bashrc
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/gitconfig ~/.gitconfig
	ln -s ~/dotfiles/bin ~/bin
	ln -s ~/dotfiles/themes ~/.themes/
	ln -s ~/dotfiles/config/clipit/ ~/.config/
	ln -s ~/dotfiles/config/htop/ ~/.config/
	ln -s ~/dotfiles/config/openbox/ ~/.config/
	ln -s ~/dotfiles/config/terminator/ ~/.config/

Now we need to install the plug-ins which are found in `vimrc.bundles`. To do this
I use Vundle, so enter this into the command line:

	git clone https://github.com/gmarik/Vundle.vim ~/dotfiles/vim/bundle/Vundle.vim

After the repository has been cloned open the `vimrc.bundles` file. When inside
enter this into Vim:

	:VundleInstall

After it has finished installing you can exit the Vundle window and the plug-ins
should be installed.

## License

GPL v3 License

