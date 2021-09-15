# __find_virtualenv
#
# Search for a virtualenv in the current directory and its preceeding
# directories, and if found prints it to stdout.
__find_virtualenv() {
    # zsh: required by zsh to prevent globs for failing when there's no match.
    setopt local_options
    setopt +o nomatch

    local curdir

    curdir=$PWD
    while [ "$curdir" != '/' ]; do
        for script in "$curdir"/*/pyvenv.cfg "$curdir"/.*/pyvenv.cfg; do
            if [ -e "$script" ]; then
                echo "${script%%/pyvenv.cfg}"
                return 0
            fi
        done

        curdir=$(dirname "$curdir")
    done

    # Look for virtualenvs managed by Poetry.
    # if command -v poetry > /dev/null; then
    #     if venv="$(poetry env info -p)"; then
    #         echo "$venv"
    #         return 0
    #     fi
    # fi
}

# __activate_virtualenv
#
# Activate any virtualenv found in the current direct, otherwise continues to
# scan upwards in the directory tree.
__activate_virtualenv() {
    local venv

    venv=$(__find_virtualenv)

    if [ -n "$VIRTUAL_ENV" ]; then
        # Do nothing if the venv is already active.
        if [ "$VIRTUAL_ENV" = "$venv" ]; then
            return 0
        else
            [ "$(type -t deactivate)" = 'function' ] && deactivate
        fi
    fi

    if [ -z "$venv" ]; then
        return 1
    fi

    # shellcheck source=/dev/null
    . "$venv/bin/activate"
}

__pyx() {
    local venv

    venv=${VIRTUAL_ENV:-$(__find_virtualenv)}
    if [ -z "$venv" ] || [ ! -x "$venv/bin/python" ]; then
        echo $1: No virtualenv found
        return 1
    fi

    printf '\e[0;36mvirtualenv: %s\e[m\n' "$venv"
    # shellcheck disable=SC2145
    "$venv/bin/$@"
} >&2

py() {
    __pyx python "$@"
}

compdef py=python

pip() {
    __pyx pip "$@"
}

pip3() {
    __pyx pip3 "$@"
}

v() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    else
        __activate_virtualenv
    fi
}
