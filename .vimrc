" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scriptencoding utf-8

" let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

if has('nvim')
  " Enable mode shapes, cursor highlight and blinking.
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
else
  " http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
  " This flickers to much on backspace.
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Plugins {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin()
" Use a different mapleader (default is '\')
let g:mapleader = ','
" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'
" AndrewRadev/splitjoin.vim {{{2
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1
" ConradIrwin/vim-bracketed-paste {{{2
if !has('nvim')
  " This functionality is built into Neovim
  Plug 'ConradIrwin/vim-bracketed-paste'
end
" Valloric/YouCompleteMe {{{2
" YCM {{{3
" if has('python') || has('python3')
"   Plug 'Valloric/YouCompleteMe'
"   let g:ycm_python_binary_path = 'python'
"   let g:ycm_rust_src_path = expand('~/src/github.com/rust-lang/rust/src')
"   let g:ycm_goto_buffer_command = 'horizontal-split'
"   nnoremap <leader>jd :YcmCompleter GoTo<CR>
" end
" asyncomplete.vim {{{3
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
imap <C-space> <Plug>(asyncomplete_force_refresh)

augroup asyncomplete
  autocmd!
augroup END

" Completion sources.

" Disable omni and buffer completion for these sources because they have an
" LSP source (or otherwise better alternative).
let s:asyncomplete_blacklist = [
\  'go',
\  'javascript',
\  'javascript.jsx',
\  'python',
\  'rust',
\  'typescript'
\]

Plug 'yami-beta/asyncomplete-omni.vim'
autocmd asyncomplete User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\  'name': 'omni',
\  'priority': 6,
\  'whitelist': ['*'],
\  'blacklist': s:asyncomplete_blacklist,
\  'completor': function('asyncomplete#sources#omni#completor')
\}))

if executable('ctags')
  Plug 'prabirshrestha/asyncomplete-tags.vim'
  autocmd asyncomplete User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
  \  'name': 'tags',
  \  'priority': 4,
  \  'whitelist': ['c', 'cpp'],
  \  'completor': function('asyncomplete#sources#tags#completor'),
  \  'config': {'max_file_size': 20000000},
  \}))
endif

Plug 'prabirshrestha/asyncomplete-buffer.vim'
autocmd asyncomplete User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
\  'name': 'buffer',
\  'priority': 0,
\  'whitelist': ['*'],
\  'blacklist': s:asyncomplete_blacklist,
\  'completor': function('asyncomplete#sources#buffer#completor'),
\}))

" Plug 'prabirshrestha/asyncomplete-necosyntax.vim' | Plug 'Shougo/neco-syntax'
" autocmd asyncomplete User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
" \  'name': 'necosyntax',
" \  'priority': 2,
" \  'whitelist': ['*'],
" \  'blacklist': s:asyncomplete_blacklist,
" \  'completor': function('asyncomplete#sources#necosyntax#completor'),
" \}))

if executable('pyls')
  autocmd asyncomplete User lsp_setup call lsp#register_server({
  \  'name': 'pyls',
  \  'cmd': {server_info->['pyls']},
  \  'priority': 8,
  \  'whitelist': ['python'],
  \})
endif

if executable('javascript-typescript-stdio')
  autocmd asyncomplete User lsp_setup call lsp#register_server({
  \  'name': 'javascript-typescript-stdio',
  \  'cmd': {server_info->['javascript-typescript-stdio']},
  \  'priority': 8,
  \  'whitelist': ['javascript', 'javascript.jsx', 'typescript'],
  \})
endif

if executable('rls')
  autocmd asyncomplete User lsp_setup call lsp#register_server({
  \  'name': 'rls',
  \  'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
  \  'priority': 8,
  \  'whitelist': ['rust'],
  \})
endif

autocmd asyncomplete User lsp_setup call lsp#register_server({
\  'name': 'clangd',
\  'cmd': {server_info->[expand('/usr/local/Cellar/llvm/*/bin/clangd')]},
\  'priority': 8,
\  'whitelist': ['c', 'cpp'],
\})

if executable('go-langserver')
  autocmd asyncomplete User lsp_setup call lsp#register_server({
  \  'name': 'go-langserver',
  \  'cmd': {server_info->['go-langserver', '-mode=stdio']},
  \  'priority': 8,
  \  'whitelist': ['go'],
  \})
endif

if executable('gocode')
  Plug 'prabirshrestha/asyncomplete-gocode.vim'
  autocmd asyncomplete User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
  \  'name': 'gocode',
  \  'priority': 8,
  \  'whitelist': ['go'],
  \  'completor': function('asyncomplete#sources#gocode#completor'),
  \}))
endif
" Vimjas/vim-python-pep8-indent {{{2
Plug 'Vimjas/vim-python-pep8-indent'
" airblade/vim-gitgutter {{{2
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
" fatih/vim-go {{{2
Plug 'fatih/vim-go'
let g:go_fmt_command = 'goimports'
" fs111/pydoc.vim {{{2
Plug 'fs111/pydoc.vim'
" Don't highlight search term.
let g:pydoc_highlight = 0
" Use a more portable command.
let g:pydoc_cmd = 'python -m pydoc'
" junegunn/vim-peekaboo {{{2
Plug 'junegunn/vim-peekaboo'
" junegunn/vim-easy-align {{{2
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
vmap <Enter> <Plug>(EasyAlign)
" justinmk/vim-sneak {{{2
Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
" let g:sneak#s_next = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
" kshenoy/vim-signature {{{2
Plug 'kshenoy/vim-signature'
" ludovicchabant/vim-gutentags {{{2
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_generate_on_empty_buffer = 1
  let g:gutentags_cache_dir = expand('~/.vim/tags')
  let g:gutentags_ctags_exclude = [
  \  '*.min.js',
  \  '*/vendor/*',
  \  '*/node_modules/*',
  \  '*/env/*',
  \  '*/venv/*',
  \  '*/third_party/*',
  \  '*/lib/*',
  \  '*/lib64/*',
  \  '*/build/*',
  \  '*/dist/*',
  \]
endif
" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>
" mbbill/undotree {{{2
Plug 'mbbill/undotree'
" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
let g:grepper = {'tools': ['git', 'rg']}
" let g:grepper.simple_prompt = 1
command! -nargs=+ -complete=file Grep Grepper -noprompt -tool rg -query <args>
command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>
" rust-lang/rust.vim {{{2
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
" sheerun/vim-polyglot {{{2
Plug 'sheerun/vim-polyglot'
" These are covered by the upstream plugin.
let g:polyglot_disabled = [
\  'go',
\  'groovy',
\  'python',
\  'rust',
\]
" srstevenson/vim-picker {{{2
" Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
" let g:ctrlp_working_path_mode = 'a'
" let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
" let g:ctrlp_user_command = 'rg --files %s'
" let g:ctrlp_use_caching = 0
" let g:ctrlp_status_func = {'main': 'CtrlP_Main', 'prog': 'CtrlP_Progress'}
" let s:ctrlp_section_map = {'mru files': 'recent'}
" function! CtrlP_Main(...) " See :h ctrlp_status_func
"   let l:section = get(s:ctrlp_section_map, a:5, a:5)
"   return a:1 ==# 'prt'
"   \  ? '%#InsertMode# ' . l:section . ' %* %<' . getcwd() . ' %= %#InsertMode#' . (a:3?' regex ':' match ') . a:2 . ' %*'
"   \  : '%#VisualMode# ' . l:section . ' %* %<' . getcwd() . ' %= %#VisualMode# select %*'
" endf

" function! CtrlP_Progress(...)
"   return '%#Warnings# ' . a:1 . ' %* %= %<%#Warnings# ' . getcwd() . ' %*'
" endf
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <silent> <Leader>b :FzfBTags<CR>
command! -bang -nargs=* FzfRg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always ' . shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)
" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'
map <Leader>c :Commentary<CR>
" tpope/vim-eunuch {{{2
Plug 'tpope/vim-eunuch'
" tpope/vim-fugitive {{{2
Plug 'tpope/vim-fugitive'
" tpope/vim-repeat {{{2
Plug 'tpope/vim-repeat'
" tpope/vim-sleuth {{{2
Plug 'tpope/vim-sleuth'
" tpope/vim-surround {{{2
Plug 'tpope/vim-surround'
" tpope/vim-vinegar {{{2
Plug 'tpope/vim-vinegar'
let g:netrw_banner = 1
" vim-python/python-syntax {{{2
Plug 'vim-python/python-syntax'
" w0rp/ale {{{2
Plug 'w0rp/ale'

let g:ale_linters = {
\  'c': [],
\  'cpp': [],
\  'go': ['govet', 'golint', 'go build'],
\  'python': ['flake8'],
\  'rust': ['rustc', 'cargo'],
\  'typescript': ['tslint', 'tsserver'],
\}

