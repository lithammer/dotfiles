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
" |   ,s = search and replace word under cursor                               |
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
Bundle 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings=0
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$']
let g:netrw_hide=1
let g:netrw_list_hide='^\..*,\.pyc$'
let NERDTreeMouseMode=1				" Single click for everything
Bundle 'fs111/pydoc.vim'
Bundle 'sontek/rope-vim'
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0
Bundle 'sjl/gundo.vim'
Bundle 'wincent/Command-T'
let g:CommandTMatchWindowAtTop=1
Bundle 'ap/vim-css-color'

" Required dependencies for Snipmate (sigh)
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

Bundle 'garbas/vim-snipmate'

" vim-scripts repos
Bundle 'AutoComplPop'
let g:acp_completeoptPreview=1
Bundle 'ZoomWin'

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

" Search and replace the word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

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

" <Leader>m to compile open markdown file to PDF using markdown2pdf and puts
" it in a `pdf` subfolder and opens Preview (OS X only)
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
map <Leader>c :call NERDComment(0, "toggle")<CR>

" ZoomWin
map <Leader>z <C-w>o<CR>

" CommandT
map <Leader>f :CommandT<CR>

" Rope
map <Leader>j :RopeGotoDefinition<CR>
map <Leader>r :RopeRename<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" +---------------------------------------------------------------------------+
" | Basic settings                                                            |
" +---------------------------------------------------------------------------+

filetype plugin indent on
syntax on

set t_Co=256		" Enable 256 colors

" Used by the Solarized theme if the terminal isn't using Solarized colors
let g:solarized_termcolors=256

" To show original monokai background color
let g:molokai_original=1

set background=dark	" Set background to `dark`, mostly because of Solarized

colorscheme solarized
"colorscheme ir_black
"colorscheme molokai
"colorscheme robokai
"colorscheme neverland
"colorscheme neverland2

set number
set ruler
set nobomb " BOM sucks
set encoding=utf-8

" Improves redrawing for newer computers
set ttyfast

" Line wrapping
set nowrap
set linebreak

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Whitespace stuff (tip, :retab)
set listchars=tab:▸\ ,trail:.,eol:¬,precedes:<,extends:>

" Highlight problem lines: more than 80 chars, trailing spaces, only whitespace
" Toggle with \l
nnoremap <silent> <Leader>l
      \ :set nolist!<CR>:set nolist?<CR>
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

" Show matching <> (html mainly) as well
set matchpairs+=<:>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" Let cursor move past the last char in <C-v> mode
set virtualedit=block

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
set directory=$HOME/.vim/backup
set nobackup
set writebackup

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.pyc
set wildchar=<Tab>
" Don't autocomplete these filetypes
set suffixes+=.pyc,.pyo 
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
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
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

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\     execute "normal g`\"" |
	\ endif

" Helps if you have to use another editor on the same file
autocmd FileChangedShell *
    \ echohl WarningMsg |
    \ echo 'File has been changed outside of vim.' |
    \ echohl None

" Outputs a small warning when opening a file that contains tab characters
function! WarnTabs()
    let save_cursor = getpos('.')
    if searchpos('\t') != [0,0]
        echohl WarningMsg |
        \ echo "Warning, this file contains tabs." |
        \ echohl None
    endif
    call setpos('.', save_cursor)
endfunction
autocmd BufReadPost * call WarnTabs()

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Enable omnicompletion, <C-X> <C-O> to omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Enables :make to compile, or validate, certain filetypes
" (use :cn & :cp to jump between errors)
autocmd FileType xml,xslt compiler xmllint
autocmd FileType html compiler tidy
autocmd FileType java compiler javac

if has('python')
" Add PYTHONPATH to Vim path to enable 'gf'
    python << EOL
import vim, os, sys
for p in sys.path:
	if os.path.isdir(p):
		vim.command(r'set path+=%s' % (p.replace(' ', r'\ ')))
EOL

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

endif

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set tabstop=4 textwidth=79

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
" |                               Host specific                               |
" +---------------------------------------------------------------------------+
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
