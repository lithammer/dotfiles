" Python {{{
let g:python_host_prog = $HOME.'/.vim/venv/bin/python'
" let g:python_host_skip_check = 1

" let g:python3_host_skip_check = 1
let g:loaded_python3_provider = 0
" }}}

silent! source ~/.vimrc

" Mappings {{{
" Terminal mappings for Neovim
tnoremap <C-a> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
" }}}

let $FZF_DEFAULT_OPTS .= ' --inline-info'

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if $NVIM_TUI_ENABLE_TRUE_COLOR
  set background=dark
  colorscheme base16-eighties

  " Make current line number more prominent (yellow)
  highlight! link CursorLineNr Todo

  " Make 'listchars' darker
  highlight clear SpecialKey
  highlight SpecialKey ctermfg=19 guifg=#444444

  " Syntastic markers
  highlight link SyntasticErrorSign DiffDelete
  highlight link SyntasticWarningSign CursorLineNr
endif
