function __python_find_virtualenv
    set -l curdir $PWD

    while test "$curdir" != '/'
        for match in "$curdir"/*/pyvenv.cfg "$curdir"/.*/pyvenv.cfg
            echo (string replace '/pyvenv.cfg' '' "$match")
            return 0
        end

        set curdir (dirname "$curdir")
    end

    return 1
end
