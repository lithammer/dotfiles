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

" Vundle {{{
filetype off
set runtimepath+=$HOME/.vim/bundle/vundle/
silent! call vundle#rc()

Bundle 'gmarik/vundle'

" Bundle 'airblade/vim-gitgutter'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'bling/vim-airline'
" Bundle 'bling/vim-bufferline
Bundle 'chrisbra/csv.vim'
" Bundle 'godlygeek/tabular'
" Bundle 'gregsexton/gitv'
Bundle 'gregsexton/MatchTag'
" Bundle 'jceb/vim-orgmode'
Bundle 'junegunn/vim-easy-align'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
Bundle 'mattn/emmet-vim'
" Bundle 'mhinz/vim-startify'
Bundle 'mhinz/vim-signify'
" Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mileszs/ack.vim'
Bundle 'osyo-manga/vim-over'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
" Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
" Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
" Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'

if has('python')
    if v:version > 703 || v:version == 703 && has('patch584')
        Bundle 'Valloric/YouCompleteMe'
    endif
    Bundle 'SirVer/ultisnips'
    " vim-snippets doesn't actually require Python, but depends
    " on ultisnips which does.
    "Bundle 'honza/vim-snippets'
    Bundle 'jmcantrell/vim-virtualenv'
    Bundle 'sjl/gundo.vim'
else
    Bundle 'ervandew/supertab'
endif

if has('ruby')
    " Bundle 'sjbach/lusty'
end

if has('lua')
    if v:version > 703 || v:version == 703 && has('patch885')
        " Bundle 'Shougo/neocomplete.vim'
    endif
endif

" Filetype specific

Bundle 'c9s/vimomni.vim'
Bundle 'hdima/python-syntax'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jimenezrick/vimerl'
Bundle 'moll/vim-node'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'
Bundle 'guns/vim-clojure-static'
" Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'nginx.vim'

" Web (CSS, JS, ...)
Bundle 'groenewege/vim-less'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
" vim-jsx depends on 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'othree/javascript-libraries-syntax.vim'

" }}}

" Plugin variables {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let tern#is_show_argument_hints_enabled = 1
let python_highlight_all = 1
" https://github.com/chriskempson/base16-vim#256-colorspace
let base16colorspace = 256
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:ctrlp_cmd = 'CtrlPLastMode'            " Open CtrlP in last mode used
let g:EclimCompletionMethod = 'omnifunc'
let g:Gitv_OpenHorizontal = 'auto'
let g:SuperTabContextDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = 'context'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" let g:UltiSnipsSnippetDirectories = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:html5_aria_attributes_complete = 0     " Disable WAI-ARIA attribute support
let g:html5_rdfa_attributes_complete = 0     " Disable RDFa attribute support
let g:delimitMate_expand_cr = 1              " Enable expansion of <CR>
let g:delimitMate_expand_space = 0           " Enable expansion of <Space>
let g:solarized_termcolors = 256             " Use 256 colors in terminal (instead of 16)
let g:sneak#streak = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_html_checkers = ['validator']
let g:syntastic_html_checkers = []
let g:syntastic_python_checkers = ['frosted', 'pep8']
let g:virtualenv_auto_activate = 1           " Automatically activate virtualenv if possible
let g:netrw_liststyle = 3                    " Tree style file listing

" Replace Vim's search and replace with vim-over
" cabbrev %s OverCommandLine<cr>%s
" cabbrev '<,'>s OverCommandLine<cr>'<,'>s'>>'

" Color schemes
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'baskerville/bubblegum'
" Bundle 'tomasr/molokai'
" Bundle 'wgibbs/vim-irblack'
" Bundle 'Diablo3'
" Bundle 'jpo/vim-railscasts-theme'
" Bundle 'github-theme'
" Bundle 'jonathanfilip/vim-lucius'
Bundle 'chriskempson/base16-vim'
Bundle 'chriskempson/vim-tomorrow-theme'
" Bundle 'noahfrederick/Hemisu'
Bundle 'nanotech/jellybeans.vim'
" Bundle 'sjl/badwolf'
Bundle 'w0ng/vim-hybrid'
" Bundle 'wombat256.vim'
" Bundle 'Pychimp/vim-luna'
" }}}

