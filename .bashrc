# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

if [[ "$OSTYPE" =~ ^darwin ]]; then
	export PATH=/usr/local/sbin:$PATH
	# Put /usr/local/bin at the front, not the end
	export PATH=/usr/local/bin:$PATH
	# Homebrew installs Python distribute here, needed for easy_install/pip
	export PATH=$PATH:$(brew --prefix)/share/python:$(brew --prefix)/share/python3
	# Add RVM to PATH for scripting
	export PATH=$PATH:$HOME/.rvm/bin
	# Cabal (Haskell-Platform)
	export PATH=$HOME/.cabal/bin:$PATH
	# Node.js npm
	export PATH="$(brew --prefix)/share/npm/bin:$PATH"
	# brew-installed GNU core utilities bin
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi

# brew-installed GNU core utilities manpages
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

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
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Don't clear the screen after quitting a man page
export MANPAGER="less -X"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.class:.beam:__pycache__

# Make Python not write .pyc and .pyo files
# http://docs.python.org/dev/using/cmdline.html#envvar-PYTHONDONTWRITEBYTECODE
export PYTHONDONTWRITEBYTECODE=true

# Virtualenwrapper directory
export WORKON_HOME=$HOME/.virtualenvs

# Virtualenwrapper settings
if [[ "$OSTYPE" =~ ^darwin ]]; then
	[ -e $(brew --prefix)/bin/virtualenvwrapper.sh ] && . $(brew --prefix)/bin/virtualenvwrapper.sh
else
	[ -e /usr/bin/virtualenvwrapper.sh ] && . /usr/bin/virtualenvwrapper.sh
fi

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Include filenames beginning with a "." in the filename expansion
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

if [[ "$OSTYPE" =~ ^darwin ]]; then
	[ -e $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
else
	[ -e /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi

# Add colors to the man page
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 82)
		YELLOW=$(tput setaf 226)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		YELLOW=$(tput setaf 3)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	YELLOW="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export YELLOW
export PURPLE
export WHITE
export BOLD
export RESET

# Disable virtualenvs PS1 prefix
VIRTUAL_ENV_DISABLE_PROMPT=true

function prompt_virtualenv() {
	printf "${VIRTUAL_ENV:+ as ${YELLOW}`basename ${VIRTUAL_ENV}`}"
}

is_git_repo() {
    git rev-parse --is-inside-work-tree &> /dev/null
}

get_git_branch() {
    local branch_name

    # Get the short symbolic ref
    branch_name=$(command git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
    # If HEAD isn't a symbolic ref, get the short SHA
    branch_name=$(command git rev-parse --short HEAD 2> /dev/null) ||
    # Otherwise, just give up
    branch_name="(unknown)"

    echo $branch_name
}

# Git status information
function prompt_git() {
    local git_info git_state state_color git_status uc us ut st

    if ! is_git_repo; then
        return 1
    fi

    git_info=$(get_git_branch)

    # The following checks can print a character if a condition matches.
    # By default, only a dirty branch will show a star.
    # If you want more info in your prompt, just assign a character to it below.
    # Keep in mind that the checks are not exclusive, all 4 could be true.
    #
    # Check for uncommitted changes in the index
    if ! `command git diff --quiet --ignore-submodules --cached`; then
        uc="+" # Suggestion: "+"
    fi

    # Check for unstaged changes
    if ! `command git diff-files --quiet --ignore-submodules --`; then
        us="*" # Suggestion: "*"
    fi

    # Check for untracked files
    if [ -n "$(command git ls-files --others --exclude-standard)" ]; then
        ut="" # Suggestion: "?"
    fi

    # Check for stashed files
    if `command git rev-parse --verify refs/stash &>/dev/null`; then
        st="$" # Suggestion: "$"
    fi

    # Now we combine all possible symbols to make the "state" string
    # If you followed the suggestions and all cases match it would say: "+*?$"
    git_state=$uc$us$ut$st

    # Combine the branch name and state information
    if [[ $git_state ]]; then
        git_info="$git_info$git_state"
    fi

	# Capture the output of the "git status" command.
	git_status="$(git status 2> /dev/null)"

	# Set color based on clean/staged/dirty.
	if [[ ${git_status} =~ "working directory clean" ]]; then
		state_color="${GREEN}"
	elif [[ ${git_status} =~ "Changes to be committed" ]]; then
		state_color="${YELLOW}"
	else
		state_color="${MAGENTA}"
	fi

    printf " on ${state_color}${git_info}"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$PURPLE\]\w\[$WHITE\]\$(prompt_git)\[$WHITE\]\$(prompt_virtualenv)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Local changes
[ -e ~/.bashrc.local ] && . ~/.bashrc.local
