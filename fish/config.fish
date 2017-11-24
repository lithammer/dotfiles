set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx GOPATH $HOME/.go:$HOME
set -gx CARGO_HOME $HOME/.cargo

set -gx fish_user_paths $HOME/.bin $HOME/.go/bin $CARGO_HOME/bin /usr/local/opt/curl/bin $fish_user_paths

set -gx EDITOR /usr/local/bin/nvim
set -gx PAGER 'less --no-init --quit-if-one-screen --raw-control-chars'
set -gx LESS -R

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx PYTHONSTARTUP $HOME/.config/pythonrc

set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# Remove greeting.
set -U fish_greeting ''

alias tree='tree -C -I "node_modules|env|vendor"'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

alias vim=nvim
alias nv=nvim

# [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