" BASIC OPTIONS {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

filetype plugin indent on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

syntax on
set t_Co=256
set background=dark

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
let g:airline_theme = 'base16'
if has('gui_running')
    colorscheme base16-ocean
endif

set autowrite
set autoread
" set exrc
" set secure
set encoding=utf-8 nobomb
set autoindent
set formatoptions+=n
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j
endif

set expandtab
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" set cpoptions+=$
" set cursorline
set backspace=2
set completeopt=menuone,preview
set cryptmethod=blowfish
set display+=lastline
set fillchars="vert:|,fold:"
set gdefault
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set mouse=a
set noshowmode
set nowrap
set nrformats="hex"
set number
set pastetoggle=<F5>
set relativenumber
set report=0
set scrolloff=5
set showbreak=\ \ ↪
set showmatch
set sidescroll=10
set smartcase
set title
set ttimeout
set ttimeoutlen=50
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

set wildmenu
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
set wildignore+=lib,libs

" OS files
set wildignore+=*.DS_Store

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
        let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
    endif
endif

" }}}

" HIGHLIGHT {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Terminal types:
"
"   1) term (normal terminals, e.g.: vt100, xterm)
"   2) cterm (color terminals, e.g.: MS-DOS console, color-xterm)
"   3) gui (GUIs)

highlight ColorColumn                              ctermbg=239
highlight LineNr      cterm=NONE  ctermfg=DarkGrey ctermbg=NONE
highlight User1       cterm=bold  ctermfg=Grey     ctermbg=237

" Adds a red background for characters beyond 81
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns/235970#235970
function! LongLines1()
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
endfunction

" Adds a grey background on column 80+
" http://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
function! LongLines2()
    let &colorcolumn=join(range(81,999), ',')
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    " let &colorcolumn='80,'.join(range(120,999), ',')
endfunction

" }}}

" MAPPINGS {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use a different mapleader (default is '\')
let mapleader = ','

" My fingers are too fast!
command W w
command Q q

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

" Toggle fold
noremap <space> za

" Don't move on *
nnoremap * *<C-o>

" Search and replace the word under cursor
nnoremap <Leader>* :%s/\<<C-r><C-w>\>/

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Go to previous file
map <Leader>p <C-^>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Toggle invisible characters
noremap <Leader>i :set list!<CR>

" This mapping makes Ctrl-Tab switch between tabs.
" Ctrl-Shift-Tab goes the other way.
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

" Highlight problem lines: more than 80 chars, trailing spaces, only whitespace
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

" Toggle NERDTree on/off
noremap <Leader>n :NERDTreeToggle<CR>

" Toggle comments (TComment)
map <Leader>c :TComment<CR>

" Toggle Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Load the Gundo window
map <Leader>g :GundoToggle<CR>

" Search for tag within all open buffers
nmap <C-g> :CtrlPBufTagAll<CR>
imap <C-g> <Esc>:CtrlPBufTagAll<CR>

" Looks up the symbol under the cursor and jumps to its definition if
" possible; if the definition is not accessible from the current translation
" unit, jumps to the symbol's declaration.
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}

" AUTO COMMANDS {{{
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
if (&colorcolumn)
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

" FILETYPE SETTINGS {{{
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

" Nginx config files
autocmd BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx
autocmd BufRead,BufNewFile /etc/nginx/sites-available/* set ft=nginx
autocmd BufRead,BufNewFile /etc/nginx/sites-enabled/* set ft=nginx

" }}}

" OS SPECIFIC {{{
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
" --vim: set foldenable foldmethod=marker foldlevel=0:
" }}}
