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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required!
Bundle 'gmarik/vundle'

" Dependencies for Snipmate (sigh!)
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'

Bundle 'gregsexton/MatchTag'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'fs111/pydoc.vim'
Bundle 'ap/vim-css-color'
Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'AutoComplPop'
Bundle 'Shougo/neocomplcache'
Bundle 'ZoomWin'

if has("python")
	Bundle 'kevinw/pyflakes-vim'
	Bundle 'sjl/gundo.vim'
	Bundle 'sontek/rope-vim'
endif

if has("ruby")
	Bundle 'wincent/Command-T'
endif

" Plugin variables
let NERDCreateDefaultMappings=0              " Don't create default NERDCommenter keymappings
let NERDTreeIgnore=['\.pyc$']                " Browser skiplist
let NERDTreeMouseMode=1                      " Single click for everything
let g:pyflakes_use_quickfix=0                " Don't let pyflakes use the quickfix window
let g:CommandTMatchWindowAtTop=1
let g:acp_completeoptPreview=1
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
"let g:neocomplcache_enable_auto_select=1     " AutoComplPop behaviour

let g:netrw_hide=1
let g:netrw_list_hide='^\..*,\.pyc$'         " Comma separated list for hiding files

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'robokai'
Bundle 'tomasr/molokai'
Bundle 'wgibbs/vim-irblack'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'Diablo3'
Bundle 'lemon256'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'github-theme'

" +---------------------------------------------------------------------------+
" | Basic settings                                                            |
" +---------------------------------------------------------------------------+

filetype plugin indent on
syntax on

set t_Co=256		              " Enable 256 colors

" Used by the Solarized theme if the terminal isn't using Solarized colors
let g:solarized_termcolors=256

" To show original monokai background color
let g:molokai_original=1

set background=dark

if has("gui_running")
	"colorscheme solarized
	"colorscheme ir_black
	"colorscheme molokai
	"colorscheme robokai
	"colorscheme neverland
	"colorscheme neverland2
	"colorscheme diablo3
	"colorscheme railscasts
	colorscheme github

	" Installed manually:

	"colorscheme hunch-dark
	"colorscheme hunch-dark-dimmed
else
	colorscheme solarized
	"colorscheme ir_black
	"colorscheme molokai
	"colorscheme robokai
	"colorscheme neverland
	"colorscheme neverland2
	"colorscheme diablo3
	"colorscheme lemon256 " Requires Solarized terminal colors as well
	
	" Installed manually:

	"colorscheme tomorrow-night
	"colorscheme tomorrow-night-eighties
	"colorscheme lucius
endif

" Extended matching for the % command, good for HTML/XML tags
runtime macros/matchit.vim

" Improves redrawing
set ttyfast
set number                  " Show line numbers
set ruler                   " Show the cursor position all the time
set nobomb                  " Don't append a Byte-order Mark (BOM)
set encoding=utf-8
set title                   " Show title in console title bar
set mouse=a                 " Enable mouse in all modes
set clipboard=unnamed       " Enable copy/paste between vim and system clipboard

set shiftround              " Rounds indent to a multiple of shiftwidth
set nowrap                  " Don't wrap text
set linebreak               " Don't wrap text in the middle of a word
set showmatch               " Briefly jump to a paren once it's balanced
set matchpairs+=<:>         " Show matching <>
set cursorline              " Highlight cursor line
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set scrolloff=5             " Keep 5 context lines above and below the cursor

set laststatus=2            " Always show statusline
set statusline=\ [%l,%c\ %P]\ %m%f\ %r%h%w%=[%{strlen(&ft)?&ft:'none'},\ %{&encoding},\ %{&fileformat}]\ 

set listchars=tab:▸\ ,trail:.,eol:¬,precedes:<,extends:>

set hlsearch                " Highlight searches by default
set incsearch               " Shows search results as you type
set ignorecase              " Case insensitive search by default
set smartcase               " Case sensitive search if the search string contains uppercase
set gdefault                " Assume the /g flag when search and replacing
set suffixes+=.pyc,.pyo     " Don't autocomplete these filetypes

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

function! Tabstyle_tabs()
    set noexpandtab
endfunction

function! Tabstyle_spaces()
    set expandtab
endfunction

call Tabstyle_tabs()
"call Tabstyle_spaces()

" Set encryption for Vim to blowfish
if version >= 700
	set cryptmethod=blowfish
