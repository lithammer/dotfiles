# eval "$(command pyenv init --no-rehash - zsh)"
export PATH="$HOME/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source "/usr/local/Cellar/pyenv/$(pyenv --version | awk '{print $2}')/completions/pyenv.zsh"
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  activate|deactivate|rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}

# eval "$(command pyenv virtualenv-init --no-rehash - zsh)"
export PYENV_VIRTUALENV_INIT=1
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
}
