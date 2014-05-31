# EDs Dotfiles

This is my dotfile place to store all of my config files like .vimrc, .bashrc,
and .vim folder. I am trying to add comments to the files to explain them just,
it takes a while. They are also not done (and never will be) as I am adding new
things to them every day.

## Installation

First you have download the files by using

	git clone git://github.com/edvb54/dotfiles.git ~/dotfiles

After files have been downloaded you need to link the files to where the system
thinks they are suppose to be:

	ln -s ~/dotfiles/vim ~/.vim
	ln -s ~/dotfiles/vimrc ~/.vimrc
	ln -s ~/dotfiles/bashrc ~/.bashrc
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

In order to use the powerline plugin you need a special font. To get it use:

	cd ~/.fonts/
	git clone https://github.com/scotu/ubuntu-mono-powerline.git

Now refresh the folder:

	fc-cache -vf ~/.fonts.

Please note that is has only been tested to work on Ubuntu. If you do not use
Ubuntu this may not work.

##Contact

Check out my website at [techandcode.com](http://techandcode.com) for more,
tech and code, stuff. If you have any questions please contact me at
edvb54@gmail.com or leave a comment wherever.

-ED
