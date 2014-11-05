# ED's Dotfiles

This is the place I use to store all my configuration files for programs such
as Vim, Bash, and Tmux. These files are designed to be used on Linux and most
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
	ln -s ~/dotfiles/gmrunrc ~/.gmrunrc
	ln -s ~/dotfiles/bin ~/bin
	ln -s ~/dotfiles/themes ~/.themes/
	ln -s ~/dotfiles/pentadactyl/ ~/.pentadactyl/
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

## Why You Should Use "set nocompatible"

There is a lot of controversy over the use of `set nocompatible` in the Vim
world. This command makes Vim use the new features that they added, extending
Vi, thus not being compatible with it. However, people say this redundant
because if Vim sees a `.vimrc` file in the home directory then it automatically
sets no compatibility. But however, if you load a `.vimrc` using `vim -u
.new_vimrc` or `:so .new_vimrc` then it will load Vim being compatible with Vi,
if it does not contain `set nocompatible`. It is also a case of better safe
than sorry, adding one line of 16 charaters to your `.vimrc` file won't hurt.

##Contact

Check out our website at [techandcode.com](http://techandcode.com) for more,
tech and code. If you have any questions please contact me at edvb54@gmail.com
or leave a comment wherever.

-ED

## License

GPL v3 License

