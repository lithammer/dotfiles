" vim: set foldenable foldmethod=marker foldlevel=0:
" if 'ImportError' !~ system('python -c "import neovim"')
"     let g:python_host_prog = $HOME.'/.vim/venv/bin/python'
" endif
let g:python_host_prog = $HOME.'/.vim/venv/bin/python'
let g:ycm_path_to_python_interpreter = $HOME.'/.vim/venv/bin/python'
let g:pyenv#python_exec = $HOME.'/.vim/venv/bin/python'

" Source vanilla Vim settings
source $HOME/.vimrc

" Make current line number yellow
if g:colors_name =~ 'base16-'
  " Make current line number more prominent (yellow)
  hi clear CursorLineNr
  hi CursorLineNr term=bold ctermfg=8 ctermbg=10 gui=bold guifg=#F0C674 guibg=#393939

  " Make 'listchars' darker
  hi clear SpecialKey
  hi SpecialKey ctermfg=19 guifg=#444444
endif

if $NVIM_TUI_ENABLE_TRUE_COLOR == 1
  " autocmd VimEnter * colorscheme hybrid
endif
