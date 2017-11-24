function activate_virtualenv -d 'Activate virtualenv'
  set -l curdir $PWD

  while [ "$curdir" != "/" ]
    if test -f $curdir/env/bin/activate.fish
      if test -z "$VIRTUAL_ENV"
        source $curdir/env/bin/activate.fish
      end

      return 0
    end

    set curdir (dirname $curdir)
  end

  return 1
end

