# Remove greeting.
set -g fish_greeting ''

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx GOPATH $HOME/.go
set -gx CARGO_HOME $HOME/.cargo

fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/curl/bin
fish_add_path $HOME/.local/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.bin

# if defaults read -g AppleInterfaceStyle &>/dev/null
#     set -U DARK_MODE 1
# else
#     set -U -e DARK_MODE
# end

# if test -n "$VIRTUAL_ENV"
#     source "$VIRTUAL_ENV/bin/activate.fish"
# end

set -gx EDITOR nvim --noplugin -u "$HOME/.config/nvim/minimal.vim"
set -gx LESS -R

# Disables prompt mangling when activating a Python virtualenv.
set -gx PIP_REQUIRE_VIRTUALENV 1
set -gx PYTHONDONTWRITEBYTECODE 1

# Disable kubectx's fzf integration.
set -gx KUBECTX_IGNORE_FZF 1

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
