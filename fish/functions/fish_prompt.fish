function fish_prompt -d 'Show prompt'
  set -l last_status $status

  # Colors.
  set -l normal (set_color normal)
  set -l yellow (set_color yellow)
  set -l magenta (set_color magenta)
  set -l cyan (set_color cyan)

  set -l pad ' '
  set -l suffix '$'

  # Array with symbols to be prepended to the prompt.
  set -l symbols

  # Virtualenv and pipenv.
  if test -n "$VIRTUAL_ENV"
    set -l icon ●
    set symbols[1] $cyan$icon$normal

    if test -n "$PIPENV_ACTIVE"
      set symbols[2] $magenta$icon$normal
    end

    set symbols[3] $pad
  end

  for symbol in $symbols
    echo -n $symbol
  end

  echo -n $yellow(prompt_pwd)$normal

  if test $last_status -gt 0
    set_color $fish_color_error
  end
  echo -n $pad$suffix$pad$normal
end