endif

" Tries to emulate tab behaviour for buffers
" Use :tab sball
" to open a new tab for every buffer
set switchbuf=usetab,newtab

" Directories for swp files
silent execute '!mkdir -p $HOME/.vim/backup'
set directory=$HOME/.vim/backup
set nobackup

" Tab completion
set wildmenu
set wildmode=full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.pyc,*.beam
set completeopt=menuone,longest,preview

" +---------------------------------------------------------------------------+
" | Remaps & Shortcuts                                                        |
" +---------------------------------------------------------------------------+

let mapleader = ","

" For fast typers ^^
command! W :w
command! Q :q

" For the times you forget to open files as root/sudo
" Command: :w!!
cmap w!! w !sudo tee % >/dev/null

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

" Go to previous file
map <Leader>p <C-^>

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

" Neocomplcache
" <CR>: close popup and save indent
inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.
autocmd VimEnter * inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Plugin key-mappings (SnipMate)
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Highlight problem lines: more than 80 chars, trailing spaces, only whitespace
" Toggle with <Leader>l
nnoremap <silent> <Leader>l
      \ :set nolist!<CR>:set nolist?<CR>
      \ :if exists('w:long_line_match') <Bar>
      \     silent! call matchdelete(w:long_line_match) <Bar>
      \     unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \     let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \     let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

" <Leader>m to convert markdown files to html and open them in the background.
" Use OS X's Print to PDF to export to PDF, or run this command:
" $ cupsfilter file.html -o file.pdf -o media=A4
function! MarkdownToHtml()
	execute ':w'
	let path = expand('%:p:h')
	let filepath = expand('%')
	let filename = expand('%:t:r')
	silent execute '!mkdir -p '.path.'/html/'
	execute '!pandoc -s --offline --html5 '.filepath.' -o '.path.'/html/'.filename.'.html'
	silent execute '!open -g '.path.'/html/'.filename.".html"
endfunction

autocmd FileType pandoc,markdown map <Leader>m :call MarkdownToHtml() <CR><CR>

" +---------------------------------------------------------------------------+
" | Auto commands                                                             |
" +---------------------------------------------------------------------------+

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

function! ColorColumn()
	set colorcolumn=+1
	highlight ColorColumn ctermbg=black ctermfg=white guibg=darkgrey guifg=white
endfunction

" Use pandoc syntax for markdown files
"autocmd BufRead,BufNewFile *.md set filetype=pandoc
autocmd FileType pandoc call ColorColumn()
autocmd FileType pandoc set wrap wrapmargin=2 textwidth=78

" Enable wrapping for txt files
"autocmd BufRead,BufNewFile *.txt call ColorColumn()
autocmd BufRead,BufNewFile *.txt set wrap wrapmargin=2 textwidth=78

" make files uses real tabs
autocmd FileType make set noexpandtab

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

" Outputs a small warning when opening a Python file that contains tab characters
function! WarnTabs()
    let save_cursor = getpos('.')
    if searchpos('\t') != [0,0]
        echohl WarningMsg |
        \ echo 'Warning, this file contains tabs.' |
        \ echohl None
    endif
    call setpos('.', save_cursor)
endfunction
autocmd BufReadPost *.py call WarnTabs()

" Enable omnicompletion, <C-X> <C-O> to omnicomplete
" These options are usually set by a filetype plugin
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType java setlocal omnifunc=javacomplete#Complete 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Enables :make to compile, or validate, certain filetypes
" (use :cn & :cp to jump between errors)
autocmd FileType xml,xslt compiler xmllint
autocmd FileType html compiler tidy
autocmd FileType java compiler javac

if has("python")
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
	autocmd FileType python map <Leader>m :RunPyBuffer<CR>

endif

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python setlocal expandtab tabstop=4 textwidth=79

" +---------------------------------------------------------------------------+
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" +---------------------------------------------------------------------------+

if has("gui")
	set guioptions-=m  " Remove menu bar
	set guioptions-=T  " Remove toolbar
endif

if has("gui_macvim")
    " Fullscreen takes up entire screen
	set fuoptions=maxhorz,maxvert

    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

	" MacVIM shift+arrow-keys behaviour (required in .vimrc)
	"let macvim_hig_shift_movement = 1

    " Command-][ to increase/decrease indentation
    vmap <D-]> >gv
    vmap <D-[> <gv
	
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
