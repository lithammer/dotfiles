function __auto_virtualenv --on-variable PWD -d 'Automatically activate virtualenv'
  status --is-command-substitution; and return

  activate_virtualenv
  if not test $status -eq 0
    if test -n "$VIRTUAL_ENV"
      deactivate
    end
  end
end
