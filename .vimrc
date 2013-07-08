" ┌──────────────────────────────────────────────────────────────────────────┐
" │                                                                          │
" │                            Vim Settings                                  │
" │                                                                          │
" │ Some highlights:                                                         │
" │   ,n = toggle NERDTree off and on                                        │
" │   ,g = toggle Gundo off and on                                           │
" │   ,c = comment block/line                                                │
" │                                                                          │
" │   ,p = go to previous file                                               │
" │    K = look for help under cursor                                        │
" │                                                                          │
" │   ,i = toggle invisibles                                                 │
" │   <F5> = toggle paste mode on/off                                        │
" │   ,<Space> = clear search highlight                                      │
" │                                                                          │
" │   ,* = search and replace word under cursor                              │
" │                                                                          │
" │                                                                          │
" │ Put machine/user specific settings in ~/.vimrc.local                     │
" │                                                                          │
" └──────────────────────────────────────────────────────────────────────────┘

" Vundle {{{
filetype off

set runtimepath+=$HOME/.vim/bundle/vundle/
silent! call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'airblade/vim-gitgutter'
Bundle 'ap/vim-css-color'
Bundle 'bling/vim-airline'
"Bundle 'godlygeek/tabular'
"Bundle 'gregsexton/gitv'
Bundle 'gregsexton/MatchTag'
"Bundle 'jceb/vim-orgmode'
Bundle 'kien/ctrlp.vim'
"Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
Bundle 'mattn/zencoding-vim'
"Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
"Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'

Bundle 'LustyJuggler'

if has('python')
	Bundle 'Valloric/YouCompleteMe'
	Bundle 'SirVer/ultisnips'
	" vim-snippets doesn't actually require Python, but depends on ultisnips
	" which does.
	"Bundle 'honza/vim-snippets'
	Bundle 'klen/python-mode'
	Bundle 'sjl/gundo.vim'
	Bundle 'davidhalter/jedi-vim'

	" Bundle 'Lokaltog/powerline'
	" set runtimepath+=$HOME/.vim/bundle/powerline/powerline/bindings/vim
else
	Bundle 'ervandew/supertab'
endif

" Filetype specific
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
"Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'guns/vim-clojure-static'
"Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'nginx.vim'

" }}}

" Plugin variables {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let NERDTreeIgnore = ['\.pyc$']              " Browser skiplist
let vimclojure#ParenRainbow = 1
let tern#is_show_argument_hints_enabled = 1
let g:airline_powerline_fonts = 1
" let g:EasyMotion_leader_key = '<Space>'
let g:EclimCompletionMethod = 'omnifunc'
let g:Gitv_OpenHorizontal = 'auto'
let g:SuperTabContextDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = 'context'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:html5_aria_attributes_complete = 0     " Disable WAI-ARIA attribute support
let g:html5_rdfa_attributes_complete = 0     " Disable RDFa attribute support
let g:jedi#popup_select_first = 0            " Don't auto-select the first hit
let g:jedi#popup_on_dot = 0
let g:delimitMate_expand_cr = 1              " Enable expansion of <CR>
let g:delimitMate_expand_space = 1           " Enable expansion of <Space>
let g:solarized_termcolors = 256             " Use 256 colors in terminal (instead of 16)
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 1
"let g:syntastic_html_checkers = ['validator']
let g:syntastic_html_checkers = []
let g:syntastic_python_checkers = ['flake8']
let g:use_zen_complete_tag = 1               " Complete tags using omnifunc
let g:ycm_register_as_syntastic_checker = 0  " Do not use YCM for syntax checks

let g:pymode_run = 0                         " Load run code plugin
let g:pymode_lint = 0                        " Disable pylint code plugin
let g:pymode_folding = 0                     " Disable python folding
let g:pymode_motion = 0                      " Disable python objects and motion
let g:pymode_breakpoint = 0                  " Disable breakpoints plugin
let g:pymode_utils_whitespaces = 0           " Disable autoremove unused whitespaces
let g:pymode_rope_vim_completion = 0         " Disable Rope's Vim completion
let g:pymode_rope_goto_def_newwin = 'new'    " Open goto definition in horizontal split

" Color schemes
Bundle 'altercation/vim-colors-solarized'
"Bundle 'robokai'
Bundle 'tomasr/molokai'
Bundle 'wgibbs/vim-irblack'
"Bundle 'trapd00r/neverland-vim-theme'
Bundle 'Diablo3'
"Bundle 'jpo/vim-railscasts-theme'
Bundle 'github-theme'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'noahfrederick/Hemisu'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/badwolf'
Bundle 'w0ng/vim-hybrid'
Bundle 'wombat256.vim'
Bundle 'mgutz/vim-colors'
Bundle 'Pychimp/vim-luna'
Bundle 'junegunn/seoul256.vim'
" }}}

" BASIC OPTIONS {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Put the cursor on a keyword and press 'K' to get information about it!

filetype plugin indent on

" Extended matching for the % command, good for HTML/XML tags
runtime macros/matchit.vim

