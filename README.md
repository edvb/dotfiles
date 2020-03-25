# dotfiles

This is the place I use to store all my configuration files for programs such
as Vim, Bash, Tmux, etc. These files are only designed to be used on Linux. I
recommend you not to just copy whole files, but instead copy one line at a time
that you understand and slowly build up a huge file. This way you have a setup
that fits you best.

## installation

Simply run `make install` to create all the appropriate symlinks, or run `make
install-dotfiles` just to install the dotfiles to the home directory, and `make
instal-sl` to install any suckless config header files

Now we need to install the plug-ins which are found in `vimrc.bundles`. To do
this I use Vundle, so enter this into the command line:

	git clone https://github.com/gmarik/Vundle.vim vim/bundle/Vundle.vim

After the repository has been cloned open the `vimrc.bundles` file. When inside
enter this into Vim:

	:VundleInstall

After it has finished installing you can exit the Vundle window and the
plug-ins should be installed.
