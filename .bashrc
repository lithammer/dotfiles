export PATH=/opt/local/bin:/opt/local/sbin:$PATH                            # MacPorts
export PATH=~/.cabal/bin:$PATH                                              # Cabal (Haskell-platform)
export PATH=/usr/local/mysql/bin:$PATH                                      # MySQL
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH    # Homebrew
export PATH=/usr/local/share/aclocal:$PATH                                  # Homebrew .m4 macros

export EDITOR=vim
#export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.git:.svn:.class:.beam

export HISTCONTROL=ignoredups

# Add colors, line-numbers, case-insensitive search and
# excludes .svn/.git dirs from search result to grep
alias grep="grep -Iin --color --exclude=*\.{svn,git}*"

#if [ -e ~/.pythonrc.py ]; then
#	export PYTHONSTARTUP=$HOME/.pythonrc.py
#fi

alias l="ls"
alias ls="ls -GF"
alias ll="ls -lGF"
alias lsa="ls -alGF"
alias ..="cd .."
alias ...="cd .. ; cd .."
alias untar="tar xvzf"

# Quick access to .[g]vimrc
alias vimrc="$EDITOR ~/.vimrc"
alias gvimrc="$EDITOR ~/.gvimrc"

# Less Colors for Man Pages
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

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
			echo ${Green}
		else
			echo ${Red}
		fi
	else
		return 0
	fi
}

# Taken from Rasmus Andersson (rsms)
# https://github.com/rsms/workenv

# Git status for prompt
function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
	git branch --no-color 2> /dev/null \
	| sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
parse_svn_branch() {
	parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
parse_svn_url() {
	svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
	svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

source ~/.git-completion.bash
# Prompt
_PS1prefix="\[${LightGreen}\]>>> "
_PS1user="\[${LightRed}\]\u\[${NoColor}\]"
_PS1meta1="\[${BlackBG}\]\[${LightGrey}\]@\h:\[${Yellow}\]\w \[${NoColor}\]\[${DarkGrey}\] \t "
_PS1meta2git="\$(branch_color)\$(parse_git_branch)"
_PS1meta2svn="\[${LightGreen}\]\$(parse_svn_branch)"
_PS1end=" \n\[${Cyan}\]\$\[${NoColor}\] "
export PS1="${_PS1prefix}${_PS1user}${_PS1meta1}${_PS1meta2git}${_PS1meta2svn}${_PS1end}"

# Set the window title
alias _userpwd='/usr/bin/perl -e '"'"'use Cwd;my $d=cwd();my $h=$ENV{"HOME"};my $dl=length($d);my $hl=length($h);if(($dl>=$hl)&&($h==substr($d,$hl))){print "~".substr($d,$hl,$dl);}else{print $d;}'"'"
export PROMPT_COMMAND='echo -ne "\033]0;`hostname -s`:`_userpwd`\007"'

# End rsms config

# Local changes
if [ -e ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
