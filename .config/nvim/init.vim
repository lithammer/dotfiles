" Python {{{
let g:python_host_prog = expand('~/.vim/env/bin/python')
" let g:loaded_python_provider = 0
" let g:python_host_skip_check = 1

let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python3_host_prog = expand('~/.vim/env3/bin/python')
" let g:python3_host_skip_check = 0
" let g:loaded_python3_provider = 0
" }}}

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
if empty($TMUX)
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

source ~/.vimrc

set nottimeout
set ttimeoutlen=-1

" Mappings {{{

" Terminal mappings for Neovim
tnoremap <C-b> <C-\><C-n>
" tnoremap <Esc> <C-\><C-n>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap <A-Up> <C-\><C-n><C-w><Up>
tnoremap <A-Down> <C-\><C-n><C-w><Down>
tnoremap <A-Left> <C-\><C-n><C-w><Left>
tnoremap <A-Right> <C-\><C-n><C-w><Right>


" nnoremap <A-Up> <C-w><Up>
" nnoremap <A-Down> <C-w><Down>
" nnoremap <A-Left> <C-w><Left>
" nnoremap <A-Right> <C-w><Right>
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l
" }}}

" Always enter insert mode when focusing a terminal buffer
autocmd WinEnter term://* startinsert

let $FZF_DEFAULT_OPTS .= ' --inline-info'

if $NVIM_TUI_ENABLE_TRUE_COLOR
  let g:airline_theme = 'base16'
  set background=dark
  " colorscheme base16-eighties

  if g:colors_name == 'base16-eighties'
    " Make current line number more prominent (yellow)
    highlight! link CursorLineNr Todo

    " Make 'listchars' darker
    highlight clear SpecialKey
    highlight SpecialKey ctermfg=19 guifg=#444444

    " Syntastic markers
    highlight link SyntasticErrorSign DiffDelete
    highlight link SyntasticWarningSign CursorLineNr

    " Terminal color definitions (24-bit)
    let g:terminal_color_0 = '#2D2D2D'
    let g:terminal_color_1 = '#F2777A'
    let g:terminal_color_2 = '#99CC99'
    let g:terminal_color_3 = '#FFCC66'
    let g:terminal_color_4 = '#6699CC'
    let g:terminal_color_5 = '#CC99CC'
    let g:terminal_color_6 = '#66CCCC'
    let g:terminal_color_7 = '#D3D0C8'
    let g:terminal_color_8 = '#747369'
    let g:terminal_color_9 = '#F2777A'
    let g:terminal_color_10 = '#99CC99'
    let g:terminal_color_11 = '#FFCC66'
    let g:terminal_color_12 = '#6699CC'
    let g:terminal_color_13 = '#CC99CC'
    let g:terminal_color_14 = '#66CCCC'
    let g:terminal_color_15 = '#F2F0EC'
    let g:terminal_color_background = '#2D2D2D'
    let g:terminal_color_foreground = '#D3D0C8'
  elseif g:colors_name == 'base16-ocean'
    highlight! link CursorLineNr TabLineSel
  elseif g:colors_name == 'base16-mocha'
    highlight! link CursorLineNr TabLineSel

    " Make 'listchars' darker
    highlight! SpecialKey ctermfg=8 guifg=#5F5544

    " Syntastic markers
    highlight link SyntasticErrorSign DiffDelete
    highlight link SyntasticWarningSign pythonTodo
    highlight link SyntasticError Error
    highlight link SyntasticWarning Error

    " Terminal color definitions (24-bit)
    let g:terminal_color_0 = '#3B3228'
    let g:terminal_color_1 = '#CB6077'
    let g:terminal_color_2 = '#BEB55B'
    let g:terminal_color_3 = '#F4BC87'
    let g:terminal_color_4 = '#8AB3B5'
    let g:terminal_color_5 = '#A89BB9'
    let g:terminal_color_6 = '#7BBDA4'
    let g:terminal_color_7 = '#D0C8C6'
    let g:terminal_color_8 = '#7E705A'
    let g:terminal_color_9 = '#CB6077'
    let g:terminal_color_10 = '#BEB55B'
    let g:terminal_color_11 = '#F4BC87'
    let g:terminal_color_12 = '#8AB3B5'
    let g:terminal_color_13 = '#A89BB9'
    let g:terminal_color_14 = '#7BBDA4'
    let g:terminal_color_15 = '#F5EEEB'
    let g:terminal_color_background = '#3B3228'
    let g:terminal_color_foreground = '#D0C8C6'
  elseif g:colors_name == 'gruvbox'
    " Terminal color definitions (24-bit)
    let g:terminal_color_0 = '#282828'
    let g:terminal_color_1 = '#CC241D'
    let g:terminal_color_2 = '#98971a'
    let g:terminal_color_3 = '#d79921'
    let g:terminal_color_4 = '#458588'
    let g:terminal_color_5 = '#b16286'
    let g:terminal_color_6 = '#689d6a'
    let g:terminal_color_7 = '#a89984'
    let g:terminal_color_8 = '#928374'
    let g:terminal_color_9 = '#fb4934'
    let g:terminal_color_10 = '#b8bb26'
    let g:terminal_color_11 = '#fabd2f'
    let g:terminal_color_12 = '#83a598'
    let g:terminal_color_13 = '#d3869b'
    let g:terminal_color_14 = '#8ec07c'
    let g:terminal_color_15 = '#ebdbb2'
    " let g:terminal_color_background = ''
    " let g:terminal_color_foreground = ''
  else
    let g:terminal_color_0 = '#2D2D2D'
    let g:terminal_color_1 = '#F2777A'
    let g:terminal_color_2 = '#99CC99'
    let g:terminal_color_3 = '#FFCC66'
    let g:terminal_color_4 = '#6699CC'
    let g:terminal_color_5 = '#CC99CC'
    let g:terminal_color_6 = '#66CCCC'
    let g:terminal_color_7 = '#D3D0C8'
    let g:terminal_color_8 = '#747369'
    let g:terminal_color_9 = '#F2777A'
    let g:terminal_color_10 = '#99CC99'
    let g:terminal_color_11 = '#FFCC66'
    let g:terminal_color_12 = '#6699CC'
    let g:terminal_color_13 = '#CC99CC'
    let g:terminal_color_14 = '#66CCCC'
    let g:terminal_color_15 = '#F2F0EC'
    let g:terminal_color_background = '#2D2D2D'
    let g:terminal_color_foreground = '#D3D0C8'
  endif
endif
