#!/usr/bin/env zsh
export ZSH="$HOME/.zsh"

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

GOPATH="$HOME/.go"
CARGO_HOME="$HOME/.cargo"
# Consistent Python user base directory
export PYTHONUSERBASE="$HOME/.local"

PATH="$HOME/.bin:$PATH"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$CARGO_HOME/bin"
PATH="$PATH:$PYTHONUSERBASE/bin"
export PATH

GOPATH="$GOPATH:$HOME"
export GOPATH

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

# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10

# Load custom Python start-up script (enables tab-completion)
# export PYTHONSTARTUP="$HOME/.pythonrc"

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--color=16 --inline-info --tiebreak=end"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -f ~/.zshenv.local ]; then
    source ~/.zshenv.local
fi
