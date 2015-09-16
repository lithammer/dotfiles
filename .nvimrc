" Python {{{
let g:python_host_prog = $HOME.'/.vim/env/bin/python'
" let g:python_host_skip_check = 1

" let g:python3_host_skip_check = 1
let g:loaded_python3_provider = 0
" }}}

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

silent! source ~/.vimrc

" Mappings {{{
" Terminal mappings for Neovim
tnoremap <C-a> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
" }}}

autocmd WinEnter term://* startinsert

let $FZF_DEFAULT_OPTS .= ' --inline-info'

if $NVIM_TUI_ENABLE_TRUE_COLOR
  let g:airline_theme = 'base16'
  set background=dark
  colorscheme base16-mocha

  if g:colors_name == 'base16-eighties'
    " Make current line number more prominent (yellow)
    highlight! link CursorLineNr Todo

    " Make 'listchars' darker
    highlight clear SpecialKey
    highlight SpecialKey ctermfg=19 guifg=#444444

    " Syntastic markers
    highlight link SyntasticErrorSign DiffDelete
    highlight link SyntasticWarningSign CursorLineNr
  elseif g:colors_name == 'base16-ocean'
    highlight! link CursorLineNr TabLineSel
  elseif g:colors_name == 'base16-mocha'
    highlight! link CursorLineNr TabLineSel

    " Syntastic markers
    highlight link SyntasticErrorSign DiffDelete
    highlight link SyntasticWarningSign pythonTodo
    highlight link SyntasticError Error
    highlight link SyntasticWarning Error
  endif
endif
