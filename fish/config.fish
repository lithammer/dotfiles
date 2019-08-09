# Remove greeting.
set -U fish_greeting ''

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx GOPATH $HOME/.go
set -gx CARGO_HOME $HOME/.cargo

set -gx fish_user_paths $HOME/.bin $HOME/.go/bin $CARGO_HOME/bin /usr/local/opt/curl/bin /usr/local/sbin $fish_user_paths
if test -n "$VIRTUAL_ENV"
    set -gx fish_user_paths "$VIRTUAL_ENV/bin" $fish_user_paths
end

set -gx EDITOR /usr/local/bin/nvim
set -gx LESS -R

# Disables prompt mangling when activating a Python virtualenv.
set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -gx PYTHONSTARTUP $HOME/.config/pythonrc

set -gx PYTHONDONTWRITEBYTECODE 1

set -gx FZF_REVERSE_ISEARCH_OPTS '--prompt="❯ " --exact --inline-info --no-sort --height=15 --color=info:-1,prompt:3,pointer:8 --color=bg:-1,fg:-1,hl:6,bg+:8,fg+:-1,hl+:6'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
