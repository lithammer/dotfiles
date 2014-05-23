# Load ~/.aliases, and ~/.functions
for file in ~/.{aliases,functions}; do
    [ -r "$file"  ] && [ -f "$file"  ] && source "$file"
done
unset file

# http://golang.org/doc/code.html#GOPATH
export GOPATH="$HOME/.go"

# PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin"
PATH="$GOPATH/bin:$PATH"
PATH="$HOME/.bin:$PATH"

export PATH

for dir in coreutils gnu-sed; do
    MANPATH="/usr/local/opt/$dir/libexec/gnuman:$MANPATH"
done
export MANPATH

# Make vim the default editor
export EDITOR="vim"

# Ignore commands that start with spaces and duplicates
export HISTCONTROL=ignoreboth

# Increase the maximum number of lines contained in the history file
# (default value is 500)
export HISTFILESIZE=5000

# Don't add certain commands to the history file
export HISTIGNORE="&:[bf]g:c:clear:exit:q:ll:ls -l:pwd:* --help"

# Increase the maximum number of commands to remember in the command history
# (default value is 500)
export HISTSIZE=5000

# Prefer US English and use UTF-8 encoding
export LANG="en_GB"
export LC_ALL="en_GB.UTF-8"

# Don't clear the screen after quitting a man page
export MANPAGER="less -X"

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.class:.beam:__pycache__

# Python won’t try to write .pyc or .pyo files on the import of source modules
# http://docs.python.org/dev/using/cmdline.html#envvar-PYTHONDONTWRITEBYTECODE
# export PYTHONDONTWRITEBYTECODE=true

# Environment variable for the docker daemon
export DOCKER_HOST=tcp://

# Customize `ls` colors
export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Includes filenames beginning with a . (dot) in the results of pathname
# expansion.
shopt -s dotglob

# Extended pattern matching
shopt -s extglob

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd` command
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Do not attempt to search the PATH for possible
# completions when completion is attempted on an empty line
shopt -s no_empty_cmd_completion

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion"
fi

# Enable bash completion for pip
if which pip > /dev/null; then
    eval "$(pip completion --bash)"
fi

# Enable pyenv
# https://github.com/yyuu/pyenv
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

# Enable z
if [ -e $(brew --prefix)/etc/profile.d/z.sh  ]; then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# Virtualenwrapper settings
if [ -e '/usr/local/bin/virtualenvwrapper_lazy.sh' ]; then
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        BLACK=$(tput setaf 0)
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        GRAY=$(tput setaf 8)
        GREY=$(tput setaf 8)
        ORANGE=$(tput setaf 172)
    else
        BLACK=$(tput setaf 0)
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        GRAY=$(tput setaf 8)
        GREY=$(tput setaf 8)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    BLACK="\033[0;30m"
    RED="\033[0;31m"
    GREEN="\033[1;32m"
    YELLOW="\033[1;33m"
    BLUE="\033[1;34m"
    MAGENTA="\033[1;35m"
    CYAN="\033[1;36m"
    WHITE="\033[1;37m"
    GRAY="\033[1;38m"
    GREY="\033[1;38m"
    BOLD=""
    RESET="\033[m"
fi

export BLACK
export RED
export GREEN
export YELLOW
export BLUE
export MAGENTA
export CYAN
export WHITE
export GRAY
export GREY
export BOLD
export RESET

# Add colors to the man page
# man() {
#     env LESS_TERMCAP_mb=$'\e[01;31m' \
#         LESS_TERMCAP_md=$'\e[01;38;5;74m' \
#         LESS_TERMCAP_me=$'\e[0m' \
#         LESS_TERMCAP_se=$'\e[0m' \
#         LESS_TERMCAP_so=$'\e[30;48;5;11m' \
#         LESS_TERMCAP_ue=$'\e[0m' \
#         LESS_TERMCAP_us=$'\e[04;38;5;146m' \
#     man "$@"
# }
export LESS_TERMCAP_md="$BLUE"

# Disable virtualenvs PS1 prefix
VIRTUAL_ENV_DISABLE_PROMPT=true

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM='auto'
GIT_PS1_SHOWCOLORHINTS=true

function __virtualenv_ps1() {
    printf "${VIRTUAL_ENV:+[\[$MAGENTA\]`basename ${VIRTUAL_ENV}`\[$RESET\]] }"
}

function __pyenv_ps1() {
    local version_name=$(pyenv version-name)
    if [ "$version_name" != "system" ]; then
        printf "\[$BLUE\]$version_name\[$RESET\] "
    fi
}

function __exit_code() {
    # http://stackoverflow.com/a/5946917/1862923
    printf '%.*s' $? $?
}

prompt_command () {
    __git_ps1 "\[$RED\]$(__exit_code)\[$RESET\] $(__virtualenv_ps1)$(__pyenv_ps1)\[$GREY\]\w\[$RESET\]" " \[$RED\]❯\[$YELLOW\]❯\[$GREEN\]❯\[$RESET\] " " (%s)"

    # Make new shells get the history lines from all previous shells instead of
    # the default "last window closed" history. Do this last otherwise it will
    # mess with the $? variable used in the prompt.
    history -a
}

# The value is used as the number of trailing directory components to retain
# when expanding the \w prompt string escapes. Characters removed are replaced
# with an ellipsis.
export PROMPT_DIRTRIM=3
export PROMPT_COMMAND=prompt_command

export PS2="\[$ORANGE\]→ \[$RESET\]"
