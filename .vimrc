" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scriptencoding utf-8

" let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" https://github.com/ajmwagar/vim-deus/issues/2
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
" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'
" ap/vim-css-color {{{2
Plug 'ap/vim-css-color', {'for': 'css'}
" AndrewRadev/splitjoin.vim {{{2
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_python_brackets_on_separate_lines = 1
" Completion {{{2
augroup lsp
  autocmd!
augroup END

Plug 'lifepillar/vim-mucomplete'

" Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim'
" Plug 'prabirshrestha/vim-lsp' | Plug 'prabirshrestha/async.vim'

let s:cquery_bin_path = expand('~/.local/cquery/bin/cquery')

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'make release'}
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
      \ 'c': [s:cquery_bin_path, '--language-server'],
      \ 'cpp': [s:cquery_bin_path, '--language-server'],
      \ 'go': ['go-langserver', '-gocodecompletion', '-addr=127.0.0.1:4389'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \}

" nnoremap ,d :LspDefinition<CR>
nnoremap <silent> ,d :call LanguageClient_textDocument_definition()<CR>

let g:jedi#auto_close_doc = 0
let g:jedi#goto_command = ',d'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_splits_not_buffers = 'winwidth'

" https://github.com/lifepillar/vim-mucomplete/issues/85
let g:mucomplete#can_complete = {}
let g:mucomplete#can_complete.python = {'omni': {t -> t =~ '\m\%(\k\k\|\.\)$'}}
let g:mucomplete#can_complete.go = {'omni': {t -> t =~ '\m\%(\k\k\|\.\)$'}}

" Default to Python 3 outside of virtualenvs.
if empty($VIRTUAL_ENV)
  let g:jedi#force_py_version = 3
endif

let g:go_gocode_unimported_packages = 1

let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_complete_auto = 1

" autocmd lsp User lsp_setup call lsp#register_server({
"       \ 'name': 'clangd',
"       \ 'cmd': {server_info->[expand('/usr/local/Cellar/llvm/*/bin/clangd')]},
"       \ 'priority': 9,
"       \ 'whitelist': ['c', 'cpp'],
"       \})
" autocmd lsp FileType c,cpp setlocal omnifunc=lsp#complete

" autocmd lsp User lsp_setup call lsp#register_server({
"       \ 'name': 'cquery',
"       \ 'cmd': {server_info->[expand('~/.local/cquery/bin/cquery'), '--language-server']},
"       \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"       \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"       \ })
" autocmd lsp FileType c,cpp,objc,objcpp setlocal omnifunc=lsp#complete

" if executable('go-langserver')
"   autocmd lsp User lsp_setup call lsp#register_server({
"         \ 'name': 'go-langserver',
"         \ 'cmd': {server_info->['go-langserver', '-gocodecompletion', '-addr=127.0.0.1:4389']},
"         \ 'priority': 9,
"         \ 'whitelist': ['go'],
"         \})
"   autocmd lsp FileType go setlocal omnifunc=lsp#complete
" endif

" if executable('javascript-typescript-stdio')
"   autocmd lsp User lsp_setup call lsp#register_server({
"         \ 'name': 'javascript-typescript-stdio',
"         \ 'cmd': {server_info->['javascript-typescript-stdio']},
"         \ 'priority': 9,
"         \ 'whitelist': ['javascript', 'javascript.jsx', 'typescript'],
"         \})
"   autocmd lsp FileType javascript,javascript.jsx,typescript setlocal omnifunc=lsp#complete
" endif

" if executable('pyls')
"   autocmd lsp User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'priority': 8,
"         \ 'whitelist': ['python'],
"         \})
"   autocmd lsp FileType python setlocal omnifunc=lsp#complete
" endif

" if executable('rls')
"   autocmd lsp User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"         \ 'priority': 9,
"         \ 'whitelist': ['rust'],
"         \})
"   autocmd lsp FileType rust setlocal omnifunc=lsp#complete
" endif
" christoomey/vim-tmux-navigator {{{2
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

if $TERM =~# '^\(xterm\|screen\)\(-.*\)\?$'
  nnoremap <silent> <A-Left> :TmuxNavigateLeft<CR>
  nnoremap <silent> <A-Down> :TmuxNavigateDown<CR>
  nnoremap <silent> <A-Up> :TmuxNavigateUp<CR>
  nnoremap <silent> <A-Right> :TmuxNavigateRight<CR>
endif
" fatih/vim-go {{{2
Plug 'fatih/vim-go'
let g:go_fmt_command = 'goimports'
" junegunn/vim-easy-align {{{2
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
vmap <Enter> <Plug>(EasyAlign)
" justinmk/vim-sneak {{{2
Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
" let g:sneak#s_next = 1

" The conflict with vim-sandwich.
" nmap s <Plug>Sneak_s
" nmap S <Plug>Sneak_S

nmap gs <Plug>Sneak_s
omap gs <Plug>Sneak_s
xmap gs <Plug>Sneak_s
" nmap gS <Plug>Sneak_S
" omap gS <Plug>Sneak_S
" xmap gS <Plug>Sneak_S
" kshenoy/vim-signature {{{2
Plug 'kshenoy/vim-signature'
" ludovicchabant/vim-gutentags {{{2
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_generate_on_empty_buffer = 1
  let g:gutentags_cache_dir = expand('~/.vim/tags')
  let g:gutentags_ctags_exclude = [
        \ '*.min.js',
        \ '*/build/*',
        \ '*/dist/*',
        \ '*/env/*',
        \ '*/lib/*',
        \ '*/lib64/*',
        \ '*/node_modules/*',
        \ '*/third_party/*',
        \ '*/vendor/*',
        \ '*/venv/*',
        \]
  let g:gutentags_file_list_command = {
        \ 'markers': {
        \   '.git': 'git ls-files',
        \ }
        \}
endif
" machakann/vim-sandwich {{{2
Plug 'machakann/vim-sandwich'
" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap ,t :TagbarToggle<CR>
" mbbill/undotree {{{2
Plug 'mbbill/undotree'
" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
let g:grepper = {'tools': ['git', 'rg']}
command! -nargs=+ -complete=file Grep Grepper -noprompt -tool rg -query <args>
command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>
" mhinz/vim-signify {{{2
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']
let g:signify_sign_add = "\u2502"
let g:signify_sign_change = "\u2502"
" plasticboy/vim-markdown {{{2
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
" rust-lang/rust.vim {{{2
Plug 'rust-lang/rust.vim'
" sheerun/vim-polyglot {{{2
Plug 'sheerun/vim-polyglot'
" These are covered by the upstream plugin.
let g:polyglot_disabled = [
      \ 'go',
      \ 'groovy',
      \ 'jenkins',
      \ 'markdown',
      \ 'rust',
      \]
" srstevenson/vim-picker {{{2
Plug 'srstevenson/vim-picker'
nnoremap <silent> <C-p> :PickerEdit<CR>
nnoremap <silent> <C-w><C-p> :PickerSplit<CR>
nnoremap <silent> <C-b> :PickerBuffer<CR>
" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'
map <silent> ,c :Commentary<CR>
" tpope/vim-eunuch {{{2
Plug 'tpope/vim-eunuch'
" tpope/vim-fugitive {{{2
Plug 'tpope/vim-fugitive'
" tpope/vim-repeat {{{2
Plug 'tpope/vim-repeat'
" tpope/vim-sleuth {{{2
Plug 'tpope/vim-sleuth'
" tpope/vim-unimpaired {{{2
Plug 'tpope/vim-unimpaired'
" tpope/vim-vinegar {{{2
Plug 'tpope/vim-vinegar'
" w0rp/ale {{{2
Plug 'w0rp/ale'

let g:ale_linters = {
      \ 'go': ['gofmt', 'golint', 'go vet', 'go build'],
      \ 'rust': ['rustc', 'cargo'],
      \ 'typescript': ['tslint', 'tsserver'],
      \}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'python': ['yapf'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['prettier'],
      \ 'typescript': ['prettier'],
      \}

let g:ale_python_mypy_options = '--ignore-missing-imports'

" let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_sign_error = "\u2716"
let g:ale_sign_warning = "\u267A"
" let g:ale_sign_error = "\u25CF"
" let g:ale_sign_warning = "\u25CF"
" let g:ale_sign_error = 'E>'
" let g:ale_sign_warning = 'W>'
" let g:ale_sign_error = 'E>'
" let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
Plug 'ajmwagar/vim-deus'
Plug 'arcticicestudio/nord-vim',
Plug 'chriskempson/base16-vim'
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
" Plug 'lifepillar/vim-solarized8'
" Plug 'mbbill/vim-seattle'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'owickstrom/vim-colors-paramount'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'
" Plug 'renstrom/vim-hybrid'
" }}}
call plug#end()
" }}}
" Interesting but unused plugins {{{1
" Plug 'dominikduda/vim_current_word'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'junegunn/vim-peekaboo'
" Plug 'osyo-manga/vim-brightest'
" Plug 'sbdchd/neoformat'
" Plug 'srstevenson/vim-picker'
" }}}
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

" Make sure dark background is used for colorschemes.
set background=dark

if has('termguicolors')
  set termguicolors
  " let g:jellybeans_overrides = {
  "       \ 'background': {'ctermbg': 'none', 'guibg': 'none'},
  "       \ 'SpecialKey': {'ctermfg': '238', 'ctermbg': 'none', 'guifg': '444444', 'guibg': 'none'},
  "       \ 'ALEErrorSign': {'ctermfg': '1', 'ctermbg': '242', 'guifg': '902020', 'guibg': '333333'},
  "       \ 'ALEWarningSign': {'ctermfg': '121', 'ctermbg': '242', 'guifg': 'ffb964', 'guibg': '333333'},
  "       \}

  function! s:base16_customize() abort
    call Base16hi('ALEErrorSign', g:base16_gui08, g:base16_gui01, g:base16_cterm01, g:base16_cterm08, '', '')
  endfunction

  augroup on_change_colorschema
    autocmd!
    autocmd ColorScheme * call s:base16_customize()
  augroup END

  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_comment_brightness = 15

  " let g:gruvbox_bold = 1
  " let g:gruvbox_italic = 1
  " let g:gruvbox_underline = 1
  " let g:gruvbox_undercurl = 1

  let g:onedark_terminal_italics = 1
  let g:one_allow_italics = 1

  colorscheme base16-eighties
else
  colorscheme hybrid
endif

" Stop the sh syntax file from highlighting $(...) as errors.
" :h ft-sh-syntax.
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
" whitespace errors.
" :h ft-python-syntax
let g:python_highlight_all = 1

" The g:lisp_rainbow option provides 10 levels of individual colorization for
" the parentheses and backquoted parentheses.
" :h ft-lisp-syntax
let g:lisp_rainbow = 1

" Don't try to highlight lines longer than 400 characters.
set synmaxcol=400

" Automatically save when moving between buffers (and more).
set autowrite

" When formatting text, recognize numbered lists.
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

" Round indent to multiple of 'shiftwidth'.
set shiftround

" menuone   Use the popup menu also when there is only one match.
"
" preview   Show extra information about the currently selected
"           completion in the preview window.
"
" noselect  Do not select a match in the menu, force the user to
"           select one from the menu.
set completeopt=menuone,preview,noselect

" Include line numbers in grep format.
set grepformat^=%f:%l:%c:%m

if executable('rg')
  let &grepprg = 'rg --vimgrep'
else
  let &grepprg = 'grep -Inr $* /dev/null'
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

" Shows the effects of a command incrementally, as you type.
" Also shows partial off-screen results in a preview window.
if exists('&inccommand')
  set inccommand=split
endif

" Enable list mode. See 'listhars'.
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:+

set fillchars=vert:│,fold:·

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
" set number

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
" Mappings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Repeat the last recorded macro.
nnoremap Q @@

" Copy to clipboard.
vnoremap <C-c> "*y"

" Toggle fold under cursor.
noremap <Space> za

" Don't move on '*', useful when highlighting words.
nnoremap * *<C-o>

" List buffers and wait for input.
nnoremap ,b :ls<CR>:buffer<Space>

" Display all lines that contain the keyword under the cursor and then waits
" to select one to jump to.
function! Occurrences()
  execute 'normal [I'
  let l:nr = input("Type number and \<Enter\> (empty cancels): ")
  if l:nr
    execute 'normal ' . l:nr . '[\t'
  endif
endfunction
nnoremap ,i :call Occurrences()<CR>
" nnoremap ,i [I:let nr = input("Type number and \<Enter\>: ")<Bar>exe "normal " . nr ."[\t"<CR>

" https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2qo4k/
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
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
  let [l:error_format, l:warning_format, l:no_errors] = ["\u2716 %d", "\u267A %d", '']
  let l:counts = ale#statusline#Count(bufnr(''))

  " Build strings based on user formatting preferences.
  let l:errors = l:counts[0] ? printf(l:error_format, l:counts[0]) : ''
  let l:warnings = l:counts[1] ? printf(l:warning_format, l:counts[1]) : ''

  " Different formats based on the combination of errors and warnings.
  if empty(l:errors) && empty(l:warnings)
    let l:res = l:no_errors
  elseif !empty(l:errors) && !empty(l:warnings)
    let l:res = printf('%s %s', l:errors, l:warnings)
  else
    let l:res = empty(l:errors) ? l:warnings : l:errors
  endif

  if empty(l:res)
    return ''
  endif

  return ' ' . l:res . ' '
endfunction

let &statusline = '%< %f %h%m%r%=%-14.(%l,%c%V%) %P '
if &runtimepath =~# 'ale'
  set statusline+=%#Error#%{CustomALEStatusLine()}%*
endif
set statusline+=%#Error#%{StatuslineWhitespace()}%*
" Auto commands {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Resize splits when the window is resized
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" When editing a file, always jump to the last known cursor position.
augroup lastposition
  autocmd!
  autocmd BufReadPost *
        \ if &filetype !~ 'svn\|commit\c' |
        \   if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \   endif |
        \ endif
augroup END

" Only show cursorline in the current buffer, and only in normal mode.
if exists('+cursorline')
  augroup cursorLine
    autocmd!
    autocmd VimEnter,InsertLeave,BufEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave,InsertEnter,BufLeave,BufWinLeave * setlocal nocursorline
  augroup END
endif

" Always close preview window after completion is done.
if has('patch-7.3.598')
  augroup closepreview
    autocmd!
    " autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
    " autocmd! InsertLeave <buffer> if pumvisible() == 0 | pclose | endif
    autocmd! InsertLeave * if pumvisible() == 0 | pclose | endif
  augroup END
endif
" Filetype settings {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! SetupPython()
  setlocal foldmethod=indent foldlevel=2 foldnestmax=2 textwidth=79
endfunction

augroup vimrc
  autocmd!
  autocmd FileType text setlocal textwidth=79
  autocmd FileType python call SetupPython()
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
