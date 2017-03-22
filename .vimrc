" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('nvim')
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
else
  " http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
  " This flickers to much on backspace.
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set guioptions+=M  " avoid menu.vim (saves ~100ms)
let g:loaded_2html_plugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
" }}}
" Plugins {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin()
" Use a different mapleader (default is '\')
let mapleader = ','
" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'
" AndrewRadev/splitjoin.vim {{{2
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1
" ConradIrwin/vim-bracketed-paste {{{2
if !has('nvim')
  " This functionality is built into Neovim
  Plug 'ConradIrwin/vim-bracketed-paste'
end
" Quramy/tsuquyomi {{{2
Plug 'Quramy/tsuquyomi' | Plug 'Shougo/vimproc.vim', {'do' : 'make'}
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
" Raimondi/delimitMate {{{2
Plug 'Raimondi/delimitMate'
" Plug 'cohama/lexima.vim'
let delimitMate_expand_cr = 1
" Valloric/YouCompleteMe {{{2
if has('python') || has('python3')
  Plug 'Valloric/YouCompleteMe'

  let g:ycm_python_binary_path = 'python'
  " if has('nvim')
  "   let g:ycm_server_python_interpreter = g:python_host_prog
  " endif
  let g:ycm_rust_src_path = expand('~/src/github.com/rust-lang/rust/src')
  let g:ycm_goto_buffer_command = 'horizontal-split'
  nnoremap <leader>jd :YcmCompleter GoTo<CR>

  " Plug 'lifepillar/vim-mucomplete'
  " Plug 'davidhalter/jedi-vim', {'for': 'python'}
  " Plug 'racer-rust/vim-racer', {'for': 'rust'}

  " set shortmess+=c
  " let g:mucomplete#enable_auto_at_startup = 0
  " let g:peekaboo_ins_prefix = '<c-x>'
  " let g:jedi#auto_vim_configuration = 0
  " let g:jedi#force_py_version = 'auto'
  " let g:jedi#popup_on_dot = 1
  " let g:jedi#use_splits_not_buffers = 'winwidth'
  " let g:racer_cmd = expand('~/.cargo/bin/racer')
  " let g:racer_experimental_completer = 1
end
" Vimjas/vim-python-pep8-indent {{{2
Plug 'Vimjas/vim-python-pep8-indent'
" airblade/vim-gitgutter {{{2
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
" christoomey/vim-tmux-navigator {{{2
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

if !empty($TMUX)
  nnoremap <silent> <A-Left> :TmuxNavigateLeft<CR>
  nnoremap <silent> <A-Down> :TmuxNavigateDown<CR>
  nnoremap <silent> <A-Up> :TmuxNavigateUp<CR>
  nnoremap <silent> <A-Right> :TmuxNavigateRight<CR>
endif
" fatih/vim-go {{{2
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_fmt_command = 'goimports'
" fs111/pydoc.vim {{{2
Plug 'fs111/pydoc.vim'
let g:pydoc_highlight = 0
" hdima/python-syntax {{{2
Plug 'hdima/python-syntax'
" junegunn/fzf {{{2
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <C-p> :FzfFiles<CR>
" nnoremap <silent> <C-t> :FzfTags<CR>
" nnoremap <silent> <C-g> :FzfBTags<CR>
nnoremap <silent> <C-b> :FzfBuffers<CR>
" junegunn/vim-peekaboo {{{2
Plug 'junegunn/vim-peekaboo'
" junegunn/rainbow_parentheses.vim {{{2
Plug 'junegunn/rainbow_parentheses.vim'
" junegunn/vim-easy-align {{{2
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
vmap <Enter> <Plug>(EasyAlign)
" justinmk/vim-sneak {{{2
Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
" let g:sneak#s_next = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
autocmd ColorScheme * highlight link Sneak Search
" kshenoy/vim-signature {{{2
Plug 'kshenoy/vim-signature'
" ludovicchabant/vim-gutentags {{{2
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = expand('~/.vim/tags')
let g:gutentags_ctags_exclude = [
  \ '*.min.js',
  \ '*/vendor/*',
  \ '*/node_modules/*',
  \ '*/env/*',
  \ '*/venv/*',
  \ '*/third_party/*',
  \ '*/lib/*',
  \ '*/lib64/*'
  \ ]
" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>
" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
let g:grepper = {'tools': ['ag', 'git', 'rg'], 'highlight': 1}
" let g:grepper.simple_prompt = 1
command! -nargs=+ -complete=file Grep Grepper -noprompt -tool rg -query <args>
command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>
command! -nargs=+ -complete=file Ag Grepper -noprompt -tool ag -query <args>
" osyo-manga/vim-brightest {{{2
Plug 'osyo-manga/vim-brightest', {'on': 'BrightestEnable'}
let g:brightest#highlight = {'group': 'BrightestReverse'}
let g:brightest#enable_filetypes = {
\  '_': 0,
\  'python': 1,
\  'go': 1,
\  'javascript': 1,
\}
" rust-lang/rust.vim {{{2
Plug 'rust-lang/rust.vim', {'for': 'rust'}
let g:rustfmt_autosave = 1
" sheerun/vim-polyglot {{{2
Plug 'sheerun/vim-polyglot'
" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'
map <Leader>c :Commentary<CR>
" tpope/vim-eunuch {{{2
Plug 'tpope/vim-eunuch'
" tpope/vim-fugitive {{{2
Plug 'tpope/vim-fugitive'
" tpope/vim-repeat {{{2
Plug 'tpope/vim-repeat'
" tpope/vim-sleuth {{{2
Plug 'tpope/vim-sleuth'
" tpope/vim-surround {{{2
Plug 'tpope/vim-surround'
" tpope/vim-tbone {{{2
Plug 'tpope/vim-tbone'
" tpope/vim-vinegar {{{2
Plug 'tpope/vim-vinegar'
" vim-airline/vim-airline {{{2
" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#branch#enabled = 0
" let g:airline_extensions = ['syntastic', 'whitespace', 'netrw', 'quickfix']
" set noshowmode
" vim-syntastic/syntastic {{{2
" Plug 'vim-syntastic/syntastic'
if has('nvim') || (has('job') && has('timers') && has('channel'))
  Plug 'w0rp/ale'
endif
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'python': ['flake8'], 'cpp': [], 'c': []}
let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_sign_error = "\u2716"
" let g:ale_sign_warning = "\u267A"
let g:ale_sign_error = 'E>'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format = ["\u2716 %d", "\u267A %d", '']
let g:ale_warn_about_trailing_whitespace = 0

" Alternatives https://github.com/w0rp/ale https://github.com/maralla/validator.vim

let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = g:ale_sign_error
let g:syntastic_warning_symbol = '--'
" let g:syntastic_error_symbol = "\u2716"
" let g:syntastic_warning_symbol = "\u267A"
" let g:syntastic_warning_symbol = "\u25CF"
" let g:syntastic_style_error_symbol = g:syntastic_error_symbol
" let g:syntastic_style_warning_symbol = g:syntastic_warning_symbol
" let g:syntastic_style_warning_symbol = "\u25CF"

" https://github.com/scrooloose/syntastic/commit/f280ff22207ffcddaabc8557d32ceaae03aa3975
" https://github.com/scrooloose/syntastic/issues/1759
" https://github.com/fatih/vim-go#using-with-syntastic
let g:syntastic_go_checkers = ['go', 'govet', 'golint']
let g:go_list_type = 'quickfix'

let g:syntastic_c_checkers = ['gcc', 'make', 'splint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_lua_checkers = ['luac']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_scss_checkers = ['sassc', 'stylelint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
Plug 'mbbill/vim-seattle'
Plug 'nanotech/jellybeans.vim'
" Plug 'w0ng/vim-hybrid'
Plug 'renstrom/vim-hybrid'
" }}}
call plug#end()
" }}}
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Stop the sh syntax file from highlighting $(...) as errors.
" See :h ft-sh-syntax.
let g:is_posix = 1

" Tree style file listing.
let g:netrw_liststyle = 3

" <C-^> should go to the last file, not to netrw.
let g:netrw_altfile = 1

" Hide patterns specified in .gitignore. Press "a" to cycle through the hiding modes.
" :h netrw-hiding
if has('patch-7.4.156')
  let g:netrw_list_hide = netrw_gitignore#Hide()
endif

" Highlight numbers, buitin functions, standard exceptions, doctests and
" whitespace errors (:h ft-python-syntax).
let python_highlight_all = 1

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses (:h ft-lisp-syntax).
let g:lisp_rainbow = 1

" Make sure dark background is used for colorschemes.
set background=dark

if has('termguicolors') " 7.4.1799
  if !empty($TMUX)
    " :h xterm-true-color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
  let g:jellybeans_overrides = {
    \  'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none' },
    \  'SpecialKey': { 'ctermfg': '238', 'ctermbg': 'none', 'guifg': '444444', 'guibg': 'none' },
    \}
  if !has('nvim')
    " https://github.com/vim/vim/issues/981
    let g:jellybeans_overrides.background.guibg = '2d2d2d'
  endif
  colorscheme jellybeans
  highlight link ALEWarningSign Type
  highlight link YcmWarningSign ALEWarningSign
else
  colorscheme hybrid
endif

" Don't try to highlight lines longer than 400 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more).
set autowrite

