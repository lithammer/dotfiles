" Plugins {{{
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Raimondi/delimitMate'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', {'do': 'make clean all'}
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gorkunov/smartgf.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
Plug 'justinmk/vim-matchparenalways'
Plug 'justinmk/vim-sneak'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
" Plug 'tsukkee/unite-tag'
Plug 'wellle/targets.vim'

" Filetype specific {{{
Plug 'fatih/vim-go'

if has('python')
    Plug 'SirVer/ultisnips'
    Plug 'Valloric/MatchTagAlways'
    Plug 'Valloric/YouCompleteMe'
    " Plug 'davidhalter/jedi-vim'
    Plug 'honza/vim-snippets'
    " Plug 'lambdalisue/vim-pyenv'
    " Plug 'jmcantrell/vim-virtualenv'
endif

if has('lua')
    " Plug 'Shougo/neocomplete.vim'
endif

Plug 'clausreinke/typescript-tools', {'for': 'typescript'}

Plug 'dag/vim-fish'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/javascript-libraries-syntax.vim'
" }}}

" Color schemes {{{
Plug 'godlygeek/csapprox'

" Plug 'Pychimp/vim-luna'
" Plug 'chriskempson/base16-vim'
" Plug 'guns/jellyx.vim'
" Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'

let base16colorspace = 256
" }}}

call plug#end()
" }}}

" Plugin settings and mappings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use a different mapleader (default is '\')
let mapleader = ','

" Airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
" }}}

" delimitMate {{{
let delimitMate_expand_cr = 1                " Enable expansion of <CR>
" }}}

" Commentary {{{
map <Leader>c :Commentary<CR>
" }}}

" {{{ Ctrlp
nnoremap <C-t> :CtrlPBufTag<CR>

let g:ctrlp_custom_ignore = { 'dir': '\v[\/](venv|env)$' }

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l -g ""'
    let g:ctrlp_use_caching = 0
endif
" }}}

" Dispatch {{{
" Use vim-dispatch to build in the background (uses makeprg)
nnoremap <F6> :Dispatch<CR>
" }}}

" EasyAlign {{{
vmap <Enter> <Plug>(EasyAlign)
" }}}

" Go {{{
let g:go_fmt_command = 'goimports'
" }}}

" {{{ Jedi
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
" }}}

" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}

" lengthmatters {{{
" let g:lengthmatters_on_by_default = 0
" }}}

" {{{ Neosnippet
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)

" " For snippet_complete marker.
" if has('conceal')
"     set conceallevel=2 concealcursor=i
" endif

" " SuperTab like snippets behavior.
" imap <expr><Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<Tab>"
" smap <expr><Tab> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
" }}}

" Over {{{
cabbrev %s OverCommandLine<CR>%s
cabbrev '<,'>s OverCommandLine<CR>'<,'>s
" }}}

" HTML 5 {{{
let g:html5_aria_attributes_complete = 0     " Disable WAI-ARIA attribute support
let g:html5_rdfa_attributes_complete = 0     " Disable RDFa attribute support
" }}}

" Neocomplete (and related) {{{
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1

" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif

" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif

" if !exists('g:neocomplete#sources#omni#functions')
"   let g:neocomplete#sources#omni#functions = {}
" endif


" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#show_call_signatures = 0

" let g:neocomplete#sources#omni#functions.go = 'go#complete#Complete'
" let g:neocomplete#force_omni_input_patterns.python =
"     \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" autocmd FileType python setlocal omnifunc=jedi#completions

" " Cycle completions with Tab and Shift-Tab
" inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<Tab>"
" }}}

" Sneak {{{
let g:sneak#streak = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-n>'
" let g:SuperTabContextDefaultCompletionType = '<C-x><C-o>'
" }}}

" Syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_python_checkers = ['pylint', 'frosted', 'pep8', 'pep257']
let g:syntastic_python_checkers = ['frosted', 'pep8']
let g:syntastic_python_pep257_args = '--ignore=D100,D102,D203,D204'
" }}}

