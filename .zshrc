# Terminal {{{1
if [[ "$TERM" == 'dumb' ]]; then
    return
fi

# Set the GNU Screen window number.
if [[ -n "$WINDOW" ]]; then
  export SCREEN_NO="%B${WINDOW}%b "
else
  export SCREEN_NO=""
fi

# Sets the GNU Screen title.
function set-screen-title() {
  if [[ "$TERM" == screen* ]]; then
    printf "\ek%s\e\\" ${(V)argv}
  fi
}

# Sets the terminal window title.
function set-window-title() {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*) ]]; then
    printf "\e]2;%s\a" ${(V)argv}
  fi
}
# Sets the terminal tab title.
function set-tab-title() {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*) ]]; then
    printf "\e]1;%s\a" ${(V)argv}
  fi
}
# Sets the tab and window titles with the command name.
function set-title-by-command() {
  emulate -L zsh
  setopt LOCAL_OPTIONS EXTENDED_GLOB
  # Get the command name that is under job control.
  if [[ "${1[(w)1]}" == (fg|%*)(\;|) ]]; then
    # Get the job name, and, if missing, set it to the default %+.
    local job_name="${${1[(wr)%*(\;|)]}:-%+}"
    # Make a local copy for use in the subshell.
    local -A jobtexts_from_parent_shell
    jobtexts_from_parent_shell=(${(kv)jobtexts})
    jobs $job_name 2>/dev/null > >(
      read index discarded
      # The index is already surrounded by brackets: [1].
      set-title-by-command "${(e):-\$jobtexts_from_parent_shell$index}"
    )
  else
    # Set the command name, or in the case of sudo or ssh, the next command.
    local cmd=${1[(wr)^(*=*|sudo|ssh|-*)]}
    # Right-truncate the command name to 15 characters.
    if (( $#cmd > 15 )); then
      cmd="${cmd[1,15]}..."
    fi

    for kind in window tab screen; do
      set-${kind}-title "$cmd"
    done
  fi
}

# Don't override precmd/preexec; append to hook array.
autoload -Uz add-zsh-hook

# Sets the tab and window titles before the prompt is displayed.
function set-title-precmd() {
  if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]] && zstyle -t ':omz:terminal' auto-title; then
    set-window-title "${(%):-%~}"
    for kind in tab screen; do
      # Left-truncate the current working directory to 15 characters.
      set-${kind}-title "${(%):-%15<...<%~%<<}"
    done
  else
    # Set Apple Terminal current working directory.
    printf '\e]7;%s\a' "file://$HOST${PWD// /%20}"
  fi
}
add-zsh-hook precmd set-title-precmd

# Sets the tab and window titles before command execution.
function set-title-preexec() {
  if zstyle -t ':omz:terminal' auto-title; then
    set-title-by-command "$2"
  fi
}
add-zsh-hook preexec set-title-preexec
# Misc {{{1
# autoload -Uz add-zsh-hook
autoload -U run-help
autoload run-help-git  # Enable `git help <command>`

autoload colors
colors

man() {
    env \
        LESS_TERMCAP_mb="$fg[cyan]" \
        LESS_TERMCAP_md="$fg_bold[red]" \
        LESS_TERMCAP_me="$reset_color" \
        LESS_TERMCAP_se="$reset_color" \
        LESS_TERMCAP_so="$fg[black]$bg[yellow]" \
        LESS_TERMCAP_ue="$reset_color" \
        LESS_TERMCAP_us="$fg_bold[yellow]" \
            man "$@"
}
# Options {{{1

# man 1 zshoptions

# Changing Directories.
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion.
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH
setopt COMPLETE_IN_WORD

# Expansion and Globbing.
setopt EXTENDED_GLOB

# History.
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Input/Output.
setopt PATH_DIRS
setopt INTERACTIVE_COMMENTS

# Prompting.
setopt PROMPT_SUBST

# Scripts and Functions.
setopt MULTIOS

# Zle.
setopt COMBINING_CHARS
# Completion {{{1
fpath=($ZSH/completion /usr/local/share/zsh-completions $fpath)

# List of suffixes of files to be ignored during filename completion.
fignore=(.pyc .o)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit

zmodload -i zsh/complist

zstyle ':completion:*:*:*:*:*' menu select

