function nv -w nvim
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    command nvim --noplugin -u $XDG_CONFIG_HOME/nvim/minimal.vim $argv
end

