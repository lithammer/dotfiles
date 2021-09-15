function cdr() {
    git rev-parse --show-toplevel && cd "$(git rev-parse --show-toplevel)"
}
