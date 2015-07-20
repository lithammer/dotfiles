" Neovim {{{
if has('nvim')
  let g:python_host_prog = $HOME.'/.vim/venv/bin/python'
  " let g:python_host_skip_check = 1

  " let g:python3_host_skip_check = 1
  let g:loaded_python3_provider = 0
end
" }}}
" Plugins {{{
call plug#begin()

Plug 'tpope/vim-sensible'

if !has('nvim')
  " This functionality is built into Neovim
  Plug 'ConradIrwin/vim-bracketed-paste'
end
Plug 'Raimondi/delimitMate'
" Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make clean all'}
" Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jeetsukumaran/vim-filebeagle'
" Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'ludovicchabant/vim-gutentags'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'osyo-manga/vim-brightest', {'on': 'BrightestEnable'}
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-vinegar'
let g:netrw_banner = 1
" Plug 'tsukkee/unite-tag'
Plug 'wellle/targets.vim'

Plug 'vim-scripts/LargeFile'

Plug 'fatih/vim-go'
" Plug 'rhysd/vim-go-impl'

if has('python')
  " if v:version > 703
  "   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  " endif
  if has('patch-7.3.584')
    Plug 'Valloric/YouCompleteMe'
  else
    Plug 'ajh17/VimCompletesMe'
  end
  " Plug 'davidhalter/jedi-vim'
  " Plug 'lambdalisue/vim-pyenv'
  " Plug 'jmcantrell/vim-virtualenv'
else
  Plug 'ajh17/VimCompletesMe'
endif

" Plug 'clausreinke/typescript-tools.vim', {'for': 'typescript'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

" Plug 'facebook/vim-flow'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/javascript-libraries-syntax.vim'

" Color
" Plug 'abra/vim-abra'
Plug 'chriskempson/base16-vim'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'cschlueter/vim-wombat
" Plug 'guns/jellyx.vim'
" Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
" Plug 'michalbachowski/vim-wombat256mod'
Plug 'nanotech/jellybeans.vim'
" Plug 'notpratheek/vim-luna'
" Plug 'romainl/Apprentice'
" Plug 'w0ng/vim-hybrid'
Plug 'renstrom/vim-hybrid'

call plug#end()

" }}}
" Plugin settings and mappings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use a different mapleader (default is '\')
let mapleader = ','

" Airline {{{

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#branch#enabled = 0

" }}}
" Ag {{{

let g:ag_prg = 'ag --vimgrep'

" "}}}
" Brightest {{{

let g:brightest#highlight = {'group': 'BrightestReverse'}
let g:brightest#enable_filetypes = {
\  '_': 0,
\  'python': 1,
\  'go': 1,
\  'javascript': 1,
\}

" }}}
" delimitMate {{{

" Enable expansion of <CR>
let delimitMate_expand_cr = 1

" }}}
" Commentary {{{
map <Leader>c :Commentary<CR>
" }}}
" Ctrlp {{{

nnoremap <C-t> :CtrlPTag<CR>
nnoremap <C-b> :CtrlPBuffer<CR>

" let g:ctrlp_custom_ignore = {'dir': '\v[\/](venv|env|node_modules|vendor)$'}
let g:ctrlp_custom_ignore = {'dir': '\v[\/](vendor)$'}

if executable('ag')
  let g:ctrlp_user_command = [
    \ '.git',
    \ 'git ls-files --cached --others --exclude-standard %s',
    \ 'ag %s --nocolor --nogroup --files-with-matches -g ""'
  \ ]
  let g:ctrlp_use_caching = 0
endif

" if has('python')
"   let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
" endif

" }}}
" EasyAlign {{{
vmap <Enter> <Plug>(EasyAlign)
" }}}
" Go {{{
let g:go_fmt_command = 'goimports'
" }}}
" Gutentags {{{

let g:gutentags_cache_dir = $HOME.'/.vim/tags'
let g:gutentags_exclude = ['/usr/local']

" }}}
" Neomake {{{
highlight link NeomakeErrorSign ErrorMsg
highlight link NeomakeWarningSign Type

let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'NeomakeWarningSign',
    \ }

let g:neomake_open_list = 1
let g:neomake_verbose = 0  " Log only errors

let g:neomake_python_enabled_makers = ['pep8', 'frosted']

" }}}
" Pyenv {{{
" let g:pyenv#auto_force_py_version_jedi = 0
" let g:pyenv#auto_force_py_version = 0
" let g:pyenv#jedi#auto_force_py_version = 0
" }}}
" Sneak {{{
let g:sneak#streak = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
highlight link SneakPluginTarget Search
highlight link SneakStreakTarget Error
highlight link SneakStreakMask Normal
highlight link SneakPluginScope Search
" }}}
" Syntastic {{{
highlight link SyntasticErrorSign ErrorMsg
highlight link SyntasticWarningSign Type

let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_aggregate_errors = 1
" let g:syntastic_html_checkers = []
let g:syntastic_go_checkers = ['go', 'govet']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_args = '--babel'
" let g:syntastic_lua_checkers = ['luac', 'luacheck']
let g:syntastic_python_checkers = ['pep8', 'frosted']
let g:syntastic_typescript_checkers = ['tslint']
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
" }}}
" Unite {{{

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <C-p> :<C-u>Unite -start-insert -auto-resize file_rec/async:!<CR>
" nnoremap <C-t> :<C-u>Unite -start-insert -auto-resize tag<CR>
" nnoremap <C-g> :<C-u>Unite -auto-preview -no-split grep<CR>
" " nnoremap <C-g> :<C-u>Unite -start-insert -auto-resize file_rec/git<CR>
" nnoremap <C-b> :<C-u>Unite -quick-match buffer<CR>

" " Don't cache, it's fast enough
" let g:unite_source_rec_max_cache_files = 0

" call unite#custom#source('file_rec/async,file_rec/git', 'sorters', ['sorter_rank'])
" call unite#custom#source('file_rec/async,file_rec/git,grep', 'converters', ['converter_relative_word'])
" " This might not work since `wildignore` is empty here
" call unite#custom#source('file_rec/async,file_rec/git', 'ignore_globs', split(&wildignore, ','))

" if executable('ag')
"   let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup -g ""'
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--vimgrep'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" function! s:custom_unite_settings()
"   " Overwrite settings.
"   " imap <silent><buffer> <Esc> :UniteClose<CR>
"   imap <silent><buffer><expr> <C-s> unite#do_action('split')
"   imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
" endfunction
" autocmd FileType unite call s:custom_unite_settings()

" }}}
" YouCompleteMe {{{

let g:ycm_path_to_python_interpreter = $HOME.'/.vim/venv/bin/python'
let g:ycm_semantic_triggers = {'typescript': ['.']}
let g:ycm_min_num_of_chars_for_completion = 3

" Looks up the symbol under the cursor and jumps to its definition if
" possible; if the definition is not accessible from the current translation
" unit, jumps to the symbol's declaration.
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" }}}

" }}}
" Options {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Tree style file listing
let g:netrw_liststyle = 3

" <C-^> should go to the last file, not to netrw
let g:netrw_altfile = 1

" Highlight numers, buitin functions, standard exceptions, doctests and
" whitespace errors (:h ft-python-syntax)
let python_highlight_all = 1

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses (:h ft-lisp-syntax)
let g:lisp_rainbow = 1

" Use the 256 color space instead of 16
set t_Co=256

" Make sure dark background is used for colorschemes
set background=dark

" let g:airline_theme = 'hybridline'
let g:seoul256_background = 235  " Default is 237
let g:gruvbox_italic = 0
if has('nvim') && $NVIM_TUI_ENABLE_TRUE_COLOR
  colorscheme base16-eighties
else
  colorscheme hybrid
endif

" Make current line number yellow
if g:colors_name =~ 'base16-'
  " Make current line number more prominent (yellow)
  highlight! link CursorLineNr Todo

  " Make 'listchars' darker
  highlight clear SpecialKey
  highlight SpecialKey ctermfg=19 guifg=#444444

  " Syntastic markers
  " highlight link SyntasticErrorSign ErrorMsg
  " highlight link SyntasticWarningSign Type
endif

let g:markdown_fenced_languages = ['python', 'javascript', 'js=javascript', 'json=javascript', 'go']

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more)
set autowrite

" Recognize numbered lists when formatting text
set formatoptions+=n

" Delete comment character when joining commented lines
if has('patch-7.3.541')
  set formatoptions+=j
endif

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set shiftround

" Highlight one column after 'textwidth'
" set colorcolumn=+1

" Show menu when there's at least one match, and show extra information
set completeopt=menuone,preview
" set completeopt=menuone

" Remove fold characters
set fillchars="vert:|,fold:"

" ':substitute' flag 'g' is on by default, will replace
" all matches on a line instead of one
set gdefault

" Include line numbers in grep format
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Use Ag (The Silver Searcher) instead of grep if available
if executable('ag')
  let &grepprg = 'ag --vimgrep'
else
  let &grepprg = 'grep --recursive --line-number $* *'
endif
command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen

" Highlight all search matches
set hlsearch

" Ignore case in search patterns, unless they contains upper case characters
set ignorecase smartcase

" Don't redraw screen while executing macros
set lazyredraw

" Show some hidden characters ('listchars')
set list

set listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:_

" Faster and more precise mouse support
if !has('nvim')
  set ttymouse=xterm2
endif

" Allow mouse usage in all modes
set mouse=""

" Don't show current mode on last line (vim-airline does this instead)
set noshowmode

" Wrap long lines
set wrap

" Characters to put at the start of wrap lines
let &showbreak = '↪ '

" Break long lines on more natural break points
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
if has('patch-7.4.338')
  set breakindent
  set breakindentopt=shift:2
end

" Show line numbers
set number

" Use current line as starting point for line numbering
if has('patch-7.3.787')
  set relativenumber
endif

" Always report number of lines changes
set report=0

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" The minimal number of columns to scroll horizontally
set sidescroll=10