# Case insensitive (all), partial-word and substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors 'di=34'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Disable named-directories autocompletion.
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Use caching so that commands like apt and dpkg complete are useable.
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "$ZSH/cache"

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'

# ...unless we really want to.
zstyle '*' single-ignored show
# Prompt {{{1
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}M%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}M%f'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%F{yellow}|%F{red}%a%f]'
zstyle ':vcs_info:*' formats '%F{blue}%b%m %c%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind

function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
        if [[ -n $(git ls-files --others --exclude-standard) ]]; then
            hook_com[unstaged]+='%F{red}??%f'
        fi
    fi
}

function +vi-git-aheadbehind() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "%F{green}↑${ahead}%f" )

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
    (( $behind )) && gitstatus+=( "%F{red}↓${behind}%f" )

    hook_com[misc]+=${(j::)gitstatus}
}

__prompt() {
    psvar[12]=
    # Show name currently active virtualenv
    if [[ -n $VIRTUAL_ENV ]]; then
        # Use parent folder if the path end with "/env".
        if [[ $VIRTUAL_ENV == */env ]]; then
            psvar[12]=${$(dirname $VIRTUAL_ENV):t}
        else
            psvar[12]=${${VIRTUAL_ENV}:t}
        fi
    fi
    # [[ -n $VIRTUAL_ENV ]] && psvar[12]="${VIRTUAL_ENV:t}"
}
add-zsh-hook precmd __prompt

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# man 1 zshmisc
PROMPT="%(?..%F{9}%?%f )"          # Exit code.
PROMPT+="%(12V.%F{cyan}%12v%f .)"  # Python virtual environment.
PROMPT+="%F{8}%2~%f "              # Current working directory.
PROMPT+="%F{yellow}❯%f "           # Prompt symbol.

RPROMPT='$vcs_info_msg_0_'
# Key bindings {{{1

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use emacs bindings.
bindkey -e

# C-r to search in history.
bindkey '^r' history-incremental-search-backward

# C-right: Move forward one word.
bindkey '^[[1;5C' forward-word

# C-left: Move backward one word.
bindkey '^[[1;5D' backward-word

# Home: Go to beginning of line.
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi

# End: Go to end of line.
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line
fi

# S-Tab: Move through the completion menu backwards.
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

# Delete: Delete forward.
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Up: Use the line prefix up to the cursor position for searching backwards in
# the history.
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey '^[[A' up-line-or-beginning-search
fi

# Down: Use the line prefix up to the cursor position for searching forwards in
# the history.
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey '^[[B' down-line-or-beginning-search
fi

# Edit the current command line in $EDITOR.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
# Aliases {{{1
# Basic directory operations
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List direcory contents
alias ls="command ls -G"
alias l='ls -lF'
alias ll='ls -lF'
alias la='ls -lFa'

alias tree='tree -C -I "node_modules|env|vendor|__pycache__|*.pyc"'

# History timestamps as "yyyy-mm-dd"
alias history='fc -il 1'

alias grep='grep --color=auto'

# Use Neovim if available
if command -v nvim > /dev/null; then
    alias vim='nvim'
    alias nv='nvim'
fi
# Functions {{{1

activate-virtualenv() {
    local curdir="$PWD"
    while [ "$curdir" != "$HOME" ]; do
        if [ $(find "$curdir" -type d -maxdepth 1 -name env) ]; then
            break
        fi
        curdir=$(dirname "$curdir")
    done

    if [ -f "$curdir/env/bin/activate" ]; then
        . "$curdir/env/bin/activate"
    else
        echo No virtualenv found
        return 1
    fi
}
# Path {{{1
typeset -U path

path=('/usr/local/sbin' $path)
path=("$HOME/.bin" $path)
path+=("$HOME/.go/bin")
path+=("$CARGO_HOME/bin")
path+=("$HOME/.luarocks/bin")
path=('/usr/local/opt/curl/bin' $path)
# Local config {{{1
if [ -f ~/.zshrc.local ]; then
    . ~/.zshrc.local
fi
# Plugins {{{1
# Enable after source local configuration, because that's where you're supposed
# to put the list of plugins. Example:
# plugins=(golang gulp npm pyenv)
for plugin in $plugins; do
    . "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
done

# vim: foldmethod=marker:
