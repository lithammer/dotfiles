filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set nobomb

let mapleader = ","

set number
set ruler
syntax on

" Set encoding (set fileencoding=utf-8)
set encoding=utf-8
"scriptencoding utf-8

" Line wrapping
set nowrap
set linebreak

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Whitespace stuff (tip, :retab)
set listchars=tab:▸\ ,trail:.,eol:¬
"highlight SpecialKey ctermfg=DarkGray " nbsp, tab and trail
"highlight NonText ctermfg=DarkGray " eol, extends and precedes
noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Fast switching between paste modes
set pastetoggle=<Leader>v

" For fast typers ^^
command W w
command Q q

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" ,<Space> to get rid of seach highlight
nnoremap <Leader><Space> :nohl<CR>

" Indentation stuff
set autoindent
"set smartindent " Not really that smart

" Cursor highlights
set cursorline
"highlight CursorLine guibg=#333333
"set cursorcolumn
"highlight CursorColumn guibg=#333333

" Status bar
set laststatus=2
set statusline=\ [%l,%c\ %P]\ %m%f\ %r%h%w
set statusline+=%=
set statusline+=[%{strlen(&ft)?&ft:'none'}, " Filetype
set statusline+=\ %{&encoding},             " Encoding
"set statusline+=\ %{&fileencoding},        " File encoding
set statusline+=\ %{&fileformat}]\          " File format

" +---------------------------------------------------------------------------+
" | Tabs and spaces                                                           |
" +---------------------------------------------------------------------------+

" When at 3 spaces, and i hit > ... go to 4, not 5
set shiftround

function! Tabstyle_tabs()
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set noexpandtab
endfunction

function! Tabstyle_spaces(num)
    set shiftwidth=a:num
    set tabstop=a:num
    set softtabstop=a:num
    set expandtab
endfunction

call Tabstyle_tabs()
"call Tabstyle_spaces(4)
"call Tabstyle_spaces(2)

" +---------------------------------------------------------------------------+
" | Auto commands                                                             |
" +---------------------------------------------------------------------------+

function s:setupWrapping()
    set wrap
    set wrapmargin=2
    set textwidth=72
endfunction

function s:setupMarkup()
    call s:setupWrapping()
    map <buffer> <Leader>p :Mm <CR>
endfunction

" make files uses real tabs
autocmd FileType make set noexpandtab

" Display osql as sql
autocmd BufRead,BufNewFile *.osql set filetype=sql

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" Enable wrapping for txt files
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set tabstop=4 textwidth=79

" Enable omnicompletion, <C-X> <C-O> to omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn
set wildchar=<TAB>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Default color scheme
set t_Co=256
set background=dark				" Needed for solarized to enable dark theme
let g:solarized_termcolors=256	" Also needed for solarized theme
"colorscheme ir_black
colorscheme solarized
"colorscheme molokai

" Create directory if it doesn't exit
silent execute '!mkdir -p $HOME/.vim/backup'

" Directories for swp files
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
	"let macvim_hig_shift_movement = 1
endif

" Enable mouse usage (all modes)
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" Automatically write a file when leaving a modified buffer
"set autowrite

" Spell checking on
"set spell

" Enables copy/pasting between vim and system clipboard
set clipboard=unnamed

" Tries to emulate tab behavior for buffers
" Use :tab sball
" to open a new tab for every buffer
set switchbuf=usetab,newtab

" This uses the handy preview window feature of Vim. Flagging a window
" as a preview window is useful because you can use pclose! to get rid of it,
" meaning you can reuse that vim real estate over and over for commands
" that produce output, and the output has to go somewhere.
function! DoRunPyBuffer2()
	pclose! " force preview window closed
	setlocal ft=python

	" copy the buffer into a new window, then run that buffer through python
	sil %y a | below new | sil put a | sil %!python -
	" indicate the output window as the current previewwindow
	setlocal previewwindow ro nomodifiable nomodified

	" back into the original window
	winc p
endfunction

command! RunPyBuffer call DoRunPyBuffer2()
map <Leader>m :RunPyBuffer<CR>

" +---------------------------------------------------------------------------+
" | Plug-ins                                                                  |
" +---------------------------------------------------------------------------+

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

" NERD Commenter
let NERDCreateDefaultMappings=0 " I turn this off to make it simple

" Toggle commenting on 1 line or all selected lines. Wether to comment or not
" is decided based on the first line; if it's not commented then all lines
" will be commented
map <Leader>c :call NERDComment(0, "toggle")<CR>

" ZoomWin
map <Leader>z <C-w>o<CR>
