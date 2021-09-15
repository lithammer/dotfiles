function fish_prompt -d 'Show prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    # Colors.
    set -l bold (set_color --bold)
    set -l normal (set_color normal)
    set -l black (set_color black)
    set -l brblack (set_color brblack)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l bryellow (set_color bryellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l brmagenta (set_color brmagenta)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l brblack (set_color brblack)

    set -l color_error (set_color $fish_color_error)
    set -l color_cwd (set_color $fish_color_cwd)

    set -l ws ' '
    set -l suffix '❯'

    # Array with symbols to be prepended to the prompt.
    set -l symbols

    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT 1
    end

    # Virtualenv and pipenv.
    set -l venv (__python_find_virtualenv)
    if test -n "$VIRTUAL_ENV"
        set -l icon '❯'

        test "$VIRTUAL_ENV" = "$venv"; and set symbols[1] $cyan$icon$normal
        or set symbols[1] $color_error$icon$normal
    else if test -n "$venv"
        set -l icon '❯'

        set symbols[1] $brblack$icon$normal
    end

    # Write pipestatus
    # If the status was carried over (e.g. after `set`), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l prompt_status (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) (set_color $bold_flag $fish_color_status) $last_pipestatus)

    echo -n -s $prompt_status $color_cwd (prompt_pwd) $normal $ws $symbols $bryellow $suffix $ws $normal
end
