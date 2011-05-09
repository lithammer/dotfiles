export PS1="\u@\[\e[00;33m\]\h\[\e[00m\]:\w \$ "

alias l="ls"
alias ls="ls -GF"
alias lsa="ls -alGF"
alias ..= "cd .."
alias ...= "cd .. ; cd .."
alias untar="tar xvzf"

# Quick access to .[g]vimrc
alias vimrc="$EDITOR ~/.vimrc"
alias gvimrc="$EDITOR ~/.gvimrc"
