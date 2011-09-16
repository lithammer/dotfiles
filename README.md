# Install

## Vim

Note that a lot of these addons requires that Vim is compiled with
Python and Ruby

	$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

And from inside Vim run `:BundleInstall`. And run this to enable
Command-T:

	$ cd ~/.vim/bundle/Command-T/ruby/command-t/
	$ ruby extconf.rb
	$ make

And this for Pyflakes:

	$ cd ~/.vim/bundle/pyflakes-vim/
	$ git submodule init
	$ git submodule update

Run `BundleInstall!` to update plugins (note the exclamation mark)

## OS X

	$ ln -s ~/.bashrc ~/.profile
