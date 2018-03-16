set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx GOPATH $HOME/.go:$HOME
set -gx CARGO_HOME $HOME/.cargo

set -gx fish_user_paths $HOME/.bin $HOME/.go/bin $CARGO_HOME/bin /usr/local/opt/curl/bin /usr/local/sbin $fish_user_paths

set -gx EDITOR /usr/local/bin/nvim
set -gx LESS -R

# Disables prompt mangling when activating a Python virtualenv.
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx PYTHONSTARTUP $HOME/.config/pythonrc

set -gx RUST_SRC_PATH (eval $CARGO_HOME/bin/rustc --print sysroot)/lib/rustlib/src/rust/src

# Remove greeting.
set -U fish_greeting ''

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias vim=nvim
alias nv=nvim

# [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
