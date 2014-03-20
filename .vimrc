" ┌──────────────────────────────────────────────────────────────────────┐
" │                                                                      │
" │                            Vim Settings                              │
" │                                                                      │
" │ Some highlights:                                                     │
" │   ,p = go to previous file                                           │
" │    K = look for help under cursor                                    │
" │                                                                      │
" │   ,i = toggle invisibles                                             │
" │   <F5> = toggle paste mode on/off                                    │
" │   <C-l> = clear search highlight                                     │
" │                                                                      │
" │   ,g = toggle Gundo off and on                                       │
" │   ,c = comment block/line                                            │
" │                                                                      │
" │   ,* = search and replace word under cursor                          │
" │                                                                      │
" │                                                                      │
" │ Put machine/user specific settings in ~/.vimrc.local                 │
" │                                                                      │
" └──────────────────────────────────────────────────────────────────────┘

" Plugins {{{
filetype off
set runtimepath+=$HOME/.vim/bundle/vundle/
silent! call vundle#rc()

Bundle 'gmarik/vundle'

" Unused but potentially cool/useful stuff {{{
"Bundle 'airblade/vim-gitgutter'
"Bundle 'bling/vim-bufferline
"Bundle 'godlygeek/tabular'
"Bundle 'jceb/vim-orgmode'
"Bundle 'junegunn/vim-emoji'
"Bundle 'junegunn/vim-scroll-position'
"Bundle 'mhinz/vim-startify'
"Bundle 'michaeljsmith/vim-indent-object'
"Bundle 'scrooloose/nerdtree'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'tpope/vim-commentary'
" }}}

Bundle 'gorodinskiy/vim-coloresque'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/csv.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'gregsexton/gitv'
Bundle 'junegunn/vim-easy-align'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'mileszs/ack.vim'
Bundle 'osyo-manga/vim-over'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'
Bundle 'wellle/targets.vim'

if has('python')
    if v:version > 703 || v:version == 703 && has('patch584')
        Bundle 'Valloric/YouCompleteMe'
    endif
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'jmcantrell/vim-virtualenv'
    Bundle 'sjl/gundo.vim'
endif

if has('ruby')
end

if has('lua')
    if v:version > 703 || v:version == 703 && has('patch885')
        " Bundle 'Shougo/neocomplete.vim'

        " Actually requires Python, but only used together with neocomplete
        " Bundle 'davidhalter/jedi-vim'
    endif
endif

" Filetype specific {{{
Bundle 'sheerun/vim-polyglot'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'moll/vim-node'
Bundle 'mxw/vim-jsx'
Bundle 'hail2u/vim-css3-syntax'
" Bundle 'othree/javascript-libraries-syntax.vim'
" }}}

" Color schemes {{{
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'Diablo3'
"Bundle 'jonathanfilip/vim-lucius'
Bundle 'chriskempson/base16-vim'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'w0ng/vim-hybrid'
"Bundle 'wombat256.vim'
"Bundle 'Pychimp/vim-luna'
" }}}

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
" let g:neocomplete#force_omni_input_patterns = {}
" let g:neocomplete#force_omni_input_patterns.python =
" \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
"
" " Cycle completions with Tab and Shift-Tab
" inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<Tab>"
" }}}

" Tern
let tern#is_show_argument_hints_enabled = 1

" Python syntax
let python_highlight_all = 1

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
" let g:airline#extensions#tabline#excludes = []

" Ctrl-P
let g:ctrlp_max_height = 15
if executable('ag')
      " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      let g:ackprg = 'ag'
      let g:ack_wildignore = 0
endif

" Gitv
let g:Gitv_OpenHorizontal = 'auto'

" Supertab
let g:SuperTabContextDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = 'context'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" let g:UltiSnipsSnippetDirectories = '~/.vim/bundle/vim-snippets/UltiSnips'

" HTML 5
let g:html5_aria_attributes_complete = 0     " Disable WAI-ARIA attribute support
let g:html5_rdfa_attributes_complete = 0     " Disable RDFa attribute support

" delimitMate
let g:delimitMate_expand_cr = 1              " Enable expansion of <CR>
let g:delimitMate_expand_space = 0           " Enable expansion of <Space>

" Solarized colorscheme
let g:solarized_termcolors = 256             " Use 256 colors in terminal (instead of 16)

" Sneak
let g:sneak#streak = 1

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_html_checkers = []
let g:syntastic_python_checkers = ['frosted', 'pep8']

" Virtualenv
let g:virtualenv_auto_activate = 1           " Automatically activate virtualenv if possible

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

syntax on

" Use the 256 color space instead of 16
set t_Co=256

" Make sure dark background is used for colorschemes
set background=dark

let g:airline_theme = 'badwolf'
let base16colorspace = 256

colorscheme base16-ocean
if has('gui_running')
    colorscheme base16-ocean
endif

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
set colorcolumn=+1

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

" Library folders
" set wildignore+=lib,libs

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

" <C-V><C-V> Paste clipboard content
inoremap <C-V><C-V> <c-o>"*P
" noremap <Leader>v "*p
" Clipboard
vnoremap <C-c> "*y"

" Toggle fold under cursor
noremap <Space> za

" Don't move on '*', useful when highlighting words
nnoremap * *<C-o>

" Search and replace the word under cursor
nnoremap <Leader>* :%s/\<<C-r><C-w>\>/

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Go to previous file
map <Leader>p <C-^>

" Toggle invisible characters
noremap <Leader>i :set list!<CR>

" Cycle between tabs
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

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

" Highlight lines with more than 80 chars (or 'textwidth')aas dasd sdfsdf sdf dsf fsdf
function! HighlightProblemLines()
    set nolist!
    set nolist?
    if exists('w:long_line_match')
        silent! call matchdelete(w:long_line_match)
        unlet w:long_line_match
    elseif &textwidth > 0
        let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1)
    else
        let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif
endfunction
nnoremap <silent> <Leader>l :call HighlightProblemLines()<CR>

" Toggle comments (TComment)
map <Leader>c :TComment<CR>

" Toggle Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Load the Gundo window
map <Leader>g :GundoToggle<CR>

" Search for tag within all open buffers
" nnoremap <C-P><C-P> :CtrlPBuffer<cr>
nmap <C-g> :CtrlPBufTagAll<CR>

" Looks up the symbol under the cursor and jumps to its definition if
" possible; if the definition is not accessible from the current translation
" unit, jumps to the symbol's declaration.
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Use vim-dispatch to build in the background (uses makeprg)
nnoremap <C-m> :Make!<CR>

" https://github.com/justinmk/vim-sneak#how-can-i-replace-f-with-sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

hi link SneakPluginTarget Search
hi link SneakPluginScope Search
hi link SneakStreakTarget Search
" hi SneakStreakMask guifg=03 guibg=03 ctermfg=03 ctermbg=03

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

" Sets the filetype when using ctrl-x + ctrl-e in bash
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

" Script templates

" Bash template
if filereadable(glob('$HOME/.vim/templates/tpl.sh'))
    autocmd BufNewFile *.sh so $HOME/.vim/templates/tpl.sh
endif

" Python template
if filereadable(glob('$HOME/.vim/templates/tpl.py'))
    autocmd BufNewFile *.py so $HOME/.vim/templates/tpl.py
endif

" Encrypted files
function! SetupEncryption()
    setlocal viminfo=
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal nobackup
    setlocal nowritebackup
    setlocal noshelltemp
    setlocal foldmethod=indent
    setlocal foldlevel=0
    setlocal foldclose=all
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
