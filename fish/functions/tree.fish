function tree
    command tree -C -I "node_modules|env|vendor|__pycache__|*.pyc|*.egg-info" $argv
end

