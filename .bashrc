# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

if [[ "$OSTYPE" =~ ^darwin ]]; then
	# Put /usr/local/bin at the front, not the end
	export PATH=/usr/local/bin:$PATH
	# Homebrew installs Python distribute here, needed for easy_install/pip
	export PATH=$PATH:/usr/local/share/python:/usr/local/share/python3
	# Cabal (Haskell-Platform)
	export PATH=$HOME/.cabal/bin:$PATH
fi

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.git:.svn:.class:.beam

export HISTCONTROL=ignoredups:ignorespace

# Virtualenwrapper directory
export WORKON_HOME=$HOME/.virtualenvs

# Virtualenwrapper settings
if [[ "$OSTYPE" =~ ^darwin ]]; then
	[ -e /usr/local/bin/virtualenvwrapper.sh ] && . /usr/local/bin/virtualenvwrapper.sh
else
	[ -e /usr/bin/virtualenvwrapper.sh ] && . /usr/bin/virtualenvwrapper.sh
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Extended pattern matching
shopt -s extglob

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

if [[ "$OSTYPE" =~ ^darwin ]]; then
	[ -e `brew --prefix`/etc/bash_completion ] && . `brew --prefix`/etc/bash_completion
else
	[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
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

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 82)
		YELLOW=$(tput setaf 226)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 256)
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

function parse_virtualenv() {
	echo "${VIRTUAL_ENV:+`basename ${VIRTUAL_ENV}` }"
}

# Detect whether the current directory is a git repository.
function is_git_repository {
	git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function get_git_branch_name() {
	# Capture the output of the "git status" command.
	git_status="$(git status 2> /dev/null)"

	# Set color based on clean/staged/dirty.
	if [[ ${git_status} =~ "working directory clean" ]]; then
		local_state="${GREEN}"
	elif [[ ${git_status} =~ "Changes to be committed" ]]; then
		local_state="${YELLOW}"
	else
		local_state="${MAGENTA}"
	fi

	# Set arrow icon based on status against remote.
	remote_pattern="# Your branch is (.*) of"
	if [[ ${git_status} =~ ${remote_pattern} ]]; then
		if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
			remote_state="[↑]"
		else
			remote_state="[↓]"
		fi
	else
		remote_state=""
	fi
	diverge_pattern="# Your branch and (.*) have diverged"
	if [[ ${git_status} =~ ${diverge_pattern} ]]; then
		remote_state="[↕]"
	fi

	# Get the name of the branch.
	branch_pattern="^# On branch ([^${IFS}]*)"
	if [[ ${git_status} =~ ${branch_pattern} ]]; then
		branch_name=${BASH_REMATCH[1]}
	fi

	# Set the final branch string.
	echo "${WHITE} on ${local_state}${branch_name}${remote_state} "
}

function get_branch_name() {
	if is_git_repository ; then
		echo $(get_git_branch_name)
	fi
	echo ""
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\H\[$WHITE\] in \[$PURPLE\]\w\$(get_branch_name)\n\[$YELLOW\]\$(parse_virtualenv)\[$WHITE\]\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Local changes
[ -e ~/.bashrc.local ] && . ~/.bashrc.local
