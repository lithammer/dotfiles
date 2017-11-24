function fish_prompt -d 'Show prompt'
  set -l last_status $status

  # Colors.
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l normal (set_color normal)

  set -l pad ' '
  set -l suffix '$'

  if test -n "$VIRTUAL_ENV"
    set -l virtualenv (basename (dirname "$VIRTUAL_ENV"))
    echo -n $cyan$virtualenv$normal$pad
  end

  echo -n $yellow(prompt_pwd)$normal

  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  echo -n $pad$suffix$pad$normal
end
