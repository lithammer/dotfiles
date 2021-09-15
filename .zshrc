# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz add-zsh-hook

function set_title() {
    : ${2=$1}

    case "$TERM" in
        cygwin|xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
            print -Pn "\e]2;${2:q}\a" # window
            print -Pn "\e]1;${1:q}\a" # tab
            ;;
        screen*|tmux*)
            print -Pn "\ek${1:q}\e\\"
            ;;
        *)
            if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
                echoti tsl
                print -Pn "$1"
                echoti fsl
            fi
            ;;
    esac
}

function set_title_precmd() {
    set_title '%15<..<%~%<<' '%n@%m:%~'
}

function set_title_preexec() {
    set_title '$CMD' '%100>...>$LINE%<<'
}

add-zsh-hook precmd set_title_precmd
add-zsh-hook preexec set_title_preexec

fpath=($ZSH/completion $(brew --prefix)/share/zsh-completions $fpath)

autoload -Uz compinit && compinit
zmodload -i zsh/complist

zstyle ':completion:*:*:*:*:*' menu select

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

autoload -U select-word-style
select-word-style bash

bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
# bindkey '^W' backward-delete-word
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kcbt]}" reverse-menu-complete
bindkey "${terminfo[kdch1]}" delete-char

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
# bindkey '^P' up-line-or-search
# bindkey '^N' down-line-or-search

# Edit current command in $EDITOR.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls="command ls -G"
alias ls=exa
alias ll='ls -lF'
alias la='ls -lFa'

alias k=kubectl
alias kx=kubectx
alias kns=kubens

typeset -U path
path=("$HOME/.bin" $path)
path=("$HOME/.local/bin" $path)
[ -n "$GOPATH" ] && path+=("$HOME/.go/bin")
[ -n "$CARGO_HOME" ] && path+=("$CARGO_HOME/bin")
path=('/usr/local/opt/curl/bin' $path)

plugins=(zsh-zoxide zsh-syntax-highlighting zsh-autosuggestions zsh-direnv)
for plugin in $plugins; do
    source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
done

for script in "$ZSH"/functions/*.zsh; do
    source "$script"
done