" Tagbar {{{
nmap <Leader>t :TagbarToggle<CR>
" }}}

" TComment {{{
" map <Leader>c :TComment<CR>
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
" }}}

" Unimpaired {{{
nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]
" }}}

" Unite {{{
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_selecta'])
" nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async:!<CR>

" " Don't cache, it's fast enough
" let g:unite_source_rec_max_cache_files = 0
" call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 500)

" command! -nargs=* -complete=file Grep execute 'Unite grep:.::<q-args> -buffer-name=search-buffer'

" if executable('ag')
"     let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup -g ""'
"     let g:unite_source_grep_command = 'ag'
"     let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
"     let g:unite_source_grep_recursive_opt = ''
" elseif executable('pt')
"     let g:unite_source_rec_async_command = 'pt --nocolor --nogroup -g .'
"     let g:unite_source_grep_command = 'pt'
"     let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"     let g:unite_source_grep_recursive_opt = ''
"     let g:unite_source_grep_encoding = 'utf-8'
" endif

" call unite#custom#profile('default', 'context', {
" \   'direction': 'below',
" \   'winheight': 10,
" \ })

" let g:unite_source_history_yank_enable = 1
" nnoremap <C-y> :<C-u>Unite history/yank<CR>
" nnoremap <C-b> :<C-u>Unite buffer -quick-match<CR>
" nnoremap <C-g> :NeoCompleteIncludeMakeCache<CR>:<C-u>Unite tag/include -silent -start-insert<CR>

" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()
"     " Overwrite settings.
"     imap <silent><buffer><expr> <C-s> unite#do_action('split')
"     imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"     imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
" endfunction
" }}}

" Virtualenv {{{
let g:virtualenv_auto_activate = 1           " Automatically activate virtualenv if possible
" }}}

" YouCompleteMe {{{
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Looks up the symbol under the cursor and jumps to its definition if
" possible; if the definition is not accessible from the current translation
" unit, jumps to the symbol's declaration.
" nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }}}

" }}}

" Options {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Tree style file listing
let g:netrw_liststyle = 3

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

" let g:airline_theme = 'powerlineish'
" let g:hybrid_use_iTerm_colors = 1
let g:hybrid_use_Xresources = 1
colorscheme hybrid
if has('gui_running')
    colorscheme base16-default
    set background=light
endif

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more)
set autowrite

" Recognize numbered lists when formatting text
set formatoptions+=n

" Delete comment character when joining commented lines
set formatoptions+=j

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround

" Highlight current cursor row
set cursorline

" Highlight one column after 'textwidth'
" set colorcolumn=+1

" Show menu when there's at least one match, and show extra information
set completeopt=menuone,preview

" Remove fold characters
set fillchars="vert:|,fold:"

" ':substitute' flag 'g' is on by default, will replace
" all matches on a line instead of one
set gdefault

" Highlight all search matches
set hlsearch

" Ignore case in search patterns, unless they contains upper case characters
set ignorecase smartcase

" Don't redraw screen while executing macros
set lazyredraw

" Break long lines on more natural break points
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Show some hidden characters ('listchars')
set list

set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:_

" Faster and more precise mouse support
set ttymouse=xterm2

" Allow mouse usage in all modes
set mouse=a

" Don't show current mode on last line (vim-airline does this instead)
set noshowmode

" Don't wrap long lines
set nowrap

" Show line numbers
set number

" Shortcut to toggle paste mode
set pastetoggle=<F5>

" Use current line as starting point for line numbering
set relativenumber

" Always report number of lines changes
set report=0

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" The minimal number of columns to scroll horizontally
set sidescroll=10

" Characters to put at the start of wrap lines
set showbreak=\ \ ↪

" Briefly jump to matching bracket in insert mode
set showmatch

" Put the new window on the right when doing :vsplit
set splitright

" Set the title of the window to 'titlestring'
set title

" More characters will be sent to the screen for redrawing
set ttyfast

for dir in ['swaps', 'undos', 'backups']
    let path = expand('~/.vim/'.dir)
    if !isdirectory(path)
        silent call mkdir(path)
    endif
endfor

set directory=$HOME/.vim/swaps
set backupdir=$HOME/.vim/backups
set undodir=$HOME/.vim/undos
set undofile

" Allow cursor beyond EOL in Visual block mode
set virtualedit=block

" Match longest commong string
set wildmode=list:longest,list:full

" Version control
set wildignore+=.svn,.git,.hg

" Binary files
set wildignore+=*.py[co],*.luac,*.beam,*.class,*.o

" Images
set wildignore+=*.jpe?g,*.png,*.gif,*.bmp,*.ico

" Virtualenv and npm
set wildignore+=venv,env,node_modules

" OS files
set wildignore+=*.DS_Store

" }}}

" Mappings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" My fingers are too fast!
command W w
command Q q

" Make Y behave like D (yank from cursor to EOL)
nnoremap Y y$

" Copy to clipboard
vnoremap <C-c> "*y"

" Toggle fold under cursor
noremap <Space> za

" Don't move on '*', useful when highlighting words
nnoremap * *<C-o>

" Go to previous file
map <Leader>p <C-^>

" Strip whitespace
function! StripWhitespaces()
    " Save last search and cursor position
    let searchHistory = @/
    let cursorLine = line(".")
    let cursorColumn = col(".")

    " Strip trailing whitespaces
    %s/\s\+$//e

    " Restore previous search history and cursor position
    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)
endfunction
command StripWhitespaces :call StripWhitespaces()

" }}}

" Auto commands {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sets the filetype when using Ctrl-x-e in bash
autocmd BufRead,BufNewFile bash-* set filetype=sh

" Press K to get documentation about a Vim keyword
autocmd FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Only show colorcolumn in the current window
if (&colorcolumn == '+1')
    augroup ccol
        autocmd!
        autocmd WinLeave * setlocal colorcolumn=0
        autocmd WinEnter * setlocal colorcolumn=+1
    augroup END
endif

" Only show cursorline in the current window and in normal mode
if (&cursorline)
    augroup cline
        autocmd!
        autocmd WinLeave * set nocursorline
        autocmd WinEnter * set cursorline
        autocmd InsertEnter * set nocursorline
        autocmd InsertLeave * set cursorline
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

" Always enable rainbow colors
au VimEnter * RainbowParentheses

" }}}

" Filetype settings {{{
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
    setlocal foldlevel=1
    setlocal foldnestmax=2

    " Highlight 'print' as function
    syn keyword pythonBuiltinFunc print

    " Highlight python string format groups
    highlight pythonStrFormat ctermfg=110

    " Highlight 'NOTE' and 'HACK' in comments
    syn keyword pythonTodo NOTE HACK contained

    " Only show colorcolumn in the current window
    augroup ccol
        autocmd!
        autocmd WinLeave * setlocal colorcolumn=0
        autocmd WinEnter * setlocal colorcolumn=+1
    augroup END
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

function! FourSpaceIndent()
    setlocal expandtab
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
endfunction

function! TwoSpaceIndent()
    setlocal expandtab
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType json,less,css,stylus,jade,ruby call TwoSpaceIndent()

" }}}

" OS Specific {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" General GUI options
if has('gui')
    set guioptions-=m  " Remove menu bar
    set guioptions-=T  " Remove toolbar
    set guioptions-=l  " Remove left scrollbar
    set guioptions-=L
    set guioptions-=r  " Remove right scrollbar
    set guioptions-=R
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
if filereadable(glob('$HOME/.vimrc.local'))
    source $HOME/.vimrc.local
endif
" vim: set foldenable foldmethod=marker foldlevel=0:
" }}}
