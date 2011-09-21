export PATH=/opt/local/bin:/opt/local/sbin:$PATH                            # MacPorts
export PATH=~/.cabal/bin:$PATH                                              # Cabal (Haskell-platform)
export PATH=/usr/local/mysql/bin:$PATH                                      # MySQL
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH    # Homebrew
export PATH=/usr/local/share/aclocal:$PATH                                  # Homebrew .m4 macros

export EDITOR=vim
#export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Files to ignore when auto-completing
export FIGNORE=.pyc:.o:.git:.svn

export HISTCONTROL=ignoredups

# Add colors, line-numbers, case-insensitive search and
# excludes .svn/.git dirs from search result to grep
alias grep="-Iin --color --exclude=*\.{svn,git}*"

if [ -e ~/.pythonrc.py ]; then
	export PYTHONSTARTUP=$HOME/.pythonrc.py
fi

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

# Hacking PS1
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_yellow=`tput setaf 3`
c_blue=`tput setaf 4`
c_purple=`tput setaf 5`
c_cyan=`tput setaf 6`
c_sgr0=`tput sgr0`

# This function determines currect git branch if git-completion.bash isn't available
parse_git_branch () {
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	else
		return 0
	fi
	printf "${1:-(%s)}" "${gitver}"
}

# Colors branch based diff
branch_color () {
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		color=""
		if git diff --quiet 2>/dev/null >&2
		then
			color="${c_green}"
		else
			color="${c_red}"
		fi
	else
		return 0
	fi
	echo -ne $color
}

# Without using .git-completion.bash
if [ -e ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
	export PS1='$(__git_ps1 "[\[$(branch_color)\]%s\[${c_sgr0}\]] ")\u@\h: \[${c_yellow}\]\w\[${c_sgr0}\] $ '
else
	export PS1='$(parse_git_branch "[\[$(branch_color)\]%s\[${c_sgr0}\]] ")\u@\h: \[${c_yellow}\]\w\[${c_sgr0}\] $ '
fi
#export PS1="\u@\[\e[00;33m\]\h\[\e[00m\]:\w $ "

# Local changes
if [ -e ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
