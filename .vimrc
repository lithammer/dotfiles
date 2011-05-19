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
" |   ,j = go to definition (using Rope)                                      |
" |   ,r = rename (using Rope)                                                |
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

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Original Github repos
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
"Bundle 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings=0
Bundle 'scrooloose/nerdtree'
let NERDTreeHijackNetrw=1			" User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1				" Single click for everything
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
Bundle 'msanders/snipmate.vim' 
Bundle 'tomtom/tcomment_vim'
Bundle 'fs111/pydoc.vim'
Bundle 'sontek/rope-vim'
Bundle 'kevinw/pyflakes-vim'

" vim-scripts repos
Bundle 'ZoomWin'
"Bundle 'Pydiction'
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" Non-Github repos
Bundle 'git://git.wincent.com/command-t.git'
let g:CommandTMatchWindowAtTop=1

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'robokai'
Bundle 'tomasr/molokai'
Bundle 'wgibbs/vim-irblack'
Bundle 'trapd00r/neverland-vim-theme'

" +---------------------------------------------------------------------------+
" | Shortcuts                                                                 |
" +---------------------------------------------------------------------------+

let mapleader = ","

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
	execute "!markdown2pdf --xetex ".filepath." -o ".path."/pdf/".@%
	silent execute "!open ".path."/pdf/".expand('%:t:r').".pdf"
endfunction
autocmd FileType markdown map <Leader>m :call MarkdownToPdf() <CR><CR> 

" Go to previous file
map <Leader>p <C-^>

" Maps autocomplete to tab
imap <Tab> <C-N>

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

" NERDCommenter
"map <Leader>c :call NERDComment(0, "toggle")<CR>

" tComment
nnoremap <Leader>c :TComment<CR>
vnoremap <Leader>c :TComment<CR>

" ZoomWin
map <Leader>z <C-w>o<CR>

" CommandT
map <Leader>f :CommandT<CR>

" Rope
map <Leader>j :RopeGotoDefinition<CR>
map <Leader>r :RopeRename<CR>

" +---------------------------------------------------------------------------+
" | Basic settings                                                            |
" +---------------------------------------------------------------------------+

filetype plugin indent on
syntax on

set t_Co=256		" Enable 256 colors

colorscheme solarized
"colorscheme ir_black
"colorscheme molokai
"colorscheme robokai
"colorscheme neverland

set background=dark	" Set background to `dark`, mostly because of Solarized

" Used by the Solarized theme if the terminal isn't using Solarized colors
"let g:solarized_termcolors=256

" To show original monokai background color
let g:molokai_original=1

set number
set ruler
set nobomb " BOM sucks
set encoding=utf-8

" Line wrapping
set nowrap
set linebreak

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Whitespace stuff (tip, :retab)
set listchars=tab:▸\ ,trail:.,eol:¬

" Show matching <> (html mainly) as well
set matchpairs+=<:>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" Highlight cursor line
set cursorline

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

" Enables copy/pasting between vim and system clipboard
set clipboard=unnamed

" Tries to emulate tab behavior for buffers
" Use :tab sball
" to open a new tab for every buffer
set switchbuf=usetab,newtab

" Directories for swp files
silent execute '!mkdir -p $HOME/.vim/backup'
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn
"set wildchar=<Tab>

set completeopt=menuone,longest,preview

" +---------------------------------------------------------------------------+
" | Tabs and spaces                                                           |
" +---------------------------------------------------------------------------+

" Rounds indent to a multiple of shiftwidth
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

" Sets path to directory buffer was loaded from.
" Doesn't go well together with the CommandT plugin
"autocmd BufEnter * lcd %:p:h 

" Enable omnicompletion, <C-X> <C-O> to omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

" +---------------------------------------------------------------------------+
" | Python                                                                    |
" +---------------------------------------------------------------------------+

" This uses the handy preview window feature of Vim. Flagging a window
" as a preview window is useful because you can use pclose! to get rid of it,
" meaning you can reuse that vim real estate over and over for commands
" that produce output, and the output has to go somewhere.
function! DoRunPyBuffer2()
	pclose! " force preview window closed
	setlocal ft=python

	" copy the buffer into a new window, then run that buffer through python
	silent %y a | below new | silent put a | silent %!python -
	" indicate the output window as the current previewwindow
	setlocal previewwindow ro nomodifiable nomodified

	" back into the original window
	winc p
endfunction

command! RunPyBuffer call DoRunPyBuffer2()
map <Leader>m :RunPyBuffer<CR>

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set tabstop=4 textwidth=79

autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" turn of hlsearch and update pyflakes on enter
au BufRead,BufNewFile *.py nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>
nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>

" clear the search buffer when hitting return and update pyflakes checks
function! PressedEnter()
    :nohlsearch
    if &filetype == 'python'
        :PyflakesUpdate
    end
endfunction

" +---------------------------------------------------------------------------+
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" +---------------------------------------------------------------------------+

" Mac
if has("mac") 
  "" 
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
if has("gui_macvim")
	"let macvim_hig_shift_movement = 1
endif
 
" Windows
if has("gui_win32")
  "" 
endif

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

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
