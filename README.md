# EDs Dotfiles

This is my dotfile place to store all of my config files like .vimrc, .bashrc,
and .Vim folder. I am trying to add comments to the files to explain them just,
it takes a while. They are also not done, and never will be, as I am adding new
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

Now we need to install the plug-ins which are found in vimrc.bundles. To do this
I use Vundle, so enter this into the command line:

	git clone https://github.com/gmarik/Vundle.vim ~/dotfiles/vim/bundle/Vundle.vim

After the repository has been cloned edit the vimrc.bundles file. When inside
enter this into Vim:

	:VundleInstall

After it has finished installing you can exit the Vundle window and the plug-ins
should be installed.

In order to use the powerline plug-in you need a special font. To get it use:

	cd ~/.fonts/
	git clone https://github.com/scotu/ubuntu-mono-powerline.git

Now refresh the folder:

	fc-cache -vf ~/.fonts.

Please note that is has only been tested to work on Ubuntu. If you do not use
Ubuntu this may not work.

## Why You Should Use "set nocompatible"

There is a lot of controversy over the use of `set nocompatible` in the
Vim world. This command makes Vim use the new features that they added and
not bee compatible with Vi. This is because if Vim sees a .vimrc file in
the home directory then it auto-magically sets no compatibility. But
however if you load a .vimrc using `vim -u .new_vimrc` or `:so .new_vimrc`
then it will load Vim being compatible with vi. It is also a case of
better safe than sorry.

##Contact

Check out my website at [techandcode.com](http://techandcode.com) for more,
tech and code. If you have any questions please contact me at
edvb54@gmail.com or leave a comment wherever.

-ED
