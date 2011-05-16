" +---------------------------------------------------------------------------+
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |   ,c = comment block/line with NERDComment                                |
" |                                                                           |
" |   ,f = CommandT shortcut                                                  |
" |   ,z = maximize (ZoomWin) current split window                            |
" |   ,p = go to previous file                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |   ,v = toggle paste mode on/off                                           |
" |   ,<Space> = clear search highlight                                       |
" |                                                                           |
" |   ,m = compile markdown file to PDF                                       |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces(2) = set tab to 2 spaces                          |
" |                                                                           |
" |                                                                           |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" +---------------------------------------------------------------------------+


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Original Github repos
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'tomtom/tcomment_vim'

" vim-scripts repos
Bundle 'ZoomWin'
Bundle 'Pydiction'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" Non-Github repos
Bundle 'git://git.wincent.com/command-t.git'

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'robokai'
Bundle 'tomasr/molokai'
Bundle 'wgibbs/vim-irblack'

filetype plugin indent on

" Default color scheme
set t_Co=256
set background=dark

" Used by the Solarized theme if the terminal isn't using Solarized colors
"let g:solarized_termcolors=256

" To show original monokai background color
"let g:molokai_original=1

colorscheme solarized
"colorscheme ir_black
"colorscheme molokai
"colorscheme robokai

" BOM (Byte Order Mark) is only good in theory
set nobomb

let mapleader = ","

" +---------------------------------------------------------------------------+
" | Key-binds                                                                 |
" +---------------------------------------------------------------------------+

" For fast typers ^^
command W w
command Q q

" Toggle invisible characters
noremap <Leader>i :set list!<CR>

" Fast switching between paste modes
set pastetoggle=<Leader>v

" ,<Space> to clear search highlight
nnoremap <Leader><Space> :nohl<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" <Leader>m to compile open markdown file to PDF using markdown2pdf and puts
" it in a pdf/ subfolder and opens Preview
function! MarkdownToPdf()
	execute ":w"
	let path = expand('%:p:h')
	let filepath = expand('%')
	silent execute "!mkdir -p ".path."/pdf/"
	execute "!markdown2pdf ".filepath." -o ".path."/pdf/".@%
	silent execute "!open ".path."/pdf/".expand('%:t:r').".pdf"
endfunction
autocmd FileType markdown map <Leader>m :call MarkdownToPdf() <CR><CR> 

" Go to previous file
map <Leader>p <C-^>

" Maps autocomplete to tab
imap <Tab> <C-N>

" +---------------------------------------------------------------------------+
" | Misc                                                                      |
" +---------------------------------------------------------------------------+

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
set scrolloff=5

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Whitespace stuff (tip, :retab)
set listchars=tab:▸\ ,trail:.,eol:¬
"highlight SpecialKey ctermfg=DarkGrey " nbsp, tab and trail
"highlight NonText ctermfg=DarkGrey " eol, extends and precedes

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

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

" Create directory if it doesn't exit
silent execute '!mkdir -p $HOME/.vim/backup'

" Directories for swp files
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

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
	set colorcolumn=+1
	highlight ColorColumn ctermbg=black ctermfg=white guibg=darkgrey guifg=white
	set list
    map <buffer> <Leader>p :Hammer <CR>
endfunction

" make files uses real tabs
autocmd FileType make set noexpandtab

" Display osql as sql
autocmd BufRead,BufNewFile *.osql set filetype=sql

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable wrapping for txt files
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set tabstop=4 textwidth=79

" Sets path to directory buffer was loaded from.
" Doesn't go well together with the CommandT plugin
"autocmd BufEnter * lcd %:p:h 

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
set wildchar=<Tab>

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
"map <Leader>c :call NERDComment(0, "toggle")<CR>

" tComment
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

" ZoomWin
map <Leader>z <C-w>o<CR>

" CommandT
let g:CommandTMatchWindowAtTop=1
map <Leader>f :CommandT<CR>

" +---------------------------------------------------------------------------+
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" +---------------------------------------------------------------------------+

" Mac *************************************************************************
if has("mac") 
  "" 
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
	"let macvim_hig_shift_movement = 1
endif
 
" Windows *********************************************************************
if has("gui_win32")
  "" 
endif



" +---------------------------------------------------------------------------+
" |                               Startup                                     |
" +---------------------------------------------------------------------------+ 
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 



" +---------------------------------------------------------------------------+ 
" |                               Host specific                               |
" +---------------------------------------------------------------------------+
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
