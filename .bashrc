# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

if [[ "$OSTYPE" =~ ^darwin ]]; then
	# Put /usr/local/bin at the front, not the end
	export PATH=/usr/local/bin:$PATH
	# Homebrew installs Python distribute here, needed for easy_install/pip
	#export PATH=/usr/local/share/python:/usr/local/share/python3:$PATH
	# Cabal (Haskell-Platform)
	export PATH=$HOME/.cabal/bin:$PATH
fi

export EDITOR=vim
export LC_ALL=en_GB.UTF-8
export LANG=en_GB

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
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 256)
		YELLOW="$(tput setaf 3)"
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
		YELLOW="$(tput setaf 3)"
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	YELLOW='\e[1;33m'
	BOLD=""
	RESET="\033[m"
fi

# Disable virtualenvs PS1 prefix
VIRTUAL_ENV_DISABLE_PROMPT=true

function parse_virtualenv() {
	echo "${VIRTUAL_ENV:+`basename ${VIRTUAL_ENV}` }"
}

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h\[$WHITE\] in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\[$YELLOW\]\$(parse_virtualenv)\[$WHITE\]\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Local changes
[ -e ~/.bashrc.local ] && . ~/.bashrc.local