let g:ale_fixers = {
\  'c': ['clang-format'],
\  'cpp': ['clang-format'],
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\}

" let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_sign_error = "\u2716"
" let g:ale_sign_warning = "\u267A"
" let g:ale_sign_error = 'E>'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format = ["\u2716 %d", "\u267A %d", '']
let g:ale_warn_about_trailing_whitespace = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight ALEError ctermbg=none cterm=underline
" Adapted for jellybeans.
highlight link ALEErrorSign WarningMsg
highlight link ALEWarningSign Type
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
" Plug 'ajmwagar/vim-dues'
" Plug 'arcticicestudio/nord-vim',
" Plug 'chriskempson/base16-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'mbbill/vim-seattle'
Plug 'nanotech/jellybeans.vim'
" Plug 'rakr/vim-one'
" Plug 'w0ng/vim-hybrid'
" Plug 'renstrom/vim-hybrid'
" }}}
call plug#end()
" }}}
" Interesting but unused plugins {{{1
" Plug 'dominikduda/vim_current_word'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'osyo-manga/vim-brightest'
" Plug 'sbdchd/neoformat'
" Plug 'srstevenson/vim-picker'
" }}}
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Stop the sh syntax file from highlighting $(...) as errors.
" See :h ft-sh-syntax.
let g:is_posix = 1

" Tree style file listing.
let g:netrw_liststyle = 3

" <C-^> should go to the last file, not to netrw.
let g:netrw_altfile = 1

" Hide patterns specified in .gitignore. Press "a" to cycle through the hiding modes.
" :h netrw-hiding
if has('patch-7.4.156')
  let g:netrw_list_hide = netrw_gitignore#Hide()
endif

" Highlight numbers, buitin functions, standard exceptions, doctests and
" whitespace errors (:h ft-python-syntax).
let g:python_highlight_all = 1

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses (:h ft-lisp-syntax).
let g:lisp_rainbow = 1

" Make sure dark background is used for colorschemes.
set background=dark

if has('termguicolors') " 7.4.1799
  if !empty($TMUX)
    " :h xterm-true-color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
  let g:jellybeans_overrides = {
  \  'background': {'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none'},
  \  'SpecialKey': {'ctermfg': '238', 'ctermbg': 'none', 'guifg': '444444', 'guibg': 'none'},
  \}
  colorscheme jellybeans
else
  colorscheme hybrid
endif

" Don't try to highlight lines longer than 400 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more).
set autowrite

" When formatting text, recognize numbered lists. This actually uses
" the 'formatlistpat' option, thus any kind of list can be used. The
" indent of the text after the number is used for the next line. The
" default is to find a number, optionally followed by '.', ':', ')',
" ']' or '}'.  Note that 'autoindent' must be set too.
set formatoptions+=n

" Don't break a line after a one-letter word. It's broken before it
" instead (if possible).
set formatoptions+=1

" Where it makes sense, remove a comment leader when joining lines.
if has('patch-7.3.541')
  set formatoptions+=j
endif

" Use 4-space indentation, this might be overriden by language specific
" indentation
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab shiftround

" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set shiftround

" menuone   Use the popup menu also when there is only one match.
"           Useful when there is additional information about the
"           match, e.g., what file it comes from.
"
" preview   Show extra information about the currently selected
"           completion in the preview window.
"
" noselect  Do not select a match in the menu, force the user to
"           select one from the menu. Only works in combination with
"           "menu" or "menuone".
set completeopt=menuone,preview,noselect

" Include line numbers in grep format.
set grepformat^=%f:%l:%c:%m

if executable('rg')
  let &grepprg = 'rg --vimgrep'
elseif executable('ag')
  let &grepprg = 'ag --vimgrep'
else
  let &grepprg = 'grep -I --recursive --line-number $* *'
endif

" Automatically open the quickfix window when populated.
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Ignore case in search patterns, unless they contain upper case characters.
set ignorecase smartcase

" nosplit  Shows the effects of a command incrementally, as you type.
" split    Also shows partial off-screen results in a preview window.
if exists('&inccommand')
  set inccommand=split
endif

" Enable list mode. See 'listhars'.
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:+

" If on, Vim will wrap long lines at a character in 'breakat' rather
" than at the last character that fits on the screen. Unlike
" 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
" it only affects the way the file is displayed, not its contents.
if has('linebreak')
  set linebreak
endif

if exists('+breakindent')
  " Every wrapped line will continue visually indented (same amount of
  " space as the beginning of that line), thus preserving horizontal blocks
  " of text.
  set breakindent
  " After applying 'breakindent', the wrapped line's beginning will be shifted
  " by the given number of characters. It permits dynamic French paragraph
  " indentation (negative) or emphasizing the line continuation (positive).
  set breakindentopt=shift:2
  let &showbreak = "\u21AA "
endif

" Show line numbers.
set number

" Use current line as starting point for line numbering.
" if exists('+relativenumber')
"   set relativenumber
" endif

" Always report number of lines changes.
set report=0

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" The minimal number of columns to scroll horizontally.
set sidescroll=1

" Set the title of the window to 'titlestring'.
set title

" Splitting a window will put the new window right of the current one.
set splitright

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

" Allow cursor beyond EOL in Visual block mode.
set virtualedit=block

" Case-insensitive completion for file names and directories.
if exists('+wildignorecase')
  set wildignorecase
end

" When more than one match, list all matches.
set wildmode=list:longest,list:full

if has('patch-7.4.156')
  let &wildignore = netrw_gitignore#Hide()
endif

" A list of patterns to ignore when expanding wildcards, completing file or
" directory names, and influences the result of expand(), glob() and
" globpath().
set wildignore+=*.pyc,*.o

" https://github.com/neovim/neovim/pull/6434
set ttimeout ttimeoutlen=50

" Mappings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" My fingers are too fast!
command W w
command Q q

" Repeat the last recorded macro.
nnoremap Q @@

" Copy to clipboard.
vnoremap <C-c> "*y"

" Toggle fold under cursor.
noremap <Space> za

" Don't move on '*', useful when highlighting words.
nnoremap * *<C-o>

" List buffers and wait for input.
nnoremap <Leader>b :buffers<CR>:buffer<Space>

function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  catch /^Vim\%((\a\+)\)\=:E776/
    execute "normal \<Esc>"
  endtry
endfunction

function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  catch /^Vim\%((\a\+)\)\=:E776/
    execute "normal \<Esc>"
  catch /^Vim\%((\a\+)\)\=:E42/
    execute "normal \<Esc>"
  endtry
endfunction

" nnoremap <silent> <Plug>LocationPrevious :<C-u>exe 'call <SID>LocationPrevious()'<CR>
" nnoremap <silent> <Plug>LocationNext :<C-u>exe 'call <SID>LocationNext()'<CR>
" nmap <silent> ö <Plug>LocationPrevious
" nmap <silent> ä <Plug>LocationNext
nmap <silent> ö :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nmap <silent> ä :<C-u>exe 'call <SID>LocationNext()'<CR>

nmap Ö :cprevious<CR>
nmap Ä :cnext<CR>

" Statusline {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
augroup statuslinewhitespace
  autocmd!
  autocmd CursorHold,BufWritePost * unlet! b:statusline_whitespace_check
augroup END

function! StatuslineWhitespace()
  if &readonly || !&modifiable || line('$') > 20000
    return ''
  endif

  if !exists('b:statusline_whitespace_check')
    let b:statusline_whitespace_check = ''

    let l:trailing = search('\s$', 'nw')
    let l:mixed = search('\v(^\t+ +)|(^ +\t+)', 'nw')

    if l:trailing != 0 || l:mixed != 0
      let b:statusline_whitespace_check = '!'
      if l:trailing != 0
        let b:statusline_whitespace_check .= (' ').printf('[%s]trailing', l:trailing)
      endif
      if l:mixed != 0
        let b:statusline_whitespace_check .= (' ').printf('[%s]mixed-indent', l:mixed)
      endif
    endif
  endif
  return b:statusline_whitespace_check
endfunction

function! CustomALEStatusLine()
  let l:ale_status_line = ale#statusline#Status()
  if empty(l:ale_status_line)
    return ''
  endif
  return ' ' . l:ale_status_line . ' '
endfunction

let &statusline = '%< %f[%n] %h%m%r%=%-14.(%l,%c%V%) %P '
set statusline+=%#Error#%{CustomALEStatusLine()}%*
set statusline+=%#Error#%{StatuslineWhitespace()}%*
" Auto commands {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sets the filetype when using CTRL-X CTRL-E in bash
augroup commandeditor
  autocmd!
  autocmd BufRead,BufNewFile bash-* set filetype=sh
