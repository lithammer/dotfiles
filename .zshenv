export ZSH="$HOME/.zsh"

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export GOPATH="$HOME/.go:$HOME"
export CARGO_HOME="$HOME/.cargo"

# export RUST_SRC_PATH=/usr/local/src/rust/src
export RUST_SRC_PATH="$($HOME/.cargo/bin/rustc --print sysroot)/lib/rustlib/src/rust/src"

# Load custom Python start-up script
PYTHONSTARTUP="$HOME/.config/pythonrc"
export PYTHONSTARTUP

# Path to man pages
export MANPATH="/usr/local/man:$MANPATH"

# Default editor
export EDITOR='nvim'

export PAGER='less --no-init --quit-if-one-screen --raw-control-chars'
export LESS='-R'

# Add colors to `ls`
# export LSCOLORS=ExGxcxdxCxegedabagacad
export LSCOLORS=exgxcxdxcxegedabagacad
export CLICOLOR=1

# Don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1

# Disables prompt mangling when activating a Python virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='--color=16 --inline-info'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

if [ -f ~/.zshenv.local ]; then
    source ~/.zshenv.local
fi
