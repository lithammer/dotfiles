function __sk_reverse_isearch
    sk --interactive \
        --cmd-prompt='history> ' \
        --cmd-query=(commandline) \
        --cmd='history search -z -c -n 15 "{}"' \
        --color=bw,pointer:0 \
        --height=5 \
        --inline-info \
        --layout=reverse \
        --min-height=1 \
        --no-multi \
        --no-sort \
        --read0 \
        | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end