" When formatting text, recognize numbered lists. This actually uses
" the 'formatlistpat' option, thus any kind of list can be used. The
" indent of the text after the number is used for the next line. The
" default is to find a number, optionally followed by '.', ':', ')',
" ']' or '}'.  Note that 'autoindent' must be set too.
set formatoptions+=n

" Don't break a line after a one-letter word. It's broken before it
" instead (if possible).
set formatoptions+=1

" Where it makes sense, remove a comment leader when joining lines.
if has('patch-7.3.541')
  set formatoptions+=j
endif

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab shiftround

" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set shiftround

" menuone  Use the popup menu also when there is only one match.
"          Useful when there is additional information about the
"          match, e.g., what file it comes from.
"
" preview  Show extra information about the currently selected
"          completion in the preview window.
" set completeopt=menuone,preview
set completeopt=menuone,preview,noselect

" Remove fold characters.
set fillchars-=fold:-

" Set a nicer foldtext function.
" set foldtext=NumLinesEndOfLine()
function! NumLinesEndOfLine()
  let maxwidth = 80
  let lines = (v:foldend - v:foldstart + 1)
  let linetext = strpart(getline(v:foldstart), 0, -3 + maxwidth - len(lines))
  return linetext . repeat(' ', maxwidth - len(linetext) - len(lines)) . lines
endfunction

" Include line numbers in grep format.
set grepformat^=%f:%l:%c:%m

if executable('rg')
  let &grepprg = 'rg --vimgrep'
elseif executable('ag')
  let &grepprg = 'ag --vimgrep'
else
  let &grepprg = 'grep -I --recursive --line-number $* *'
endif
" command! -bang -nargs=* -complete=file -bar Grep silent! grep! <args>
" autocmd QuickFixCmdPost *grep* cwindow

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Ignore case in search patterns, unless they contain upper case characters.
set ignorecase smartcase

" nosplit  Shows the effects of a command incrementally, as you type.
" split    Also shows partial off-screen results in a preview window.
if exists('&inccommand')
  set inccommand=split
endif

" Enable list mode. See 'listhars'.
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:+

" If on, Vim will wrap long lines at a character in 'breakat' rather
" than at the last character that fits on the screen. Unlike
" 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
" it only affects the way the file is displayed, not its contents.
if has('linebreak')
  set linebreak
endif

if exists('+breakindent')
  " Every wrapped line will continue visually indented (same amount of
  " space as the beginning of that line), thus preserving horizontal blocks
  " of text.
  set breakindent
  " After applying 'breakindent', the wrapped line's beginning will be shifted
  " by the given number of characters. It permits dynamic French paragraph
  " indentation (negative) or emphasizing the line continuation (positive).
  set breakindentopt=shift:2
  let &showbreak = "\u21AA "
endif

" Show line numbers.
set number

" Use current line as starting point for line numbering.
" if exists('+relativenumber')
"   set relativenumber
" endif

" Always report number of lines changes.
set report=0

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" The minimal number of columns to scroll horizontally.
set sidescroll=1

" Set the title of the window to 'titlestring'.
set title

" Splitting a window will put the new window right of the current one.
set splitright

set directory=~/.vim/swaps
if !isdirectory(&directory)
  call mkdir(&directory)
endif

set backupdir=~/.vim/backups
if !isdirectory(&backupdir)
  call mkdir(&backupdir)
endif

if has('persistent_undo')
  set undodir=~/.vim/undos
  set undofile
  if !isdirectory(&undodir)
    call mkdir(&undodir)
  endif
endif

" Allow cursor beyond EOL in Visual block mode.
set virtualedit=block

" Case-insensitive completion for file names and directories.
if exists('+wildignorecase')
  set wildignorecase
end

" When more than one match, list all matches.
set wildmode=list:longest,list:full

" A list of patterns to ignore when expanding wildcards, completing file or
" directory names, and influences the result of expand(), glob() and
" globpath().
set wildignore+=*.pyc,*.o

" Mappings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" My fingers are too fast!
command W w
command Q q

" Repeat the last recorded macro.
nnoremap Q @@

" Copy to clipboard.
vnoremap <C-c> "*y"

" Toggle fold under cursor.
noremap <Space> za

" Don't move on '*', useful when highlighting words.
nnoremap * *<C-o>

function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  catch /^Vim\%((\a\+)\)\=:E776/
    execute "normal \<Esc>"
  endtry
endfunction

function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  catch /^Vim\%((\a\+)\)\=:E776/
    execute "normal \<Esc>"
  catch /^Vim\%((\a\+)\)\=:E42/
    execute "normal \<Esc>"
  endtry
endfunction

" nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
" nnoremap <silent> <Plug>LocationNext :<C-u>exe 'call <SID>LocationNext()'<CR>
" nmap <silent> ö <Plug>LocationPrevious
" nmap <silent> ä <Plug>LocationNext
nmap <silent> ö :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nmap <silent> ä :<C-u>exe 'call <SID>LocationNext()'<CR>

