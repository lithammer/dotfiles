function k -w kubectl
    set -l current_context (kubectl config current-context)
    set -l color brwhite
    switch $current_context
        case '*/ci-*'
            set color bryellow
        case '*/orc-dev-*'
            set color brgreen
        case '*/staging-*' '*/sumo-*'
            set color brred
    end
    echo (set_color $color)context=$current_context(set_color normal) >&2

    kubectl $argv
end

