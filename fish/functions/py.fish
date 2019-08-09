function py -w python -d "Virtual environment aware Python wrapper"
    set bin python

    # Use virtualenv if activated.
    if test -n "$VIRTUAL_ENV"; and test -x "$VIRTUAL_ENV/bin/$bin"
        echo (set_color cyan)virtualenv: (string replace $PWD (prompt_pwd) $VIRTUAL_ENV/bin/$bin)(set_color normal) >&2
        eval $VIRTUAL_ENV/bin/$bin $argv
        return $status
    end

    set -l venv (__python_find_virtualenv)
    if test -n "$venv"; and test -x "$venv/bin/$bin"
        pushd "$venv"
        echo (set_color cyan)virtualenv: (string replace "$venv" (prompt_pwd) "$venv/bin/$bin")(set_color normal) >&2
        popd
        eval $venv/bin/$bin $argv
        return $status
    end

    eval $bin $argv
end
