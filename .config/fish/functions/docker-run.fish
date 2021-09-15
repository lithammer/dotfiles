function docker-run -w docker -d 'Run command in Edgeware Docker container'
    eval (git rev-parse --show-toplevel)/docker.sh $argv
end
