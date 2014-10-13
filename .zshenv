export ZSH=$HOME/.zsh

export LANG='en_US'
export LC_ALL='en_US.UTF-8'

export GOPATH="$HOME/.go:$HOME/Code/Go"

PATH="$HOME/.bin:$PATH"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:$GOPATH/bin:$(brew --prefix go)/libexec/bin"
export PATH

# Path to man pages
export MANPATH="/usr/local/man:$MANPATH"

# Default editor
export EDITOR='nvim'

export PAGER='less --no-init --quit-if-one-screen'
# export LESS='-X -F'

# Add colors to `ls`
export LSCOLORS=ExGxcxdxCxegedabagacad
export CLICOLOR=1

# Don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1

# Disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Always colorize `grep`
export GREP_OPTIONS='--color=auto'

# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10
