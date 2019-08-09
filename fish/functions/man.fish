function man --description 'Display colored man pages'
    set -l blink (set_color -o red)
    set -l bold (set_color -o blue)
    set -l standout (set_color -r)
    set -l underline (set_color -u magenta)

    set -l end (printf "\e[0m")

    set -lx LESS_TERMCAP_mb $blink
    set -lx LESS_TERMCAP_md $bold
    set -lx LESS_TERMCAP_me $end
    set -lx LESS_TERMCAP_so $standout
    set -lx LESS_TERMCAP_se $end
    set -lx LESS_TERMCAP_us $underline
    set -lx LESS_TERMCAP_ue $end

    command man $argv
end
