export PATH=/opt/local/bin:/opt/local/sbin:$PATH							# MacPorts
export PATH=~/.cabal/bin:$PATH												# Cabal (Haskell-platform)
export PATH=/usr/local/mysql/bin:$PATH										# MySQL
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH	# Homebrew
export PATH=/usr/local/share/aclocal:$PATH									# Homebrew .m4 macros

export EDITOR=/usr/local/bin/vim
alias vim=$EDITOR
#export PS1="\u@\[\e[00;33m\]\h\[\e[00m\]:\w \$ "
export PS1="\u@\[\e[00;33m\]\h\[\e[00m\]:\w\n> "
export LC_ALL=en_GB.UTF-8

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.git:.svn

export PYTHONSTARTUP=$HOME/.pythonrc.py

alias l="ls"
alias ls="ls -GF"
alias ll="ls -lGF"
alias lsa="ls -alGF"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias grep="grep --color=always"
alias untar="tar xvzf"

# Quick access to .[g]vimrc
alias vimrc="$EDITOR ~/.vimrc"
alias gvimrc="$EDITOR ~/.gvimrc"