syntax on
set t_Co=256
set background=dark

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

colorscheme Tomorrow-Night
if has('gui_running')
	colorscheme chance-of-storm
endif

"set exrc                      " Enables reading of .vimrc in the current directory
"set secure                    " Disable autocmd, shell and write commands in local .vimrc files
set encoding=utf-8 nobomb     " Use UTF-8 without BOM
set autoindent                " Copy the indent from the current line when
                              " starting a new line
set formatoptions+=n          " When formatting text, recognize numbered lists
"set formatoptions-=r          " Don't insert current comment leader after
                              " hitting <Enter> in Insert mode
"set cpoptions+=$              " When making a change, don't redisplay the line
                              " and instead put a '$' sign at the end of the
							  " changed text
set gdefault                  " :substitute flag 'g' is on by default
set hlsearch                  " Enable search highlighting
set ignorecase                " Ignore case in search patterns
set smartcase                 " Override the 'ignorecase' option if the search
                              " pattern contains uppercase characters
set incsearch                 " Highlight dynamically as a search pattern is
                              " being typed
set nowrap                    " Don't wrap lines
set linebreak                 " Wrap long lines at a character in 'breakat'
                              " rather than at the last character that fits
							  " on the screen
set listchars=tab:▸\          " ┐
set listchars+=trail:.        " │ Use custom symbols to
set listchars+=eol:¬          " │ represent invisible characters
set listchars+=precedes:❮     " │
set listchars+=extends:❯      " ┘
set showbreak=\ \ ↪           " Start character for wrapped lines
set backspace=2               " Allow backspace everywhere
"set clipboard=unnamed
"set cursorline                " Highlight the current line
set fillchars=stl:\           " ┐
set fillchars+=stlnc:\        " │ Characters to fill the statuslines
set fillchars+=diff:⣿         " │ and vertical separators.
set fillchars+=vert:│         " ┘
set laststatus=2              " Always show the status line
set noshowmode                " Hide the default mode text,
                              " (e.g. -- INSERT -- below the statusline).
							  " We have Powerline for this.
set shortmess=aAItW           " Avoid all the hit-enter prompts
set ttimeoutlen=50            " The time in milliseconds that is waited for a
                              " key code or mapped key sequence to complete.
set lazyredraw                " Don't redraw screen while executing macros,
                              " registers and other commands that have not
							  " been typed
set ttyfast                   " Enable fast terminal connection (more characters
                              " will be send to the screen for redrawing)
set matchpairs+=<:>           " Match HTML tags with the '%' command
set mouse=a                   " Enable mouse in all modes
set number                    " Show the line number
set pastetoggle=<F5>          " <F5> to toggle between 'paste' and 'nopaste' mode
set scrolloff=5               " When the page starts to scroll, keep the cursor
                              " 5 lines below the top and 5 lines above the
                              " bottom of the screen
set sidescroll=10             " The minimal number of columns to
                              " scroll horizontally
set report=0                  " Always report the number of lines changed
set showmatch                 " When a bracket is inserted, briefly jump
                              " to the matching one
set title                     " Set the title of the window to 'titlestring'
set shiftwidth=4              " ┐
set softtabstop=4             " │ Global <Tab> settings
set tabstop=4                 " ┘
set smarttab                  " A <Tab> in front of a line inserts blanks
                              " according to 'shiftwidth'. 'tabstop' or
							  " 'softtabstop' is used in other places
set shiftround                " Round indent to multiple of 'shiftwidth'
set noexpandtab               " Use tabs (not spaces)
"set expandtab                 " Use spaces (not tabs)
set directory=$HOME/.vim/swaps    " Directory for swap files
set backupdir=$HOME/.vim/backups  " Directory for backup files
set undodir=$HOME/.vim/undos      " Directory for undo files
set undofile                  " Automatically save undo history

set wildignore+=.svn,CVS,.git,.hg            " Version control
set wildignore+=*.aux,*.out                  " LaTeX intermediate files
set wildignore+=*.swp                        " Vim swap files
set wildignore+=*.o,*.obj,*.exe,*.dll        " Compiled object files
set wildignore+=*.pyc                        " Python byte code
set wildignore+=*.luac                       " Lua byte code
set wildignore+=*.beam                       " Compiled Erlang files
set wildignore+=*.class                      " Compiled Java files
set wildignore+=*.jpe?g,*.png,*.gif,*.bmp    " Images
set wildignore+=*.ico
set wildignore+=env,node_modules             " Virtualenv and Node.js folders
set wildignore+=lib,libs                     " Library folders
set wildignore+=*.DS_Store                   " OS X files
set wildmenu                                 " Enable command-line completion in an enhanced
                                             " mode (by hitting <TAB> in command mode, it will
                                             " show the possible matches just above the command
                                             " line with the first match highlighted)
set wildmode=list:longest,list:full          " When more than one match, list all matches and
                                             " complete till longest common string.
set completeopt=menuone,preview              " Show popup when there's one or more matches
if version >= 703
	set cryptmethod=blowfish
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

call LongLines1()

