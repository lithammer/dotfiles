function activate_virtualenv -d 'Activate virtualenv'
  set -l curdir $PWD

  while test "$curdir" != "/"
    for script in $curdir/*/bin/activate.fish
      set -l venv_dir (string replace '/bin/activate.fish' '' $script)

      if test -n "$VIRTUAL_ENV"; and test "$venv_dir" != "$VIRTUAL_ENV"
        deactivate
      end

      if test -z "$VIRTUAL_ENV"
        source "$script"
      end

      return 0
    end

    set curdir (dirname $curdir)
  end

  return 1
end
