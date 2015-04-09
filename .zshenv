#!/usr/bin/env zsh
export ZSH=$HOME/.zsh

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

GOPATH="$HOME/.go"

PATH="$HOME/.bin:$PATH"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:$GOPATH/bin:$(brew --prefix go)/libexec/bin"
export PATH

GOPATH="$GOPATH:$HOME/Code/.go"
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

# https://github.com/neovim/neovim/pull/2198
if [ -z "$TMUX" ]; then
    export NVIM_TUI_ENABLE_TRUE_COLOR=1
fi
