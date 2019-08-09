function __python_find_virtualenv
    set -l curdir $PWD

    while test "$curdir" != '/'
        for script in "$curdir"/*/bin/activate.fish "$curdir"/.*/bin/activate.fish
            echo (string replace '/bin/activate.fish' '' "$script")
            return 0
        end

        set curdir (dirname "$curdir")
    end

    return 1
end
