function fish_right_prompt
    set -g __fish_git_prompt_show_informative_status 1

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream auto
    # set -g __fish_git_prompt_showstashstate 1
    # set -g __fish_git_prompt_use_informative_chars 1
    set -g __fish_git_prompt_showcolorhints 1

    fish_git_prompt '%s'
end
