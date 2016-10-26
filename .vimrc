" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:python_host_prog = '/usr/bin/python2.7'
" let g:ycm_server_python_interpreter = g:python_host_prog
" let g:python3_host_prog = '/usr/local/bin/python3'

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

let g:did_install_default_menus = 1  " avoid menu.vim (saves ~100ms)
let g:loaded_vimballPlugin = 1
let g:loaded_rrhelper = 1
" Plugins {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin()

" Use a different mapleader (default is '\')
let mapleader = ','
" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'
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
" Shougo/deoplete.nvim {{{2
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim'

"   " https://github.com/zchee/deoplete-jedi/issues/35
"   Plug 'davidhalter/jedi-vim', { 'for': 'python' }
"   let g:jedi#completions_enabled = 0
"   let g:jedi#auto_vim_configuration = 0
"   let g:jedi#use_splits_not_buffers = 'winwidth'
"   let g:jedi#documentation_command = 'K'
"   let g:jedi#goto_assignments_command = ''
"   let g:jedi#goto_command = '<leader>jd'
"   let g:jedi#goto_definitions_command = ''
"   let g:jedi#rename_command = ''
"   let g:jedi#usages_command = ''
"   autocmd BufWinEnter '__doc__' setlocal bufhidden=delete

"   Plug 'zchee/deoplete-jedi', { 'for': 'python' }
"   Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
"   Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
"   Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
"   Plug 'mhartington/deoplete-typescript', { 'for': 'typescript' }
"   " Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

"   let g:deoplete#enable_at_startup = 1
"   let g:deoplete#enable_smart_case = 1

"   inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" : deoplete#mappings#manual_complete()

"   function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
"   endfunction

"   " let g:deoplete#sources#jedi#python_path = g:python3_host_prog

"   let g:deoplete#sources#clang#libclang_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"   let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
"   let g:deoplete#sources#clang#sort_algo = 'priority'
" end
" Valloric/YouCompleteMe {{{2
if (has('python') || has('python3')) && has('patch-7.3.867')
  Plug 'Valloric/YouCompleteMe'

  let g:ycm_python_binary_path = 'python'
  let g:ycm_rust_src_path = expand('~/src/github.com/rust-lang/rust/src')
  let g:ycm_goto_buffer_command = 'horizontal-split'
  nnoremap <leader>jd :YcmCompleter GoTo<CR>
end
" airblade/vim-gitgutter {{{2
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
" ap/vim-css-color {{{2
" Plug 'ap/vim-css-color'
" fatih/vim-go {{{2
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_fmt_command = 'goimports'
" hdima/python-syntax {{{2
Plug 'hdima/python-syntax'
" hynek/vim-python-pep8-indent {{{2
Plug 'hynek/vim-python-pep8-indent'
" junegunn/fzf {{{2
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_files_options = '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <C-t> :FzfTags<CR>
nnoremap <C-g> :FzfBTags<CR>
nnoremap <C-b> :FzfBuffers<CR>
" junegunn/vim-peekaboo {{{2
Plug 'junegunn/vim-peekaboo'
" junegunn/rainbow_parentheses.vim {{{2
Plug 'junegunn/rainbow_parentheses.vim'
" junegunn/vim-easy-align {{{2
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
vmap <Enter> <Plug>(EasyAlign)
" justinmk/vim-sneak {{{2
Plug 'justinmk/vim-sneak'
" let g:sneak#streak = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
highlight link SneakPluginTarget Search
highlight link SneakStreakTarget Error
highlight link SneakStreakMask Normal
highlight link SneakPluginScope Search
" kshenoy/vim-signature {{{2
Plug 'kshenoy/vim-signature'
" ludovicchabant/vim-gutentags {{{2
if v:version > 703
  Plug 'ludovicchabant/vim-gutentags'
endif
let g:gutentags_cache_dir = expand('~/.vim/tags')
let g:gutentags_exclude = [
  \ '/usr/local/*',
  \ '*.min.js',
  \ '*/vendor/*',
  \ '*/node_modules/*',
  \ '*/env/*',
  \ '*/venv/*',
  \ '*/esb2001/*',
  \ '*/isa-gw/*',
  \ '*/platform/*',
  \ '*/third_party/*',
  \ '*/lib/*',
  \ '*/lib64/*'
  \ ]
" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>
" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
let g:grepper = {'open': 1}
" neomake/neomake {{{2
" Plug 'neomake/neomake'
" autocmd! BufWritePost * Neomake
" osyo-manga/vim-brightest {{{2
Plug 'osyo-manga/vim-brightest', {'on': 'BrightestEnable'}
let g:brightest#highlight = {'group': 'BrightestReverse'}
let g:brightest#enable_filetypes = {
\  '_': 0,
\  'python': 1,
\  'go': 1,
\  'javascript': 1,
\}
" raimon49/requirements.txt.vim {{{2
Plug 'raimon49/requirements.txt.vim'
" rust-lang/rust.vim {{{2
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1
" scrooloose/syntastic {{{2
Plug 'scrooloose/syntastic'
" Alternatives https://github.com/w0rp/ale https://github.com/maralla/validator.vim
highlight link SyntasticErrorSign ErrorMsg
highlight link SyntasticWarningSign Type

let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" let g:syntastic_error_symbol = 'E>'
" let g:syntastic_warning_symbol = 'W>'
let g:syntastic_error_symbol = '✖'
" let g:syntastic_warning_symbol = '♺'
let g:syntastic_warning_symbol = '●'
let g:syntastic_style_error_symbol = '✖'
" let g:syntastic_style_warning_symbol = '♺'
let g:syntastic_style_warning_symbol = '●'

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
let g:syntastic_scss_checkers = ['sassc', 'stylelint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
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
" tpope/vim-speeddating {{{2
Plug 'tpope/vim-speeddating'
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
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
Plug 'chriskempson/base16-vim'
Plug 'guns/jellyx.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'w0ng/vim-hybrid'
Plug 'renstrom/vim-hybrid'
" }}}
call plug#end()

" Needs to be executed after 'plug#end()'
" if has('nvim')
"   call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
" end
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Stop the sh syntax file from highlighting $(...) as errors.
" See :h ft-sh-syntax.
let g:is_posix = 1

" Tree style file listing
let g:netrw_liststyle = 3

" <C-^> should go to the last file, not to netrw
let g:netrw_altfile = 1

" Highlight numers, buitin functions, standard exceptions, doctests and
" whitespace errors (:h ft-python-syntax)
let python_highlight_all = 1

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses (:h ft-lisp-syntax)
let g:lisp_rainbow = 1

" Use the 256 color space instead of 16
set t_Co=256

" Make sure dark background is used for colorschemes
set background=dark

if has('termguicolors') " 7.4.1799
  if !empty('$TMUX')
    " :h xterm-true-color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
  " let g:jellybeans_use_lowcolor_black = 0
  " let g:jellybeans_use_term_background_color = 1
  let g:jellybeans_overrides = {
  \    'background': { 'ctermbg': 'NONE', '256ctermbg': 'NONE', 'guibg': 'NONE' },
  \}
  " color jellybeans
  colorscheme base16-eighties
else
  colorscheme hybrid
endif

if has('termguicolors')
  if g:colors_name == 'base16-eighties'
    " Make current line number more prominent (yellow)
    highlight! link CursorLineNr Todo
    highlight! link WildMenu Search

    " Make 'listchars' darker
    highlight clear SpecialKey
    highlight SpecialKey ctermfg=19 guifg=#444444

    " Syntastic markers
    highlight link SyntasticErrorSign DiffDelete
    highlight link SyntasticWarningSign CursorLineNr

    " More contrast to active statusline
    highlight! link StatusLine Cursor
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
  endif
endif

let g:markdown_fenced_languages = [
  \ 'python', 'javascript', 'js=javascript', 'json=javascript', 'go']

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more)
set autowrite

" Recognize numbered lists when formatting text
set formatoptions+=n

" Delete comment character when joining commented lines
if has('patch-7.3.541')
  set formatoptions+=j
endif

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround

" Highlight one column after 'textwidth'
" set colorcolumn=+1

" Show menu when there's at least one match, and show extra information
set completeopt=menuone,preview
" set completeopt=menuone

" Remove fold characters
" set fillchars-=fold:-
set fillchars="vert:│,fold:"