" Put the new window on the right when doing :vsplit
set splitright

" Set the title of the window to 'titlestring'
set title

set directory=~/.vim/swaps
if !isdirectory(&directory)
  call mkdir(&directory)
endif

set backupdir=~/.vim/backups
if !isdirectory(&backupdir)
  call mkdir(&backupdir)
endif

if has('persistent_undo')
  set undodir=~/.vim/undos
  set undofile
  if !isdirectory(&undodir)
    call mkdir(&undodir)
  endif
endif

" Allow cursor beyond EOL in Visual block mode
set virtualedit=block

" Case-insensitive completion for file names and directories
if has('patch-7.3.072')
  set wildignorecase
end

" Match longest commong string
set wildmode=list:longest,list:full

" Version control
set wildignore+=.svn,.git,.hg

" Binary files
set wildignore+=*.py[co],*.luac,*.beam,*.class,*.o

" Images
set wildignore+=*.jpe?g,*.png,*.gif,*.bmp,*.ico

" Virtualenv, npm and bower
set wildignore+=venv,env,node_modules,bower_components

" OS files
set wildignore+=*.DS_Store

" }}}
" Mappings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Terminal mappings for Neovim
if has('nvim')
  tnoremap <C-a> <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
  autocmd WinEnter term://* startinsert
endif

" My fingers are too fast!
command W w
command Q q

" Make Y behave like D (yank from cursor to EOL)
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" Copy to clipboard
vnoremap <C-c> "*y"

" Toggle fold under cursor
noremap <Space> za

" Don't move on '*', useful when highlighting words
nnoremap * *<C-o>

" Go to next/previous item in location-list using <Tab>/<S-Tab> in normal mode
" nnoremap <Tab> :lnext<CR>
" nnoremap <S-Tab> :lprevious<CR>

" Circular windows navigation
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" }}}
" Auto commands {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sets the filetype when using Ctrl-x-e in bash
autocmd BufRead,BufNewFile bash-* set filetype=sh

" Press K to get documentation about a Vim keyword
autocmd FileType vim,help setlocal keywordprg=:help

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" Only show colorcolumn in the current window
if &colorcolumn == '+1'
  augroup ccol
    autocmd!
    autocmd WinLeave * setlocal colorcolumn=0
    autocmd WinEnter * setlocal colorcolumn=+1
  augroup END
endif

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
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction
autocmd BufReadPost * call SetCursorPosition()

" Always close preview window after completion is done.
" http://stackoverflow.com/a/26022965/1862923
if has('patch-7.3.598')
  autocmd CompleteDone * pclose
endif

augroup rainbow_colors
  " let g:rainbow#pairs = [['(', ')'], ['[', ']']]
  autocmd!
  autocmd FileType clojure,scheme,python RainbowParentheses
augroup END
" au VimEnter * RainbowParentheses

" }}}
" Filetype settings {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plain text
function! SetupPlainText()
  setlocal wrap
  setlocal wrapmargin=2
  setlocal textwidth=79
  setlocal formatoptions+=t
endfunction
autocmd FileType text call SetupPlainText()

function! TwoSpaceIndent()
  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction
autocmd FileType json,less,scss,css,stylus,jade,ruby call TwoSpaceIndent()

" Python, PEP8: http://www.python.org/dev/peps/pep-0008/
function! SetupPython()
  setlocal textwidth=79
  setlocal foldmethod=indent
  setlocal foldlevel=1
  setlocal foldnestmax=2

  " Highlight 'print' as function
  syn keyword pythonBuiltinFunc print

  " Highlight 'NOTE' and 'HACK' in comments
  syn keyword pythonTodo NOTE HACK contained

  " https://github.com/google/yapf
  if executable('yapf')
    function! FormatPython()
      " Do not run this for automatic formatting
      if !empty(v:char) || mode() == 'i' || mode() == 'R'
        return 1
      end

      let l:line_ranges = v:lnum . '-' . (v:lnum + v:count - 1)
      execute '0,$!yapf --lines=' . l:line_ranges
      " Reset cursor to first line of the formatted range
      call cursor(v:lnum, 1)
    endfunction

    setlocal formatexpr=FormatPython()
  endif
endfunction
autocmd FileType python call SetupPython()

" XML, HTML et al
function! SetupMarkupLanguage()
  setlocal matchpairs+=<:>

  " Set `xmllint` as formatter for XML
  if &filetype == 'xml'
    setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  endif
endfunction
autocmd FileType html,xml call SetupMarkupLanguage()

function! SetupJSON()
  setlocal equalprg=python\ -mjson.tool
endfunction
autocmd FileType json call SetupJSON()

" Set JavaScript indent settings for TypeScript (leafgarland/typescript-vim
" doesn't include any indentation)
autocmd FileType typescript runtime! indent/javascript.vim

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
endif

" Windows
if has('gui_win32')
  " ...
endif

" Local settings
silent! source ~/.vimrc.local

" vim: set foldenable foldmethod=marker foldlevel=0:
" }}}
