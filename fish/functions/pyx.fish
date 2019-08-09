function pyx
    if test -z $argv[1]
        echo 'ERROR: You must supply a command.' >&2
        return 1
    end
    py -m $argv
end
