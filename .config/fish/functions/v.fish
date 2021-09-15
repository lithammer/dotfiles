function v -d 'Toggle closest virtual environment'
    if test -n "$VIRTUAL_ENV"; and type -q deactivate
        deactivate
    else
        activate_virtualenv
    end
end
