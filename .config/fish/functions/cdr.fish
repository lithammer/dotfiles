function cdr -d 'Change directory to Git repository root'
    git rev-parse --show-toplevel; and cd (git rev-parse --show-toplevel)
end