nmap Ö :cprevious<CR>
nmap Ä :cnext<CR>

" Statusline {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
augroup statusline_whitespace
  autocmd!
  autocmd CursorHold,BufWritePost * unlet! b:statusline_whitespace_check
augroup END

function! StatuslineWhitespace()
  if &readonly || !&modifiable || line('$') > 20000
    return ''
  endif

  if !exists('b:statusline_whitespace_check')
    let b:statusline_whitespace_check = ''

    let trailing = search('\s$', 'nw')
    let mixed = search('\v(^\t+ +)|(^ +\t+)', 'nw')

    if trailing != 0 || mixed != 0
      let b:statusline_whitespace_check = '!'
      if trailing != 0
        let b:statusline_whitespace_check .= (' ').printf('trailing[%s]', trailing)
      endif
      if mixed != 0
        let b:statusline_whitespace_check .= (' ').printf('mixed-indent[%s]', mixed)
      endif
    endif
  endif
  return b:statusline_whitespace_check
endfunction

function! CustomALEStatusLine()
  let ale_status_line = ale#statusline#Status()
  if empty(ale_status_line)
    return ''
  endif
  return ' '.ale_status_line.' '
endfunction

let &statusline = '%< %f[%n] %h%m%r%=%-14.(%l,%c%V%) %P '
set statusline+=%#Error#%{CustomALEStatusLine()}%*
set statusline+=%#Error#%{StatuslineWhitespace()}%*
" Auto commands {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sets the filetype when using Ctrl-X-E in bash
autocmd BufRead,BufNewFile bash-* set filetype=sh

" Press K to get documentation about a Vim keyword
autocmd FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" When editing a file, always jump to the last known cursor position.
augroup lastposition
  autocmd!
  autocmd BufReadPost *
    \ if &filetype !~ 'svn\|commit\c' |
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \   endif |
    \ endif
augroup END

" Always close preview window after completion is done.
if has('patch-7.3.598')
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
endif

augroup rainbow_colors
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
" Filetype settings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plain text
function! SetupPlainText()
  setlocal wrap
  setlocal wrapmargin=2
  setlocal textwidth=79
endfunction
autocmd FileType text call SetupPlainText()

" Python, PEP8: http://www.python.org/dev/peps/pep-0008/
function! SetupPython()
  setlocal textwidth=79
  setlocal foldmethod=indent
  setlocal foldlevel=2
  setlocal foldnestmax=2

  " Highlight 'NOTE' and 'HACK' in comments.
  syn keyword pythonTodo NOTE HACK contained
endfunction
autocmd FileType python call SetupPython()

function! <SID>PyFormat() range
  if !executable('yapf')
    echoerr "No yapf binary not found in $PATH. Please install it first."
    return
  endif
  " Determine range to format.
  let l:line_ranges = a:firstline . '-' . a:lastline
  let l:cmd = 'yapf --lines=' . l:line_ranges

  " Call YAPF with the current buffer
  let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")

  " Update the buffer.
  silent execute '1,' . string(line('$')) . 'delete'
  call setline(1, split(l:formatted_text, "\n"))

  " Reset cursor to first line of the formatted range.
  call cursor(a:firstline, 1)
endfunction

command! -range=% PyFormat <line1>,<line2>call <SID>PyFormat()

function! <SID>ClangFormat()
  if !executable('clang-format')
    echoerr "No clang-format binary not found in $PATH. Please install it first."
    return
  endif
  call system('clang-format -i ' . expand('%:p'))
  silent edit!
endfunction

command! ClangFormat call <SID>ClangFormat()
autocmd! BufWritePost *.h,*.c,*.cpp nested ClangFormat

" Neovim {{{1
if has('nvim')
  " Terminal mappings
  tnoremap <C-b> <C-\><C-n>
  " tnoremap <Esc> <C-\><C-n>
  tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

  " Move between splits using <Alt>
  if empty($TMUX)
    tnoremap <A-Left> <C-\><C-n><C-w>h
    tnoremap <A-Down> <C-\><C-n><C-w>j
    tnoremap <A-Up> <C-\><C-n><C-w>k
    tnoremap <A-Right> <C-\><C-n><C-w>l
    nnoremap <A-Left> <C-w>h
    nnoremap <A-Down> <C-w>j
    nnoremap <A-Up> <C-w>k
    nnoremap <A-Right> <C-w>l
  endif
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " Always enter insert mode when focusing a terminal buffer
  autocmd BufEnter term://* startinsert

  if !exists('g:terminal_color_0')
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

" Local settings {{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" vim: set foldenable foldmethod=marker foldlevel=0:
