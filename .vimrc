" +---------------------------------------------------------------------------+
" |                            VIM Settings                                   |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |   ,g = toggle Gundo off and on                                            |
" |   ,c = comment block/line                                                 |
" |                                                                           |
" |   ,p = go to previous file                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |   <F5> = toggle paste mode on/off                                         |
" |   ,<Space> = clear search highlight                                       |
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

Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'SirVer/ultisnips'
Bundle 'ap/vim-css-color'
Bundle 'ervandew/supertab'
Bundle 'fs111/pydoc.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'kana/vim-smartinput'

Bundle 'nginx.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'

" Plugin variables -----------------------------------------------------------

let NERDCreateDefaultMappings = 0            " Don't create default NERDCommenter keymappings
let NERDTreeIgnore = ['\.pyc$']              " Browser skiplist
let NERDTreeMouseMode = 1                    " Single click for everything
let g:molokai_original = 1                   " Use original Monokai background color
let g:solarized_termcolors = 256             " Use 256 colors in terminal (instead of 16)
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_check_on_open = 1
let g:Powerline_symbols  = 'fancy'           " Custom font tokens
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-n>'

let g:pymode_doc = 0                         " Don't load show documentation plugin
let g:pymode_run = 0                         " Load run code plugin
let g:pymode_lint = 0                        " Disable pylint code plugin

let g:pymode_rope = 1                        " Load rope plugin
let g:pymode_rope_auto_project = 1           " Auto create and open ropeproject
let g:pymode_rope_enable_autoimport = 1      " Enable autoimport
let g:pymode_rope_autoimport_generate = 1    " Auto generate global cache
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_vim_completion = 0
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0

let g:pymode_folding = 0                     " Disable python folding
let g:pymode_motion = 0                      " Disable python objects and motion
let g:pymode_virtualenv = 1                  " Auto fix vim python paths if virtualenv enabled
let g:pymode_breakpoint = 0                  " Disable breakpoints plugin
let g:pymode_utils_whitespaces = 0           " Disable autoremove unused whitespaces

let g:pymode_syntax = 1                      " Enable pymode's custom syntax highlighting
let g:pymode_syntax_all = 0                  " Don't enable all python highlightings
let g:pymode_syntax_print_as_function = 1    " Highlight 'print' as function
let g:pymode_syntax_indent_errors = 1        " Highlight indentation errors
let g:pymode_syntax_space_errors = 1         " Highlight trailing spaces
let g:pymode_syntax_string_formatting = 1    " Highlight string formatting
let g:pymode_syntax_string_format = 1        " Highlight str.format syntax
let g:pymode_syntax_string_templates = 1     " Highlight string.Template syntax
let g:pymode_syntax_doctests = 1             " Highlight doc-tests
let g:pymode_syntax_builtin_objs = 1         " Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_funcs = 1        " Highlight builtin functions
let g:pymode_syntax_highlight_exceptions = 1 " Highlight exceptions

"let g:ctrlp_working_path_mode = 0            " 0 - don't manage working directory.
let g:ctrlp_root_markers = ['.ctrlp']        " Add custom root markers
" Skip our custom root marker when searching
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.ropeproject$\|node_modules$\|env$',
	\ 'file': '\.ctrlp$',
	\ }

" Color schemes
Bundle 'altercation/vim-colors-solarized'
"Bundle 'robokai'
"Bundle 'tomasr/molokai'
"Bundle 'wgibbs/vim-irblack'
"Bundle 'trapd00r/neverland-vim-theme'
Bundle 'Diablo3'
"Bundle 'jpo/vim-railscasts-theme'
"Bundle 'github-theme'
Bundle 'Lucius'
"Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'noahfrederick/Hemisu'
Bundle 'nanotech/jellybeans.vim'
"Bundle 'sjl/badwolf'

" Basic options --------------------------------------------------------------

" Put the cursor on a keyword and press 'K' to get information about it!

filetype plugin indent on

" Extended matching for the % command, good for HTML/XML tags
runtime macros/matchit.vim

syntax on
set t_Co=256
set background=dark

colorscheme solarized
if has('gui_running')
	set background=light
	colorscheme hemisu
endif

set encoding=utf-8
set nobomb

set autoindent
set formatoptions+=n

set gdefault
set hlsearch
set ignorecase
set incsearch

set nowrap
set linebreak
set listchars=tab:▸\ ,trail:.,eol:¬,precedes:❮,extends:❯
set showbreak=↪

set backspace=indent,eol,start
"set clipboard=unnamed
set cursorline
set fillchars=diff:⣿,vert:│
set laststatus=2
set lazyredraw
set ttyfast
set matchpairs+=<:>
set mouse=a
set number
set pastetoggle=<F5>
set scrolloff=5
set sidescroll=5
set showmatch
set smartcase
set title

let g:tabwidth = 4
exec 'set shiftwidth=' . g:tabwidth
exec 'set softtabstop=' . g:tabwidth
exec 'set tabstop=' . g:tabwidth
set smarttab
set shiftround
set noexpandtab
"set expandtab

silent execute '!mkdir -p $HOME/.vim/swap'
set directory=$HOME/.vim/swap

silent execute '!mkdir -p $HOME/.vim/backup'
set backupdir=$HOME/.vim/backup

" Persistent undo history
silent execute '!mkdir -p $HOME/.vim/undo'
set undodir=$HOME/.vim/undo
set undofile

set wildignore+=.svn,CVS,.git,.hg            " Version control
set wildignore+=*.aux,*.out,*.toc            " LaTeX intermediate files
set wildignore+=*.swp                        " Vim swap files
set wildignore+=*.o,*.obj,*.exe,*.dll        " Compiled object files
set wildignore+=*.pyc                        " Python byte code
set wildignore+=*.luac                       " Lua byte code
set wildignore+=*.beam                       " Compiled Erlang files
set wildignore+=*.class                      " Compiled Java files
set wildignore+=*jpe?g,*.png,*.gif,*.bmp     " Images
set wildignore+=env,node_modules             " Virtualenv and Node.js folders
set wildignore+=lib,libs                     " Library folders
set wildignore+=*.DS_Store                   " OS X files

set wildmenu
set wildmode=list:longest,list:full
set completeopt=menuone,longest,preview

if version >= 700
	set cryptmethod=blowfish
endif

" Mappings -------------------------------------------------------------------

let mapleader = ','

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$

" Don't move on *
nnoremap * *<C-o>

" Search and replace the word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" <Leader><Space> to clear search highlight
nnoremap <Leader><Space> :nohl<CR>

" Go to previous file
map <Leader>p <C-^>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Toggle invisible characters
noremap <Leader>i :set list!<CR>

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

" Load the Gundo window
map <Leader>g :GundoToggle<CR>

" Rope (not installed atm)
map <Leader>j :RopeGotoDefinition<CR>
"map <Leader>r :RopeRename<CR>

" Neocomplcache
" <Tab>: completion.
"au VimEnter * inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"au VimEnter * inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

" Don't display popup while navigating, backspacing and linebreaking
inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" Auto commands --------------------------------------------------------------

" Only show cursorline in the current window and in normal mode
augroup cline
	au!
	au WinLeave * set nocursorline
	au WinEnter * set cursorline
	au InsertEnter * set nocursorline
	au InsertLeave * set cursorline
augroup END

" Only show colorcolumn in the current window
"augroup ccol
"    au!
"    au WinLeave * setlocal colorcolumn=0
"    au WinEnter * setlocal colorcolumn=+1
"augroup END

" Don't show trailing whitespaces in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Press K to get documentation about a Vim keyword
au FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
au VimResized * :wincmd =

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
au FileChangedShell *
    \ echohl WarningMsg |
    \ echo 'File has been changed outside of Vim.' |
    \ echohl None

" Filetype specific ----------------------------------------------------------

" Script templates
au BufNewFile *.sh so ~/.vim/templates/tpl.sh
au BufNewFile *.py so ~/.vim/templates/tpl.py

" Encrypted files
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

" Pandoc (Markdown)
function! SetupPandoc()
	setlocal wrap
	setlocal wrapmargin=2
	setlocal textwidth=80
	" Autowrap text based on 'textwidth'
	setlocal formatoptions+=t
endfunction
au FileType pandoc call SetupPandoc()

" Plain text
function! SetupPlainText()
	setlocal wrap
	setlocal wrapmargin=2
	setlocal textwidth=80
	" Autowrap text based on 'textwidth'
	setlocal formatoptions+=t
endfunction
au FileType text call SetupPlainText()

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
	setlocal textwidth=80
	" Don't autowrap text based on 'textwidth'
	setlocal formatoptions-=t
endfunction
au FileType python call SetupPython()

" Ruby
function! SetupRuby()
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=2
endfunction
au FileType ruby call SetupRuby()

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses.
let g:lisp_rainbow = 1

" Nginx config files
au BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-available/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-enabled/* set ft=nginx

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
au BufReadPost *.{py,rb} call WarnTabs()

" OS specific ----------------------------------------------------------------

" General GUI options
if has('gui')
	set guioptions-=m  " Remove menu bar
	set guioptions-=T  " Remove toolbar
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
endif
 
" Windows
if has('gui_win32')
	" ...
endif

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