" Set a nicer foldtext function
set foldtext=NumLinesEndOfLine()
function! NumLinesEndOfLine()
  let maxwidth = 80
  let lines = (v:foldend - v:foldstart + 1)
  let linetext = strpart(getline(v:foldstart), 0, -3 + maxwidth - len(lines))
  return linetext . repeat(' ', maxwidth - len(linetext) - len(lines)) . lines
endfunction

" ':substitute' flag 'g' is on by default, will replace
" all matches on a line instead of one
set gdefault

" Include line numbers in grep format
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Use Ag (The Silver Searcher) instead of grep if available
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
else
  set grepprg=grep\ -I\ --recursive\ --line-number\ $*\ *
endif
" command! -nargs=* -complete=file -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
command! -bang -nargs=* -complete=file -bar Grep silent! grep! <args>
autocmd QuickFixCmdPost *grep* cwindow

" Highlight all search matches
set hlsearch

" Ignore case in search patterns, unless they contains upper case characters
set ignorecase smartcase

" Show some hidden characters ('listchars')
set list

set listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:_

" Disable mouse
set mouse=""

" Wrap long lines
set wrap

" Characters to put at the start of wrap lines
let &showbreak = '↪ '

" Break long lines on more natural break points
if has('linebreak')
  set linebreak
endif

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
if exists('+breakindent')
  set breakindent
  set breakindentopt=shift:2
end

" Show line numbers
set number

" Use current line as starting point for line numbering
if exists('+relativenumber')
  set relativenumber
endif

" Always report number of lines changes
set report=0

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" The minimal number of columns to scroll horizontally
set sidescroll=10

" Put the new window on the right when doing :vsplit
set splitright

" Set the title of the window to 'titlestring'
set title

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

" Allow cursor beyond EOL in Visual block mode
set virtualedit=block

" Case-insensitive completion for file names and directories
if exists('+wildignorecase')
  set wildignorecase
end

" Match longest commong string
set wildmode=list:longest,list:full

" Version control
set wildignore+=.svn/,*/.git/,*/.hg/
set wildignore+=*/.svn/,*/.git/,*/.hg/

" Binary files
set wildignore+=*.py[co],*.luac,*.beam,*.class,*.o

" Images
set wildignore+=*.jpeg,*.jpg,*.png,*.gif,*.bmp,*.ico

" Virtualenv, npm and bower
set wildignore+=venv/,env/,node_modules/,vendor/
set wildignore+=*/venv/,*/env/,*/node_modules/,*/vendor/

" OS files
set wildignore+=*.DS_Store
" Mappings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" My fingers are too fast!
command W w
command Q q

" Copy to clipboard
vnoremap <C-c> "*y"

" Toggle fold under cursor
noremap <Space> za

" Don't move on '*', useful when highlighting words
nnoremap * *<C-o>

" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]
" nmap ö [
" nmap ä ]
" omap ö [
" omap ä ]
" xmap ö [
" xmap ä ]
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

function! MyStatusline()
  let enc = "%{&encoding == 'utf-8' ? '' : printf('[%s]', &encoding)}"
  let ff = "%{&fileformat == 'unix' ? '' : printf('[%s]', &fileformat)}"
  let syntastic = '%{SyntasticStatuslineFlag()}'
  let ws = '%{StatuslineWhitespace()}'

  return ' %<%f%m%r%w%y'.enc.ff.'%=%l/%L, %c %#Error#'.syntastic.ws.'%*'
endfunction

set statusline=%!MyStatusline()
" Auto commands {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sets the filetype when using Ctrl-x-e in bash
autocmd BufRead,BufNewFile bash-* set filetype=sh

" Press K to get documentation about a Vim keyword
autocmd FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Only show cursorline in the current buffer
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END

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
" http://stackoverflow.com/a/26022965/1862923
if has('patch-7.3.598')
  autocmd CompleteDone * pclose
else
  autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
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
  setlocal formatoptions+=t
endfunction
autocmd FileType text call SetupPlainText()

" Python, PEP8: http://www.python.org/dev/peps/pep-0008/
function! SetupPython()
  setlocal textwidth=79
  setlocal foldmethod=indent
  setlocal foldlevel=2
  setlocal foldnestmax=2

  " Highlight 'print' as function.
  syn keyword pythonBuiltinFunc print

  " Highlight 'NOTE' and 'HACK' in comments.
  syn keyword pythonTodo NOTE HACK contained
endfunction
autocmd FileType python call SetupPython()

function! YAPF() range
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

command! -range=% PyFormat <line1>,<line2>call YAPF()

function! ClangFormat() range
  if !executable('clang-format')
    echoerr "No clang-format binary not found in $PATH. Please install it first."
    return
  endif
  " Determine range to format.
  let l:line_ranges = a:firstline . ':' . a:lastline
  let l:cmd = 'clang-format -lines=' . l:line_ranges

  " Call clang-format with the current buffer
  let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")

  " Update the buffer.
  silent execute '1,' . string(line('$')) . 'delete'
  call setline(1, split(l:formatted_text, "\n"))

  " Reset cursor to first line of the formatted range.
  call cursor(a:firstline, 1)
endfunction

command! -range=% CFormat <line1>,<line2>call ClangFormat()

function! FormatCode() range
  if &filetype == 'python'
    call PyFormat()
  endif
endfunction

command! -range=% Format <line1>,<line2>call FormatCode()

" XML, HTML et al
function! SetupMarkupLanguage()
  setlocal matchpairs+=<:>

  " Set `xmllint` as formatter for XML
  if &filetype == 'xml'
    setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  endif
endfunction
autocmd FileType html,xml call SetupMarkupLanguage()

function! SetupJSON()
  setlocal equalprg=python\ -mjson.tool
endfunction
autocmd FileType json call SetupJSON()

" Neovim {{{1
if has('nvim')
  " Terminal mappings
  tnoremap <C-b> <C-\><C-n>
  " tnoremap <Esc> <C-\><C-n>
  tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

  " Move between splits using <Alt>
  tnoremap <A-Left> <C-\><C-n><C-w>h
  tnoremap <A-Down> <C-\><C-n><C-w>j
  tnoremap <A-Up> <C-\><C-n><C-w>k
  tnoremap <A-Right> <C-\><C-n><C-w>l
  nnoremap <A-Left> <C-w>h
  nnoremap <A-Down> <C-w>j
  nnoremap <A-Up> <C-w>k
  nnoremap <A-Right> <C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " Always enter insert mode when focusing a terminal buffer
  autocmd WinEnter term://* startinsert

  if g:colors_name == 'base16-eighties'
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
  elseif g:colors_name == 'base16-mocha'
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
" OS Specific {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" General GUI options
if has('gui')
  set guioptions-=m  " Remove menu bar
  set guioptions-=T  " Remove toolbar
  set guioptions-=l  " Remove left scrollbar
  set guioptions-=L
  set guioptions-=r  " Remove right scrollbar
  set guioptions-=R
  nnoremap <C-p> :<C-u>Unite -start-insert -auto-resize file_rec/git:!<CR>
endif

" OS X
if has('gui_macvim')
  colorscheme base16-solarized-light
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " MacVIM shift+arrow-keys behaviour
  "let macvim_hig_shift_movement = 1

  " Map tab switch to cmd-<number>
  map <D-1> :tabn 1<CR>
  map <D-2> :tabn 2<CR>
  map <D-3> :tabn 3<CR>
  map <D-4> :tabn 4<CR>
  map <D-5> :tabn 5<CR>
  map <D-6> :tabn 6<CR>
  map <D-7> :tabn 7<CR>
  map <D-8> :tabn 8<CR>
  map <D-9> :tabn 9<CR>
  map! <D-1> <C-O>:tabn 1<CR>
  map! <D-2> <C-O>:tabn 2<CR>
  map! <D-3> <C-O>:tabn 3<CR>
  map! <D-4> <C-O>:tabn 4<CR>
  map! <D-5> <C-O>:tabn 5<CR>
  map! <D-6> <C-O>:tabn 6<CR>
  map! <D-7> <C-O>:tabn 7<CR>
  map! <D-8> <C-O>:tabn 8<CR>
  map! <D-9> <C-O>:tabn 9<CR>
endif

" Windows
if has('gui_win32')
  " ...
endif

" Local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" vim: set foldenable foldmethod=marker foldlevel=0:
