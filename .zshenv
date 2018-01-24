export ZSH="$HOME/.zsh"

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export GOPATH="$HOME/.go:$HOME"
export CARGO_HOME="$HOME/.cargo"

# export RUST_SRC_PATH="$$HOME/src/github.com/rust-lang/rust/src"
export RUST_SRC_PATH="$($CARGO_HOME/bin/rustc --print sysroot)/lib/rustlib/src/rust/src"

# Load custom Python start-up script
PYTHONSTARTUP="$HOME/.config/pythonrc"
export PYTHONSTARTUP

# Default editor
export EDITOR='nvim'

export LESS='-R'
# export PAGER='less'

# Disables prompt mangling when activating a Python virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10

# export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_OPTS='--color=16 --inline-info'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

if [ -f ~/.zshenv.local ]; then
    . ~/.zshenv.local
fi
