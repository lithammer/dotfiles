function tree
    command tree -C -I "node_modules|env|venv|vendor|__pycache__|*.pyc|*.egg-info" $argv
end

