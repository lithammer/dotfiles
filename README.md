# Install

## Vim

	$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

And from inside VIM run `:BundleInstall`. And run this to enable
Command-T:

	$ cd ~/.vim/bundle/Command-T/ruby/command-t/
	$ ruby extconf.rb
	$ make

And this for Pyflakes:

	$ cd ~/.vim/bundle/pyflakes-vim/
	$ git submodule init
	$ git submodule update

## OS X

	$ ln -s ~/.bashrc ~/.profile
