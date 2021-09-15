function px -d "Run executable in the closest virtualenv's bin folder"
    set bin $argv[1]
    set --erase argv[1]

    set -l normal (set_color normal)
    set -l color_error (set_color $fish_color_error)
    set -l cyan (set_color cyan)

    if test -z "$bin"
        echo 'Usage: px <command> [arg1, ...]'
        return 1
    end

    set -q VIRTUAL_ENV; and set -l venv "$VIRTUAL_ENV"
    or set -l venv (__python_find_virtualenv)

    # set -l venv (__python_find_virtualenv)
    if test -z "$venv"
        echo {$color_error}No virtualenv found$normal >&2
        return 1
    end

    pushd "$venv/.."
    set -lx fish_prompt_pwd_dir_length 0
    set -l venv_path (string replace "$PWD" (prompt_pwd) "$venv")
    echo {$cyan}virtualenv: $venv_path$normal >&2
    popd

    if test -x $venv/bin/$bin
        $venv/bin/$bin $argv
    else
        echo "px: Unknown command: $bin"
        return 1
    end
end

function __px_complete_list
    set -l venv (__python_find_virtualenv)
    if test -n "$venv"
        for f in (find "$venv/bin" -maxdepth 1)
            test -x "$f"; and basename $f
        end
    end
end

complete -c px -a '(__px_complete_list)'
