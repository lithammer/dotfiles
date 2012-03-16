" +---------------------------------------------------------------------------+
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |   ,c = comment block/line with NERDComment                                |
" |                                                                           |
" |   ,f = CommandT shortcut                                                  |
" |   ,p = go to previous file                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |   ,v = toggle paste mode on/off                                           |
" |   ,<Space> = clear search highlight                                       |
" |                                                                           |
" |   ,m = compile markdown file to HTML                                      |
" |                                                                           |
" |   ,s = search and replace word under cursor                               |
" |                                                                           |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" +---------------------------------------------------------------------------+

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
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ap/vim-css-color'
"Bundle 'AutoComplPop'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'

" Syntax / language plugins
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'fs111/pydoc.vim'
"Bundle 'hallettj/jslint.vim'

if has("python")
	Bundle 'nvie/vim-flake8'
	Bundle 'kevinw/pyflakes-vim'
endif

" Plugin variables
let NERDCreateDefaultMappings=0              " Don't create default NERDCommenter keymappings
let NERDTreeIgnore=['\.pyc$']                " Browser skiplist
let NERDTreeMouseMode=1                      " Single click for everything
let g:pyflakes_use_quickfix=0                " Don't let pyflakes use the quickfix window
let g:CommandTMatchWindowAtTop=1
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:Powerline_symbols = 'fancy'            " Custom font tokens

let g:netrw_hide=1
let g:netrw_list_hide='^\..*,\.pyc$'         " Comma separated list for hiding files

let $JS_CMD='node'                           " Hack for jslint to find interpreter

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'robokai'
Bundle 'tomasr/molokai'
Bundle 'wgibbs/vim-irblack'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'Diablo3'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'github-theme'
Bundle 'Lucius'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'noahfrederick/Hemisu'

" +---------------------------------------------------------------------------+
" | Basic settings                                                            |
" +---------------------------------------------------------------------------+

filetype plugin indent on

syntax on
" Enable 256 colors
set t_Co=256

" Used by the Solarized theme if the terminal isn't using Solarized colors
let g:solarized_termcolors=256

" To show original monokai background color
let g:molokai_original=1

set background=dark

if has("gui_running")
	"colorscheme diablo3
	colorscheme github
	"colorscheme ir_black
	"colorscheme molokai
	"colorscheme neverland
	"colorscheme neverland2
	"colorscheme railscasts
	"colorscheme robokai
	"colorscheme solarized
	"colorscheme hemisu
	"colorscheme Tomorrow-Night
	"colorscheme Tomorrow-Night-Bright
	"colorscheme Tomorrow-Night-Eighties

	" Installed manually:

	"colorscheme hunch-dark
	"colorscheme hunch-dark-dimmed
else
	"colorscheme diablo3
	"colorscheme ir_black
	"colorscheme lucius
	"colorscheme molokai
	"colorscheme neverland
	"colorscheme neverland2
	"colorscheme robokai
	"colorscheme solarized
	"colorscheme Tomorrow-Night
	"colorscheme Tomorrow-Night-Bright
	"colorscheme Tomorrow-Night-Eighties
	colorscheme hemisu
endif

" Extended matching for the % command, good for HTML/XML tags
runtime macros/matchit.vim

" Show line numbers
set number

" Sets the character encoding used inside Vim
set encoding=utf-8
" Don't append a Byte-order Mark (BOM)
set nobomb

" Enable mouse in all modes
set mouse=a
" Enable copy/paste between vim and system clipboard
set clipboard=unnamed

" Don't wrap text
set nowrap
" Dont't wrap text in the middle of a word
set linebreak
" The minimum number of columns to scroll horizontally
set sidescroll=5
" Minimum number of screen lines to keep above and below the cursor
set scrolloff=5

" When a bracket is inserted, briefly jump to the matching one.
set showmatch
" Also display matching <tag> tags (useful for HTML-like languages)
set matchpairs+=<:>

" Highlights the current cursor line
set cursorline

" Allows backspacing over autoindent, line breaks and the start of insert 
set backspace=indent,eol,start

" Always show the statusline
set laststatus=2
set statusline=\ [%l,%c\ %P]\ %m%f\ %r%h%w%=[%{strlen(&ft)?&ft:'none'},\ %{&encoding},\ %{&fileformat}]\ 

