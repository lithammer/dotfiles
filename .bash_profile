# ~/.bash_profile

# Reset PATH to keep it from being clobbered in tmux
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    source /etc/profile
fi

# Load .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Load machine specific changes
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
