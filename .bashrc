export PATH=~/.cabal/bin:$PATH                                              # Cabal (Haskell-platform)
export PATH=/usr/local/mysql/bin:$PATH                                      # MySQL
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH    # Homebrew
export PATH=/usr/local/share/aclocal:$PATH                                  # Homebrew .m4 macros
export PATH=/usr/local/lib/node_modules:$PATH                               # Node.js

export EDITOR=vim
#export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.git:.svn:.class:.beam

export HISTCONTROL=ignoredups:ignorespace

# Virtualenwrapper directory
export WORKON_HOME=$HOME/.virtualenvs

# Virtualenwrapper settings
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
	. /usr/local/bin/virtualenvwrapper.sh
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s extglob

if [ -e `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# Add colors, line-numbers, case-insensitive search and
# excludes .svn/.git dirs from search result to grep
alias grep="grep -Iin --color --exclude=*\.{svn,git}*"

alias l="ls"
alias ls="ls -GF"
alias ll="ls -lGF"
alias lsa="ls -alGF"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias untar="tar xvzf"
alias pcat="pygmentize"
alias diff="colordiff"

# Quick access to .[g]vimrc
alias vimrc="$EDITOR ~/.vimrc"
alias gvimrc="$EDITOR ~/.gvimrc"

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

# Hacking PS1
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
LightGrey="$(tput setaf 7)"
LightGreyBG="$(tput setab 7)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput setaf 1)"
RedBG="$(tput setab 1)"
LightRed="$(tput bold ; tput setaf 1)"
Green="$(tput setaf 2)"
GreenBG="$(tput setab 2)"
LightGreen="$(tput bold ; tput setaf 2)"
Brown="$(tput setaf 3)"
BrownBG="$(tput setab 3)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
BlueBG="$(tput setab 4)"
LightBlue="$(tput bold ; tput setaf 4)"
Purple="$(tput setaf 5)"
PurpleBG="$(tput setab 5)"
Pink="$(tput bold ; tput setaf 5)"
Cyan="$(tput setaf 6)"
CyanBG="$(tput setab 6)"
LightCyan="$(tput bold ; tput setaf 6)"
NoColor="$(tput sgr0)" # No Color

# Colors branch based diff
branch_color () {
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		if git diff --quiet 2>/dev/null >&2
		then
			echo -ne ${Green}
		else
			echo -ne ${Red}
		fi
	else
		return 0
	fi
}

# Git status for prompt
function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
	git branch --no-color 2> /dev/null \
	| sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
parse_svn_branch() {
	parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ") "}'
}
parse_svn_url() {
	svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
	svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

prompt_command () {
	local rts=$?
    local w=$(echo "${PWD/#$HOME/~}" | sed 's/.*\/\(.*\/.*\/.*\)$/\1/') # pwd max depth 3
	# pwd max length L, prefix shortened pwd with m
    local L=30 m='<'
    [ ${#w} -gt $L ] && { local n=$((${#w} - $L + ${#m}))
    local w="\[\033[0;32m\]${m}\[\033[0;37m\]${w:$n}\[\033[0m\]" ; } \
    ||   local w="\[\033[0;37m\]${w}\[\033[0m\]"
	# different colors for different return status
    [ $rts -eq 0 ] && \
    local p="\[\033[1;30m\]>\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\]" || \
    local p="\[\033[1;30m\]>\[\033[0;31m\]>\[\033[1;31m\]>\[\033[m\]"
	local venv="${VIRTUAL_ENV:+(\[${Yellow}\]`basename ${VIRTUAL_ENV}`\[${NoColor}\]) }"
	local git="$(__git_ps1 "[\[$(branch_color)\]%s\[${NoColor}\]] ")"
    PS1="${venv}${git}${_PS1meta2svn}${w} ${p} "
}
PROMPT_COMMAND=prompt_command

# Local changes
if [ -e ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi
