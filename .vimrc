" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:python_version = matchstr(system("python --version | cut -f2 -d ' '"), '^[0-9]')
if g:python_version =~ 3
    let g:loaded_python_provider = 1
else
    let g:loaded_python3_provider = 1
endif

let $FZF_DEFAULT_OPTS .= ' --inline-info'
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  if empty($TMUX)
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif
endif
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
" Raimondi/delimitMate {{{2
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
" Shougo/unite.vim {{{2
Plug 'Shougo/unite.vim' | Plug 'Shougo/unite-outline'
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <C-p> :<C-u>Unite -start-insert -auto-resize file_rec/async:!<CR>
" nnoremap <C-t> :<C-u>Unite -start-insert -auto-resize tag<CR>
nnoremap <C-g> :<C-u>Unite -auto-preview -no-split grep<CR>
" nnoremap <C-g> :<C-u>Unite -start-insert -auto-resize file_rec/git<CR>
" nnoremap <C-b> :<C-u>Unite -quick-match buffer<CR>

" Don't cache, it's fast enough
let g:unite_source_rec_max_cache_files = 0

if executable('ag')
  let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
  let g:unite_source_grep_command = ['ag']
  let g:unite_source_grep_default_opts = ['--vimgrep']
  let g:unite_source_grep_recursive_opt = ['']
endif

function! s:custom_unite_settings()
  " Overwrite settings.
  " imap <silent><buffer> <Esc> :UniteClose<CR>
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  call unite#custom#source('file_rec/async,file_rec/git,file_rec/neovim',
        \'sorters', ['sorter_rank'])
  call unite#custom#source('file_rec/async,file_rec/git,file_rec/neovim',
        \'matchers', ['matcher_fuzzy'])
  call unite#custom#source('file_rec/async,file_rec/git,grep',
        \'converters', ['converter_relative_word'])
  " " This might not work since `wildignore` is empty here
  " call unite#custom#source('file_rec/async,file_rec/git', 'ignore_globs', split(&wildignore, ','))
endfunction
autocmd FileType unite call s:custom_unite_settings()

" Shougo/vimproc.vim {{{2
Plug 'Shougo/vimproc.vim', {'do': 'make clean all'}
" SirVer/ultisnips {{{2
if has('python') && v:version > 703
  " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = '<C-k>'
  let g:UltiSnipsJumpForwardTrigger = '<C-k>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
endif
" Valloric/YouCompleteMe {{{2
if has('python') && has('patch-7.3.867')
  Plug 'Valloric/YouCompleteMe'
  " let g:ycm_path_to_python_interpreter = expand('~/.vim/env/bin/python')
  let g:ycm_rust_src_path = expand('~/src/github.com/rust-lang/rust/src')
  " Disable the identifier completer
  " let g:ycm_min_num_of_chars_for_completion = 99
  let g:ycm_use_ultisnips_completer = 0
  let g:ycm_goto_buffer_command = 'horizontal-split'
  " let g:ycm_collect_identifiers_from_tags_files = 1

  " Looks up the symbol under the cursor and jumps to its definition if
  " possible; if the definition is not accessible from the current translation
  " unit, jumps to the symbol's declaration.
  nnoremap <leader>jd :YcmCompleter GoTo<CR>
end

" airblade/vim-gitgutter {{{2
" XXX: For some reason this screws with YCM completion
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 0
" benekastah/neomake {{{2
" Plug 'benekastah/neomake'
highlight link NeomakeErrorSign ErrorMsg
highlight link NeomakeWarningSign Type

let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'NeomakeWarningSign',
    \ }

" let g:neomake_open_list = 1
let g:neomake_verbose = 0  " Log only errors

let g:neomake_python_enabled_makers = ['flake8', 'pylint']
" bling/vim-airline {{{2
" Plug 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#branch#enabled = 0
" ctrlpvim/ctrlp.vim {{{2
" Plug 'ctrlpvim/ctrlp.vim'
" nnoremap <C-t> :CtrlPTag<CR>
" nnoremap <C-b> :CtrlPBuffer<CR>

" let g:ctrlp_custom_ignore = {'dir': '\v[\/](venv|env|node_modules|vendor)$'}
let g:ctrlp_custom_ignore = {'dir': '\v[\/](vendor)$'}

if executable('ag')
  let g:ctrlp_user_command = [
    \ '.git',
    \ 'git ls-files --cached --others --exclude-standard %s',
    \ 'ag %s --nocolor --nogroup --files-with-matches -g ""'
  \ ]
  let g:ctrlp_use_caching = 0
endif
" fatih/vim-go {{{2
Plug 'fatih/vim-go'
let g:go_fmt_command = 'goimports'
" hynek/vim-python-pep8-indent {{{2
Plug 'hynek/vim-python-pep8-indent'
" jeetsukumaran/vim-filebeagle {{{2
" Plug 'jeetsukumaran/vim-filebeagle'
" junegunn/fzf {{{2
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
" let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Tags<CR>
nnoremap <C-b> :Buffers<CR>
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
let g:grepper = {
  \ 'open': 1,
  \ 'switch': 1,
  \ }
command! -nargs=* Grep Grepper -noprompt -tool ag -grepprg ag --vimgrep <args>
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
Plug 'rust-lang/rust.vim'
" let g:rustfmt_autosave = 1
" scrooloose/syntastic {{{2
Plug 'scrooloose/syntastic'
highlight link SyntasticErrorSign ErrorMsg
highlight link SyntasticWarningSign Type

let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_aggregate_errors = 1
" let g:syntastic_html_checkers = []
let g:syntastic_go_checkers = ['go', 'govet', 'golint']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_jsxhint_args = '--babel'
" let g:syntastic_lua_checkers = ['luac', 'luacheck']
let g:syntastic_lua_checkers = ['luac']
" let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
" http://www.jbrantly.com/typescript-and-jsx/
let g:syntastic_typescript_tsc_args = '--jsx react --module commonjs --target ES5'
let g:syntastic_typescript_tslint_args = '--config ~/.config/.tslint.json'
" sheerun/vim-polyglot {{{2
Plug 'sheerun/vim-polyglot'
" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'
map <Leader>c :Commentary<CR>
" tpope/vim-dispatch {{{2
Plug 'tpope/vim-dispatch'
" tpope/vim-eunuch {{{2
Plug 'tpope/vim-eunuch'
" tpope/vim-flagship {{{2
" Plug 'tpope/vim-flagship'
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
" unblevable/quick-scope {{{2
" Plug 'unblevable/quick-scope'
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
Plug 'chriskempson/base16-vim'
Plug 'guns/jellyx.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'w0ng/vim-hybrid'
Plug 'renstrom/vim-hybrid'
" }}}
call plug#end()
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

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

" let g:airline_theme = 'hybridline'
let g:gruvbox_italic = 0

if !empty($TMUX)
  set background=dark
  let base16colorspace = 256
  colorscheme base16-eighties
elseif has('nvim')
  colorscheme base16-eighties
else
  colorscheme hybrid
endif
" let g:airline_theme = 'hybridline'

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
  let &grepprg = 'ag --vimgrep'
else
  let &grepprg = 'grep --recursive --line-number $* *'
endif
" command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen

" Highlight all search matches
set hlsearch

" Ignore case in search patterns, unless they contains upper case characters
set ignorecase smartcase

" Don't redraw screen while executing macros
set lazyredraw

" Show some hidden characters ('listchars')
set list

set listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:_

" Allow mouse usage in all modes
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
set wildignore+=.svn,.git,.hg

" Binary files
set wildignore+=*.py[co],*.luac,*.beam,*.class,*.o

" Images
set wildignore+=*.jpe?g,*.png,*.gif,*.bmp,*.ico

" Virtualenv, npm and bower
set wildignore+=venv,env,node_modules,bower_components

" OS files
set wildignore+=*.DS_Store
" Mappings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" My fingers are too fast!
command W w
command Q q

" Make Y behave like D (yank from cursor to EOL)
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

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
nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]
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

  let tag = "%{tagbar#currenttag(':%s ', ' ')}"
  let enc = "%{&encoding == 'utf-8' ? '' : printf('[%s]', &encoding)}"
  let ff = "%{&fileformat == 'unix' ? '' : printf('[%s]', &fileformat)}"
  let syntastic = '%{SyntasticStatuslineFlag()}'
  let ws = '%{StatuslineWhitespace()}'

  return ' %<%f%m'.tag.'%r%w%y'.enc.ff.'%=%l/%L, %c %#Error#'.syntastic.ws.'%*'
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
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Only show colorcolumn in the current window
if &colorcolumn == '+1'
  augroup ccol
    autocmd!
    autocmd WinLeave * setlocal colorcolumn=0
    autocmd WinEnter * setlocal colorcolumn=+1
  augroup END
endif

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" When editing a file, always jump to the last known cursor position.
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction
autocmd BufReadPost * call SetCursorPosition()

" Always close preview window after completion is done.
" http://stackoverflow.com/a/26022965/1862923
if has('patch-7.3.598')
  autocmd CompleteDone * pclose
endif

augroup rainbow_colors
  " let g:rainbow#pairs = [['(', ')'], ['[', ']']]
  autocmd!
  autocmd FileType clojure,scheme,python RainbowParentheses
augroup END
" au VimEnter * RainbowParentheses
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

function! TwoSpaceIndent()
  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction
autocmd FileType json,less,scss,css,stylus,jade,ruby call TwoSpaceIndent()

" Python, PEP8: http://www.python.org/dev/peps/pep-0008/
function! SetupPython()
  setlocal textwidth=79
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldnestmax=2

  " Highlight 'print' as function
  syn keyword pythonBuiltinFunc print

  " Highlight 'NOTE' and 'HACK' in comments
  syn keyword pythonTodo NOTE HACK contained

  " https://github.com/google/yapf
  if executable('yapf')
    function! FormatPython()
      " Do not run this for automatic formatting
      if !empty(v:char) || mode() == 'i' || mode() == 'R'
        return 1
      end

      let l:line_ranges = v:lnum . '-' . (v:lnum + v:count - 1)
      silent execute '0,$!yapf --lines=' . l:line_ranges
      " Reset cursor to first line of the formatted range
      call cursor(v:lnum, 1)
    endfunction

    setlocal formatexpr=FormatPython()
  endif
endfunction
autocmd FileType python call SetupPython()

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

" Set JavaScript indent settings for TypeScript (leafgarland/typescript-vim
" doesn't include any indentation)
autocmd FileType typescript runtime! indent/javascript.vim
" Neovim {{{1
if has('nvim')
  set nottimeout
  set ttimeoutlen=-1

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

  if $NVIM_TUI_ENABLE_TRUE_COLOR
    let g:airline_theme = 'base16'
    set background=dark
    " colorscheme base16-eighties

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

  " This mapping makes Ctrl-Tab switch between tabs.
  " Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
endif

" Windows
if has('gui_win32')
  " ...
endif

" Local settings
silent source ~/.vimrc.local
" vim: set foldenable foldmethod=marker foldlevel=0:
