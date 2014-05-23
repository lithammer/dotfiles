" ┌──────────────────────────────────────────────────────────────────────┐
" │                                                                      │
" │                            Vim Settings                              │
" │                                                                      │
" │ Some highlights:                                                     │
" │    K = look for help under cursor                                    │
" │   ,p = go to previous file                                           │
" │                                                                      │
" │   ,i = toggle invisibles                                             │
" │   <F5> = toggle paste mode on/off                                    │
" │   <C-l> = clear search highlight                                     │
" │                                                                      │
" │   ,c = comment block/line                                            │
" │                                                                      │
" │   ,* = search and replace word under cursor                          │
" │                                                                      │
" │                                                                      │
" │ Put machine/user specific settings in ~/.vimrc.local                 │
" │                                                                      │
" └──────────────────────────────────────────────────────────────────────┘

" Plugins {{{
call plug#begin('~/.vim/bundle')

" Unused but potentially cool/useful stuff {{{
"Plug 'dyng/ctrlsf.vim'
"Plug 'godlygeek/tabular'
"Plug 'junegunn/vim-scroll-position'
"Plug 'mhinz/vim-startify'
"Plug 'michaeljsmith/vim-indent-object'
"Plug 'sjl/gundo.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-commentary'
" }}}

Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'aaronbieber/vim-vault'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'gorodinskiy/vim-coloresque'
Plug 'gregsexton/MatchTag'
Plug 'gregsexton/gitv'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tsukkee/unite-tag'
Plug 'wellle/targets.vim'
Plug 'wellle/tmux-complete.vim'

if has('python')
    if v:version > 703 || v:version == 703 && has('patch584')
        Plug 'Valloric/YouCompleteMe'
    endif
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'jmcantrell/vim-virtualenv'
    " Plug 'davidhalter/jedi-vim'
endif

if has('ruby')
end

if has('lua')
    if v:version > 703 || v:version == 703 && has('patch885')
        " Plug 'Shougo/neocomplete.vim'
    endif
endif

" Filetype specific {{{
" Plug 'sheerun/vim-polyglot'

" Plug 'ap/vim-css-color'
Plug 'andersoncustodio/vim-tmux'
Plug 'chrisbra/csv.vim'
Plug 'dag/vim-fish'
Plug 'digitaltoad/vim-jade'
" Plug 'fatih/vim-go'
Plug 'Blackrush/vim-gocode'
Plug 'glanotte/vim-jasmine'
Plug 'gorodinskiy/vim-coloresque'
Plug 'groenewege/vim-less'
Plug 'guns/vim-clojure-static'
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'leafo/moonscript-vim'
Plug 'leshill/vim-json'
Plug 'mitsuhiko/vim-python-combined'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'oscarh/vimerl'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'travitch/hasksyn'
Plug 'wavded/vim-stylus'
Plug 'wting/rust.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" }}}

" Color schemes {{{
"Plug 'altercation/vim-colors-solarized'
"Plug 'Diablo3'
"Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'
"Plug 'nanotech/jellybeans.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'wombat256.vim'
"Plug 'Pychimp/vim-luna'
" }}}

call plug#end()
" }}}

" Plugin variables {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Neocomplete {{{
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
"
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#sources#omni#functions = {'go': 'go#complete#Complete'}
" let g:neocomplete#force_omni_input_patterns = {}
" let g:neocomplete#force_omni_input_patterns.python =
"     \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
"
" " Cycle completions with Tab and Shift-Tab
" inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<Tab>"
" }}}

" Tern
let tern#is_show_argument_hints_enabled = 'on_move'
let tern#tern_show_signature_in_pum = 1

" Python syntax
let python_highlight_all = 1

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
" let g:airline#extensions#tabline#excludes = []

" Ctrl-P
let g:ctrlp_max_height = 15
if executable('ag')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      let g:ctrlp_use_caching = 0
      let g:ackprg = 'ag'
      let g:ack_wildignore = 0
endif

" Gitv
let g:Gitv_OpenHorizontal = 'auto'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'

" Unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:ctrlp_map = ''
nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async:!<CR>

command! -nargs=* -complete=file Grep execute 'Unite grep:.::<q-args> -buffer-name=search-buffer'

if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
elseif executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1
"nnoremap <C-y> :<C-u>Unite history/yank<CR>
noremap <Leader>y :<C-u>Unite history/yank<CR>

nnoremap <C-b> :<C-u>Unite -quick-match buffer<CR>

" HTML 5
let g:html5_aria_attributes_complete = 0     " Disable WAI-ARIA attribute support
let g:html5_rdfa_attributes_complete = 0     " Disable RDFa attribute support

" delimitMate
let g:delimitMate_expand_cr = 1              " Enable expansion of <CR>
let g:delimitMate_expand_space = 0           " Enable expansion of <Space>

" Sneak
let g:sneak#streak = 1
hi link SneakPluginTarget Search
hi link SneakPluginScope Search
hi link SneakStreakTarget Search
" hi SneakStreakMask guifg=03 guibg=03 ctermfg=03 ctermbg=03

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_html_checkers = []
" let g:syntastic_python_pylama_args = '--options ~/.config/pylama.ini'
let g:syntastic_python_checkers = ['pylint', 'frosted', 'pep8', 'pep257']
let g:syntastic_python_pep257_args = '--ignore=D100,D203,D204'

" Virtualenv
let g:virtualenv_auto_activate = 1           " Automatically activate virtualenv if possible

" YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Replace Vim's search and replace with vim-over
cabbrev %s OverCommandLine<cr>%s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s
" }}}

" Options {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

filetype plugin indent on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Tree style file listing
let g:netrw_liststyle = 3

" Highlight trailing whitespace
let python_space_errors = 1

syntax on

" Use the 256 color space instead of 16
set t_Co=256

" Make sure dark background is used for colorschemes
set background=dark

let g:airline_theme = 'bubblegum'
let base16colorspace = 256

" http://chriskempson.github.io/base16/
colorscheme base16-eighties
if has('gui_running')
    let g:airline_theme = 'badwolf'
    colorscheme base16-default
    set background=light
endif

highlight Folded ctermfg=240 ctermbg=0

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more)
set autowrite

" Automatically read file again if external changes have been made
set autoread

set encoding=utf-8 nobomb

" Copy indent from current line when starting a new line, see doc for more
" details of additional features
set autoindent

" Recognize numbered lists when formatting text
set formatoptions+=n

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j
endif

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround
set smarttab

" When making a change to one line, don't redisplay the line,
" but put a '$' at the end of the changed text
"set cpoptions+=$

" Highlight current cursor row
set cursorline

" Highlight one column after 'textwidth'
" set colorcolumn=+1

" Allow backspacing over everything
set backspace=indent,eol,start

" Show menu when there's at least one match, and show extra information
set completeopt=menuone,preview

" Use stronger file encryption
set cryptmethod=blowfish

" Show as much as possible of the last line in a window
set display+=lastline

" Remove fold characters
set fillchars="vert:|,fold:"

" ':substitute' flag 'g' is on by default, will replace
" all matches on a line instead of one
set gdefault

" Highlight all search matches
set hlsearch

" Ignore case in search patterns, except when it contains upper case
" characters
set ignorecase smartcase

" Search while typing
set incsearch

" Always show statusline
set laststatus=2

" Don't redraw screen while executing macros
set lazyredraw

" Break long lines on more natural break points
set linebreak

" Show some hidden characters ('listchars')
set list

" Faster and more precise mouse support
set ttymouse=xterm2

" Allow mouse usage in all modes
set mouse=a

" Don't show current mode on last line (vim-airline does this instead)
set noshowmode

" Don't wrap long lines
set nowrap

" Treat numbers starting with 0x or 0X as hexadecimals
set nrformats="hex"

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

" Characters to put at the start of wrap lines
set showbreak=\ \ ↪

" Briefly jump to matching bracket in insert mode
set showmatch

" The minimal number of columns to scroll horizontally
set sidescroll=10

" Put the new window on the right when doing :vsplit
set splitright

" Set the title of the window to 'titlestring'
set title

" The time in milliseconds that is waited for a key code or mapped key
" sequence to complete
set ttimeout ttimeoutlen=50

" More characters will be sent to the screen for redrawing
set ttyfast

try
    set directory=$HOME/.vim/swaps
    set backupdir=$HOME/.vim/backups
    set undodir=$HOME/.vim/undos
    set undofile
catch
    for dir in ['swaps', 'backups', 'undos']
        silent execute '!mkdir -p $HOME/.vim/' . dir
    endfor
endtry

" Allow cursor beyond EOL in Visual block mode
set virtualedit=block

" Enable enhanced command-line completion by showing all matches
set wildmenu

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

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
        let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
    endif
endif

" }}}

" Mappings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use a different mapleader (default is '\')
let mapleader = ','

" My fingers are too fast!
command W w
command Q q

" Make Y behave like D (yank from cursor to EOL)
nnoremap Y y$

" Paste clipboard content
inoremap <C-v><C-v> <C-o>"*P
" Copy to clipboard
vnoremap <C-c> "*y"

" Toggle fold under cursor
noremap <Space> za

" Don't move on '*', useful when highlighting words
nnoremap * *<C-o>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Go to previous file
map <Leader>p <C-^>

" Toggle invisible characters
noremap <Leader>i :set list!<CR>

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
nnoremap <Leader>ss :call StripWhitespaces()<CR>

" Highlight lines with more than 80 chars (or 'textwidth')
highlight LongLine ctermfg=0 ctermbg=1
function! HighlightProblemLines()
    set nolist!
    set nolist?
    if exists('w:long_line_match')
        silent! call matchdelete(w:long_line_match)
        unlet w:long_line_match
    elseif &textwidth > 0
        let w:long_line_match = matchadd('LongLine', '\%>'.&tw.'v.\+', -1)
    else
        let w:long_line_match = matchadd('LongLine', '\%>80v.\+', -1)
    endif
endfunction
nnoremap <silent> <Leader>l :call HighlightProblemLines()<CR>

" Toggle comments (TComment)
map <Leader>c :TComment<CR>

" Toggle Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Search for tag within all open buffers
nmap <C-g> :CtrlPBufTagAll<CR>

" Looks up the symbol under the cursor and jumps to its definition if
" possible; if the definition is not accessible from the current translation
" unit, jumps to the symbol's declaration.
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Use vim-dispatch to build in the background (uses makeprg)
nnoremap <C-m> :Make!<CR>

" https://github.com/justinmk/vim-sneak#how-can-i-replace-f-with-sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

" }}}

" Auto commands {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

" Only show colorcolumn in the current window
if (&colorcolumn == '+1')
    augroup ccol
        autocmd!
        autocmd WinLeave * setlocal colorcolumn=0
        autocmd WinEnter * setlocal colorcolumn=+1
    augroup END
endif

" Don't show trailing whitespaces in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:␣
    autocmd InsertLeave * :set listchars+=trail:␣
augroup END

" Sets the filetype when using Ctrl-x-e in bash
autocmd BufRead,BufNewFile bash-* set filetype=sh

" Press K to get documentation about a Vim keyword
autocmd FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$") |
            execute 'normal! g`"zvzz' |
        endif
    end
endfunction

" Always enable Rainbow Parentheses
" https://github.com/kien/rainbow_parentheses.vim#always-on
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
" autocmd Syntax * RainbowParenthesesLoadBraces

" }}}

" Filetype settings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Encrypted files
function! SetupEncryption()
    setlocal viminfo=
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal nobackup
    setlocal nowritebackup
    setlocal noshelltemp
    " setlocal foldmethod=indent
    " setlocal foldlevel=0
    " setlocal foldclose=all
    setlocal history=0
    setlocal secure
endfunction
autocmd BufReadPre,BufRead * if &key == '*****' | call SetupEncryption() | endif

" Markdown
function! SetupMarkdown()
    setlocal wrap
    setlocal wrapmargin=2
    setlocal textwidth=79
    setlocal formatoptions+=t
endfunction
autocmd FileType markdown call SetupMarkdown()
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
    setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
    setlocal cindent
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal shiftround
    setlocal smartindent
    setlocal smarttab
    setlocal expandtab
    setlocal autoindent
    setlocal textwidth=79
    " setlocal formatoptions-=t
    setlocal nolisp
    setlocal foldmethod=indent
    setlocal foldlevel=1
    setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except
    silent! call HighlightProblemLines()
endfunction
autocmd FileType python call SetupPython()

" Ruby
function! SetupRuby()
    setlocal expandtab
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType ruby call SetupRuby()

" Go
function! SetupGolang()
    " Remove tab characters.
    let &listchars = "tab:  ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endfunction
autocmd FileType go call SetupGolang()

" JSON, LESS, CSS, Stylus and Jade
function! TwoSpaceIndent()
    setlocal expandtab
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType json,less,css,stylus,jade call TwoSpaceIndent()

" XML, HTML et al
function! SetupMarkupLanguage()
    setlocal matchpairs+=<:>

    " Set `xmllint` as formatter for XML
    if &filetype == 'xml'
        setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
    endif
endfunction
autocmd FileType html,xml call SetupMarkupLanguage()

" Complement to TwoSpaceIdent()
function! FourSpaceIndent()
    setlocal expandtab
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
endfunction

function! SetupJSON()
    setlocal syntax=javascript
    setlocal equalprg=python\ -mjson.tool
endfunction
autocmd FileType json call SetupJSON()
autocmd BufNewFile,BufRead *.json setlocal filetype=json

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses.
let g:lisp_rainbow = 1

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

    " Open goto symbol on all buffers
    nmap <D-R> :CtrlPBufTagAll<cr>
    imap <D-R> <esc>:CtrlPBufTagAll<cr>
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
