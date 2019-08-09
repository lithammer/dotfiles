function fish_prompt -d 'Show prompt'
    set -l last_status $status

    # Colors.
    set -l bold (set_color --bold)
    set -l normal (set_color normal)
    set -l black (set_color black)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l brblack (set_color brblack)
    set -l error (set_color $fish_color_error)

    set -l pad ' '
    set -l suffix "$yellow\$$normal"

    # Array with symbols to be prepended to the prompt.
    set -l symbols

    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT 1
    end

    # Virtualenv and pipenv.
    set -l venv (__python_find_virtualenv)
    if test -n "$VIRTUAL_ENV"
        set -l icon '#'
        if test "$VIRTUAL_ENV" = "$venv"
            set symbols[3] $cyan$icon$normal
        else
            set symbols[3] $error$icon$normal
        end
        set symbols[4] $pad
    else if test -n "$venv"
        set -l icon '#'
        set symbols[3] $white$icon$normal
        set symbols[4] $pad
    end

    if test $last_status -gt 0
        set symbols[1] $error$last_status$normal$pad
    end

    for symbol in $symbols
        printf $symbol
    end

    printf $magenta(prompt_pwd)$normal
    printf $pad$suffix$pad$normal
end
