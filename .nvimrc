" vim: set foldenable foldmethod=marker foldlevel=0:
if has('nvim')
    let g:python_interpreter = '/Users/Peter/.nvim/venv/bin/python'
    let g:ycm_path_to_python_interpreter = '/Users/Peter/.nvim/venv/bin/python'
    runtime! python_setup.vim
endif

" Source vanilla Vim settings
source $HOME/.vimrc


for dir in ['swaps', 'undos', 'backups']
    let path = expand('~/.nvim/'.dir)
    if !isdirectory(path)
        silent call mkdir(path)
    endif
endfor

set directory=$HOME/.nvim/swaps
set backupdir=$HOME/.nvim/backups
set undodir=$HOME/.nvim/undos
