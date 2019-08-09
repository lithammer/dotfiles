function nvim
    if test -n "$VIRTUAL_ENV"
        command nvim $argv
        return $status
    end

    activate_virtualenv
    set -l did_activate $status

    command nvim $argv
    set -l nvim_status $status

    if test $did_activate -eq 0; and type -q deactivate
        deactivate
    end

    return $nvim_status
end

