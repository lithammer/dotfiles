# function __auto_virtualenv --on-variable PWD -d 'Automatically activate virtualenv'
function __auto_virtualenv --on-event fish_prompt -d 'Automatically activate virtualenv'
  status --is-command-substitution; and return

  if test -n "$PIPENV_ACTIVE"
    return
  end

  # Try to activate virtualenv.
  activate_virtualenv
  if not test $status -eq 0
    # Deactivate the currently active virtualenv if we've moved somewhere
    # with no virtualenv.
    if test -n "$VIRTUAL_ENV"
      deactivate
    end
  end
end