set listchars=tab:▸\ ,trail:.,eol:¬,precedes:<,extends:>

" Highlight searches
set hlsearch
" Shows search results as you type
set incsearch
" Case insensitive search
set ignorecase
" Use case sensitive search if the search string contains uppercase
set smartcase
" Assume the /g flag when search and replacing
set gdefault

" Indicates a fast terminal connection. More characters will be sent to the
" screen for redrawing
set ttyfast

let g:tabwidth = 4

exec 'set shiftwidth=' . g:tabwidth
exec 'set softtabstop=' . g:tabwidth
exec 'set tabstop=' . g:tabwidth
set smarttab
set shiftround

" Use tabs
set noexpandtab
" Use spaces
"set expandtab

" Fast switching between paste modes
set pastetoggle=<F5>

" Directories for swp files
silent execute '!mkdir -p $HOME/.vim/swap'
silent execute '!mkdir -p $HOME/.vim/backup'
set directory=$HOME/.vim/swap
set backupdir=$HOME/.vim/backup
set backup

" Set encryption for Vim to blowfish
if version >= 700
	set cryptmethod=blowfish
endif

function SetupEncryption()
	set viminfo=
	setlocal bufhidden=wipe
	setlocal noswapfile
	setlocal nobackup
	setlocal nowritebackup
	setlocal foldmethod=indent
	setlocal foldlevel=0
	setlocal foldclose=all
	" move cursor over word and press 'e' to obfuscate/unobfuscate it
	noremap e g?iw
endfunction

au BufReadPre,BufRead * if strlen(&key) | call SetupEncryption() | endif

" Files with these suffixes get a lower priority when multiple files match a
" wild card
set suffixes+=.class,.pyc,.beam,jpe?g,.png,.gif
" A file matching these patterns is ignored when completing file or directory
" names
set wildignore+=.svn,CVS,.git,.hg,*.swp,*.o,*.obj,*.rbc,*.class,*.pyc,*.beam,*jpe?g,*.png,*.gif,env
set wildmenu
set wildmode=list:longest,list:full
set completeopt=menuone,longest,preview

" +---------------------------------------------------------------------------+
" | Script templates                                                          |
" +---------------------------------------------------------------------------+

au BufNewFile *.sh  so ~/.vim/templates/tpl.sh
au BufNewFile *.py  so ~/.vim/templates/tpl.py

" +---------------------------------------------------------------------------+
" | Remaps & Shortcuts                                                        |
" +---------------------------------------------------------------------------+

let mapleader = ","

" For the times you forget to open files as root/sudo
" Command: :w!!
cmap w!! %!sudo tee > /dev/null %

" Search and replace the word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" ,<Space> to clear search highlight
nnoremap <Leader><Space> :nohl<CR>

" Go to previous file
map <Leader>p <C-^>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Toggle NERDTree on/off
noremap <Leader>n :NERDTreeToggle<CR>

" Toggle comments (NERDComment)
map <Leader>c :call NERDComment(0, 'toggle')<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Rope (not installed atm)
"map <Leader>j :RopeGotoDefinition<CR>
"map <Leader>r :RopeRename<CR>

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


" Toggle invisible characters
noremap <Leader>i :set list!<CR>

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

" Disable the colorcolumn when switching modes. Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

function! ColorColumn()
	set colorcolumn=+1
	highlight ColorColumn ctermbg=black ctermfg=white guibg=darkgrey guifg=white
endfunction

autocmd FileType pandoc call ColorColumn()
autocmd FileType pandoc set wrap wrapmargin=2 textwidth=78

" Enable wrapping for txt files
autocmd BufRead,BufNewFile *.txt set wrap wrapmargin=2 textwidth=78

" Make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 textwidth=79

" Ruby uses 2 spaces for indentation
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\     execute "normal g`\"" |
	\ endif

" Helps if you have to use another editor on the same file
autocmd FileChangedShell *
    \ echohl WarningMsg |
    \ echo 'File has been changed outside of Vim.' |
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

if has("python")
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path, sys, vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
endif

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

" +---------------------------------------------------------------------------+ 
" |                               Host specific                               |
" +---------------------------------------------------------------------------+
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