set statusline=%1*\ [%n]\ [%f]%m%r%h%w%y[%{&ff}:%{strlen(&fenc)?&fenc:'none'}]%=%(\ %c,%l/%L\ %)%P
"               │     │     │  │ │ │ │ │    │                │                 │     │ │   │    │
"               │     │     │  │ │ │ │ │    │                │                 │     │ │   │    └─ percent through file
"               │     │     │  │ │ │ │ │    │                │                 │     │ │   └─ total number of lines
"               │     │     │  │ │ │ │ │    │                │                 │     │ └─ current line number
"               │     │     │  │ │ │ │ │    │                │                 │     └─ current column number
"               │     │     │  │ │ │ │ │    │                │                 └─ left/right separator
"               │     │     │  │ │ │ │ │    │                └─ file encoding
"               │     │     │  │ │ │ │ │    └─ file format
"               │     │     │  │ │ │ │ └─ file type
"               │     │     │  │ │ │ └─ preview window flag
"               │     │     │  │ │ └─ help file flag
"               │     │     │  │ └─ readonly flag
"               │     │     │  └─ modified flag
"               │     │     └─ path to the file
"               │     └─ buffer number
"               └─ User1 highlight

" }}}

" MAPPINGS {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use a different mapleader (default is '\')
let mapleader = ','

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

" Don't move on *
nnoremap * *<C-o>

" Search and replace the word under cursor
nnoremap <Leader>* :%s/\<<C-r><C-w>\>/

" <Leader><Space> to clear search highlight
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

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

" }}}

" AUTO COMMANDS {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Only show cursorline in the current window and in normal mode
augroup cline
"	autocmd!
"	autocmd WinLeave * set nocursorline
"	autocmd WinEnter * set cursorline
"	autocmd InsertEnter * set nocursorline
"	autocmd InsertLeave * set cursorline
augroup END

" Only show colorcolumn in the current window
augroup ccol
"	autocmd!
"	autocmd WinLeave * setlocal colorcolumn=0
"	autocmd WinEnter * setlocal colorcolumn=+1
augroup END

" Don't show trailing whitespaces in insert mode
augroup trailing
	autocmd!
	autocmd InsertEnter * :set listchars-=trail:⌴
	autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

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

" Helps if you have to use another editor on the same file
autocmd FileChangedShell *
	\ echohl WarningMsg |
	\ echo 'File has been changed outside of Vim.' |
	\ echohl None

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
	set viminfo=
	setlocal bufhidden=wipe
	setlocal noswapfile
	setlocal nobackup
	setlocal nowritebackup
	setlocal foldmethod=indent
	setlocal foldlevel=0
	setlocal foldclose=all
	" Move cursor over word and press 'e' to [un]obfuscate it
	noremap e g?iw
endfunction
autocmd BufReadPre,BufRead * if strlen(&key) | call SetupEncryption() | endif

" Markdown
function! SetupMarkdown()
	setlocal wrap
	setlocal wrapmargin=2
	setlocal textwidth=79
	" Autowrap text based on 'textwidth'
	setlocal formatoptions+=t                " Autowrap text based on 'textwidth'
endfunction
autocmd FileType markdown call SetupMarkdown()

" Plain text
function! SetupPlainText()
	setlocal wrap
	setlocal wrapmargin=2
	setlocal textwidth=79
	" Autowrap text based on 'textwidth'
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
	setlocal textwidth=79
	" Don't autowrap text based on 'textwidth'
	setlocal formatoptions-=t
endfunction
autocmd FileType python call SetupPython()

" Ruby
function! SetupRuby()
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction
autocmd FileType ruby call SetupRuby()

" JSON, LESS, CSS and Jade
function! TwoSpaceIndent()
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction
autocmd FileType json,less,css,jade call TwoSpaceIndent()

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses.
let g:lisp_rainbow = 1

" Enable rainbow_parentheses for Clojure files
autocmd FileType clojure RainbowParenthesesToggle

" Nginx config files
autocmd BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx
autocmd BufRead,BufNewFile /etc/nginx/sites-available/* set ft=nginx
autocmd BufRead,BufNewFile /etc/nginx/sites-enabled/* set ft=nginx

" Automatically compile LESS files on save
"autocmd BufWritePost *.less !lessc % > $(echo % | sed 's/\.less$/\.css/')

" Treat .json files as JavaScript
autocmd BufNewFile,BufRead *.json setlocal ft=json syntax=javascript
autocmd FileType json setlocal syntax=javascript

" Set `python -mjson.tool` as formatter for JSON
autocmd FileType json setlocal equalprg=python\ -mjson.tool

" Set `xmllint` as formatter for XML
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Warn if there's tabs in space indenting languages
function! WarnTabs()
	let save_cursor = getpos('.')
	if searchpos('\t') != [0,0]
		echohl WarningMsg |
		\ echo 'Warning, this file contains tabs.' |
		\ echohl None
	endif
	call setpos('.', save_cursor)
endfunction
autocmd BufReadPost *.{py,rb} call WarnTabs()

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
