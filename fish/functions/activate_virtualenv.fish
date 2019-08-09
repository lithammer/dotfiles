function activate_virtualenv -d 'Activate virtualenv'
    set -l venv (__python_find_virtualenv)

    if test -n "$VIRTUAL_ENV"
        # Do nothing if the venv is already active.
        if test "$VIRTUAL_ENV" = "$venv"
            return 0
        else if type -q deactivate
            deactivate
        end
    end

    if test -z "$venv"
        return 1
    end

    source "$venv/bin/activate.fish"
end