augroup END

" Press K to get documentation about a Vim keyword
augroup keywordprg
  autocmd!
  autocmd FileType vim,help setlocal keywordprg=:help
augroup END

" Resize splits when the window is resized
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Only show cursorline in the current buffer, and only in normal mode.
" augroup cursorLine
"   au!
"   au VimEnter,InsertLeave,BufWinEnter * setlocal cursorline
"   au WinLeave,InsertEnter,BufWinLeave * setlocal nocursorline
" augroup END

" When editing a file, always jump to the last known cursor position.
augroup lastposition
  autocmd!
  autocmd BufReadPost *
  \  if &filetype !~ 'svn\|commit\c' |
  \    if line("'\"") > 0 && line("'\"") <= line("$") |
  \      execute 'normal! g`"zvzz' |
  \    endif |
  \  endif
augroup END

" Always close preview window after completion is done.
if has('patch-7.3.598')
  augroup closepreview
    autocmd!
    " autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
    autocmd InsertLeave * pclose
  augroup END
endif
" Filetype settings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plain text
function! SetupPlainText()
  setlocal wrap
  setlocal wrapmargin=2
  setlocal textwidth=79
endfunction

" Python, PEP8: http://www.python.org/dev/peps/pep-0008/
function! SetupPython()
  setlocal textwidth=79
  setlocal foldmethod=indent
  setlocal foldlevel=2
  setlocal foldnestmax=2

  " Highlight 'NOTE' and 'HACK' in comments.
  syn keyword pythonTodo NOTE HACK contained

  " nnoremap <buffer> <silent> gd :YcmCompleter GoTo<CR>
  " nnoremap <buffer> <silent> gd :LspDefinition<CR>
endfunction

augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType text call SetupPlainText()
autocmd vimrc FileType python call SetupPython()

augroup fmt
  autocmd!
  autocmd BufWritePre *.h,*.c,*.cpp,*.js,*.jsx,*.ts,*.tsx ALEFix
augroup END
" Neovim {{{1
if has('nvim')
  " tnoremap <C-b> <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

  " Move between splits using <Alt>
  if empty($TMUX)
    tnoremap <A-Left>  <C-\><C-n><C-w>h
    tnoremap <A-Down>  <C-\><C-n><C-w>j
    tnoremap <A-Up>    <C-\><C-n><C-w>k
    tnoremap <A-Right> <C-\><C-n><C-w>l

    inoremap <A-Left>  <C-\><C-n><C-w>h
    inoremap <A-Down>  <C-\><C-n><C-w>j
    inoremap <A-Up>    <C-\><C-n><C-w>k
    inoremap <A-Right> <C-\><C-n><C-w>l

    nnoremap <A-Left>  <C-w>h
    nnoremap <A-Down>  <C-w>j
    nnoremap <A-Up>    <C-w>k
    nnoremap <A-Right> <C-w>l
  endif
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " Always enter insert mode when focusing a terminal buffer
  augroup term
    autocmd!
    autocmd BufEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
  augroup END

  if !exists('g:terminal_color_0')
    let g:terminal_color_0 = '#2D2D2D'
    let g:terminal_color_1 = '#F2777A'
    let g:terminal_color_2 = '#99CC99'
    let g:terminal_color_3 = '#FFCC66'
    let g:terminal_color_4 = '#6699CC'
    let g:terminal_color_5 = '#CC99CC'
    let g:terminal_color_6 = '#66CCCC'
    let g:terminal_color_7 = '#D3D0C8'
    let g:terminal_color_8 = '#747369'
    let g:terminal_color_9 = '#F2777A'
    let g:terminal_color_10 = '#99CC99'
    let g:terminal_color_11 = '#FFCC66'
    let g:terminal_color_12 = '#6699CC'
    let g:terminal_color_13 = '#CC99CC'
    let g:terminal_color_14 = '#66CCCC'
    let g:terminal_color_15 = '#F2F0EC'
    let g:terminal_color_background = '#2D2D2D'
    let g:terminal_color_foreground = '#D3D0C8'
  endif
endif
" Local settings {{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" https://github.com/neovim/neovim/issues/3495
augroup foldfix
  autocmd!
  autocmd BufRead .vimrc set foldenable foldmethod=marker foldlevel=0
augroup END
" ----- vim: set foldenable foldmethod=marker foldlevel=0:
