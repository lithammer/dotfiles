function fish_right_prompt
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showcolorhints 1
  __fish_git_prompt '%s'
end
