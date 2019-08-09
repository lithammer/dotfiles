" Environment {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
scriptencoding utf-8

let g:python_host_prog = '/usr/local/bin/python2'
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
" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'
" Completion {{{2
Plug 'lifepillar/vim-mucomplete'

Plug 'davidhalter/jedi-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Disable diagnostics, it's handled by Ale.
let g:lsp_diagnostics_enabled = 0

" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'make release'}
if has('nvim')
  let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
endif
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_serverCommands = {
      \ 'c': ['cquery'],
      \ 'cpp': ['cquery'],
      \ 'go': ['go-langserver', '-gocodecompletion'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'rust': ['rustup', 'run', 'stable', 'rls'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \}

nnoremap <silent> ,d :LspDefinition<CR>
" nnoremap <silent> ,d :call LanguageClient_textDocument_definition()<CR>

let g:jedi#auto_close_doc = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = ',d'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_splits_not_buffers = 'winwidth'

" https://github.com/lifepillar/vim-mucomplete/issues/85
let g:mucomplete#can_complete = {}
" let g:mucomplete#can_complete.python = {'omni': {t -> t =~ '\m\%(\k\k\|\.\)$'}}
let g:mucomplete#can_complete.go = {'omni': {t -> t =~ '\m\%(\k\k\|\.\)$'}}

let g:go_gocode_unimported_packages = 1

" augroup lsp_clangd
"   autocmd!
"   autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->[expand('/usr/local/Cellar/llvm/*/bin/clangd')]},
"         \ 'priority': 9,
"         \ 'whitelist': ['c', 'cpp'],
"         \})
"   autocmd FileType c,cpp setlocal omnifunc=lsp#complete
" augroup END

" if executable('cquery')
"   augroup lsp_cquery
"     autocmd!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'cquery',
"           \ 'cmd': {server_info->['cquery']},
"           \ 'priority': 9,
"           \ 'root_uri': {server_info->lsp#utils#path_to_uri(
"           \   lsp#utils#find_nearest_parent_file_directory(
"           \     lsp#utils#get_buffer_path(), '.cquery'))},
"           \ 'initialization_options': {'cacheDirectory': expand('~/.cache/cquery')},
"           \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"           \ })
"     autocmd FileType c,cpp,objc,objcpp setlocal omnifunc=lsp#complete
"   augroup END
" endif

if executable('ccls')
  augroup lsp_ccls
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'ccls',
          \ 'cmd': {server_info->['ccls']},
          \ 'priority': 9,
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(
          \   lsp#utils#find_nearest_parent_file_directory(
          \     lsp#utils#get_buffer_path(), '.ccls'))},
          \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls')}},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
          \ })
    autocmd FileType c,cpp,objc,objcpp setlocal omnifunc=lsp#complete
  augroup END
endif

" if executable('gopls')
"   augroup lsp_gopls
"     autocmd!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'gopls',
"           \ 'cmd': {server_info->['gopls']},
"           \ 'priority': 9,
"           \ 'whitelist': ['go'],
"           \})
"     autocmd FileType go setlocal omnifunc=lsp#complete
"   augroup END
" endif

if executable('javascript-typescript-stdio')
  augroup lsp_javascript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'javascript-typescript-stdio',
          \ 'cmd': {server_info->['javascript-typescript-stdio']},
          \ 'priority': 9,
          \ 'whitelist': ['javascript', 'javascript.jsx', 'typescript'],
          \})
    autocmd FileType javascript,javascript.jsx,typescript setlocal omnifunc=lsp#complete
  augroup END
endif

" if executable('pyls')
"   augroup lsp_python
"     autocmd!
"     autocmd User lsp_setup call lsp#register_server({
"           \ 'name': 'pyls',
"           \ 'cmd': {server_info->['pyls']},
"           \ 'priority': 8,
"           \ 'whitelist': ['python'],
"           \})
"     autocmd FileType python setlocal omnifunc=lsp#complete
"   augroup END
" endif

if executable('rls')
  augroup lsp_rust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'rls',
          \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
          \ 'priority': 9,
          \ 'initialization_options': {'rust': {'clippy_preference': 'on'}},
          \ 'whitelist': ['rust'],
          \})
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif
" christoomey/vim-tmux-navigator {{{2
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

if $TERM =~# '^\(xterm\|screen\)\(-.*\)\?$'
  nnoremap <silent> <A-Left> :TmuxNavigateLeft<CR>
  nnoremap <silent> <A-Down> :TmuxNavigateDown<CR>
  nnoremap <silent> <A-Up> :TmuxNavigateUp<CR>
  nnoremap <silent> <A-Right> :TmuxNavigateRight<CR>
endif
" dense-analysis/ale {{{2
Plug 'dense-analysis/ale'

let g:ale_linters = {
      \ 'c': ['ccls'],
      \ 'cpp': ['ccls'],
      \ 'ansible': ['ansible'],
      \ 'go': ['gofmt', 'golint', 'go vet', 'go build'],
      \ 'rust': ['rustc', 'cargo'],
      \ 'typescript': ['tslint', 'tsserver'],
      \}

" Let another plugin handle LSP.
" let g:ale_disable_lsp = 1

let g:ale_cpp_ccls_init_options = {'cache': {'directory': expand('~/.cache/ccls')}}

" :help ale-typescript-tslint
" let g:ale_linters_ignore = {
"       \ 'c': ['gcc', 'clang'],
"       \ 'typescript': ['tslint'],
"       \}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'python': ['black'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['prettier'],
      \ 'typescript': ['prettier'],
      \}

augroup ale
  autocmd!
  " Default to --line-length=79 if pyproject.toml is missing.
  autocmd VimEnter *
        \ if empty(ale#path#FindNearestFile('%', 'pyproject.toml')) |
        \   let g:ale_python_black_options = '--line-length=79' |
        \ endif
augroup END
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_sh_shfmt_options = '-i=4 -ci'

let g:ale_virtualtext_cursor = 1
" let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_sign_error = "\u2716"
" let g:ale_sign_warning = "\u267A"
" let g:ale_sign_error = "\u25CF"
" let g:ale_sign_warning = "\u25CF"
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
" let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" https://github.com/desmap/ale-sensible
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
" augroup alesensible
"   autocmd!
"   autocmd VimEnter,BufEnter,ColorScheme *
"         \ exec "hi! ALEInfoLine
"           \ guifg=".(&background=='light'?'#808000':'#ffff00')."
"           \ guibg=".(&background=='light'?'#ffff00':'#555500') |
"         \ exec "hi! ALEWarningLine
"           \ guifg=".(&background=='light'?'#808000':'#ffff00')."
"           \ guibg=".(&background=='light'?'#ffff00':'#555500') |
"         \ exec "hi! ALEErrorLine
"           \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
"           \ guibg=".(&background=='light'?'#ffcccc':'#550000')
" augroup END
" fatih/vim-go {{{2
Plug 'fatih/vim-go'
let g:go_def_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_info_mode = 'gopls'
let g:go_metalinter_command = 'golangci-lint'
" junegunn/vim-easy-align {{{2
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
vmap <Enter> <Plug>(EasyAlign)
" justinmk/vim-sneak {{{2
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
" let g:sneak#s_next = 1

" This conflicts with vim-sandwich.
" nmap s <Plug>Sneak_s
" nmap S <Plug>Sneak_S

nmap gs <Plug>Sneak_s
omap gs <Plug>Sneak_s
xmap gs <Plug>Sneak_s
nmap gS <Plug>Sneak_S
omap gS <Plug>Sneak_S
xmap gS <Plug>Sneak_S

nmap ss <Plug>Sneak_s
omap ss <Plug>Sneak_s
xmap ss <Plug>Sneak_s
nmap SS <Plug>Sneak_S
omap SS <Plug>Sneak_S
xmap SS <Plug>Sneak_S
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

" https://github.com/machakann/vim-sandwich/issues/62
let g:textobj_sandwich_no_default_key_mappings = 1
" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
" mbbill/undotree {{{2
Plug 'mbbill/undotree'
" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
" Browse input history.
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
nnoremap ,g :Grepper<CR>
" command! -nargs=+ -complete=file Grep Grepper -noprompt -tool rg -query <args>
" command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>
" mhinz/vim-signify {{{2
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']
let g:signify_sign_add = "\u2502"
let g:signify_sign_change = "\u2502"
" michaeljsmith/vim-indent-object {{{2
Plug 'michaeljsmith/vim-indent-object'
" numirias/semshi {{{2
Plug 'numirias/semshi'
let g:semshi#error_sign = v:false
" romainl/vim-cool {{{2
" Plug 'romainl/vim-cool'
" rust-lang/rust.vim {{{2
Plug 'rust-lang/rust.vim'
" sheerun/vim-polyglot {{{2
Plug 'sheerun/vim-polyglot'
" These are covered by the upstream plugin.
let g:polyglot_disabled = [
      \ 'go',
      \ 'graphql',
      \ 'groovy',
      \ 'jenkins',
      \ 'rust',
      \]
" srstevenson/vim-picker {{{2
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
" nnoremap <silent> <C-p> :FzfFiles<CR>

Plug 'srstevenson/vim-picker'
nmap <C-p> <Plug>(PickerEdit)
nmap <C-w><C-p> <Plug>(PickerSplit)
nmap ,t <Plug>(PickerTag)
nmap <C-w>,t <Plug>(PickerStag)
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
" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'
" }}}

" Colorschemes {{{2
Plug 'lifepillar/vim-colortemplate'

" Plug 'ajmwagar/vim-deus'
" Plug 'andreypopp/vim-colors-plain'
" Plug 'arcticicestudio/nord-vim',
Plug 'axvr/photon.vim'
" Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}
Plug 'cormacrelf/vim-colors-github'
Plug 'chriskempson/base16-vim'
" Plug 'cocopon/iceberg.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
" Plug 'junegunn/seoul256.vim'
Plug 'ldelossa/vimdark'
Plug 'lifepillar/vim-gruvbox8'
" Plug 'lifepillar/vim-solarized8'
Plug 'lithammer/vim-eighties'
" Plug 'mbbill/vim-seattle'
Plug 'mhinz/vim-janah'
" Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'owickstrom/vim-colors-paramount'
" Plug 'rakr/vim-one'
" Plug 'romainl/Apprentice'
" Plug 'rainglow/vim', {'as': 'rainglow-vim'}
Plug 'srcery-colors/srcery-vim'
" Plug 'tyrannicaltoucan/vim-quantum'
Plug 'w0ng/vim-hybrid'
" }}}
call plug#end()
" }}}
" Interesting but unused plugins {{{1
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'junegunn/vim-peekaboo'
" Plug 'srstevenson/vim-picker'
" Plug 'tpope/vim-apathy'
" }}}
" Options {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use :help 'option' or press 'K' while having the cursor on the option to see
" documention about it.

if has('termguicolors')
  set termguicolors

  let g:jellybeans_overrides = {
        \ 'background': {'ctermbg': 'none', 'guibg': 'none'},
        \ 'SpecialKey': {'ctermfg': '238', 'ctermbg': 'none', 'guifg': '444444', 'guibg': 'none'},
        \ 'ALEErrorSign': {'ctermfg': '1', 'ctermbg': '242', 'guifg': '902020', 'guibg': '333333'},
        \ 'ALEWarningSign': {'ctermfg': '121', 'ctermbg': '242', 'guifg': 'ffb964', 'guibg': '333333'},
        \ 'User1': {'ctermbg': '4', 'guibg': '437019', 'attr': 'italic'},
        \ 'User2': {'ctermfg': '0', 'ctermbg': '121', 'guifg': '000000', 'guibg': 'ffb964', 'attr': 'italic'},
        \ 'User3': {'ctermbg': '1', 'guibg': '902020', 'attr': 'italic'},
        \}

  function! s:base16_customize() abort
    call Base16hi('WildMenu', g:base16_gui01, g:base16_gui0A, g:base16_cterm01, g:base16_cterm0A, '', '')
    call Base16hi('ALEErrorSign', g:base16_gui08, g:base16_gui01, g:base16_cterm01, g:base16_cterm08, '', '')
    call Base16hi('ALEWarningSign', g:base16_gui0A, g:base16_gui01, g:base16_cterm01, g:base16_cterm0A, '', '')
    call Base16hi('ALEVirtualTextError', g:base16_gui03, '', g:base16_cterm03, '', '',  '')
    call Base16hi('ALEVirtualTextInfo', g:base16_gui03, '', g:base16_cterm03, '', '',  '')
    call Base16hi('ALEVirtualTextStyleError', g:base16_gui03, '', g:base16_cterm03, '', '',  '')
    call Base16hi('ALEVirtualTextStyleWarning', g:base16_gui03, '', g:base16_cterm03, '', '',  '')
    call Base16hi('ALEVirtualTextWarning', g:base16_gui03, '', g:base16_cterm03, '', '',  '')

    call Base16hi('User1', g:base16_gui0B, g:base16_gui02, g:base16_cterm04, g:base16_cterm0B, '', '')
    call Base16hi('User2', g:base16_gui0A, g:base16_gui02, g:base16_cterm04, g:base16_cterm0A, '', '')
    call Base16hi('User3', g:base16_gui08, g:base16_gui02, g:base16_cterm04, g:base16_cterm08, '', '')
    call Base16hi('User4', g:base16_gui0C, g:base16_gui02, g:base16_cterm04, g:base16_cterm0C, '', '')

    call Base16hi('StatusLineOk', g:base16_gui0B, g:base16_gui02, g:base16_cterm04, g:base16_cterm0B, '', '')
    call Base16hi('StatusLineWarning', g:base16_gui0A, g:base16_gui02, g:base16_cterm04, g:base16_cterm0A, '', '')
    call Base16hi('StatusLineError', g:base16_gui08, g:base16_gui02, g:base16_cterm04, g:base16_cterm08, '', '')
    call Base16hi('StatusLineWhitespace', g:base16_gui0C, g:base16_gui02, g:base16_cterm04, g:base16_cterm0C, '', '')
  endfunction

  function! s:janah_customize() abort
    highlight link Whitespace SpecialKey
    highlight Normal guibg=NONE

    highlight ALEErrorSign ctermfg=167 ctermbg=237 guifg=#df5f5f guibg=#3a3a3a
    highlight ALEWarningSign ctermfg=223 ctermbg=237 guifg=#ffdfaf guibg=#3a3a3a
    highlight ALEVirtualTextError ctermfg=244 ctermbg=236 guifg=#808080 guibg=#303030
    highlight ALEVirtualTextInfo ctermfg=244 ctermbg=236 guifg=#808080 guibg=#303030
    highlight ALEVirtualTextStyleError ctermfg=244 ctermbg=236 guifg=#808080 guibg=#303030
    highlight ALEVirtualTextStyleWarning ctermfg=244 ctermbg=236 guifg=#808080 guibg=#303030
    highlight ALEVirtualTextWarning ctermfg=244 ctermbg=236 guifg=#808080 guibg=#303030

    highlight User1 ctermfg=119 ctermbg=237 guifg=#87ff5f guibg=#3a3a3a
    highlight User2 ctermfg=227 ctermbg=237 guifg=#ffff5f guibg=#3a3a3a
    highlight User3 ctermfg=167 ctermbg=237 guifg=#df5f5f guibg=#3a3a3a
    highlight User4 ctermfg=6 ctermbg=237 guifg=Cyan guibg=#3a3a3a

    highlight StatusLineOk ctermfg=119 ctermbg=237 guifg=#87ff5f guibg=#3a3a3a
    highlight StatusLineWarning ctermfg=227 ctermbg=237 guifg=#ffff5f guibg=#3a3a3a
    highlight StatusLineError ctermfg=167 ctermbg=237 guifg=#df5f5f guibg=#3a3a3a
    highlight StatusLineWhitespace ctermfg=6 ctermbg=237 guifg=Cyan guibg=#3a3a3a
  endfunction

  function! s:gruvbox_customize() abort
     highlight link User1 DiffAdd
     highlight link User2 IncSearch
     highlight link User3 DiffDelete
     highlight link User4 DiffChange

     highlight SignifySignAdd guibg=#3c3836
     highlight SignifySignChange guibg=#3c3836
     highlight SignifySignDelete guibg=#3c3836
     highlight SignifySignChangeDelete guibg=#3c3836
     highlight SignifySignDeleteFirstLine guibg=#3c3836
  endfunction

  function! s:photon_customize() abort
    highlight Normal ctermfg=251 ctermbg=NONE guifg=#c6c6c6 guibg=NONE
    highlight NonText ctermfg=237 ctermbg=NONE guifg=#3a3a3a guibg=NONE
    highlight Cursor cterm=reverse gui=reverse ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
    highlight User1 ctermfg=119 ctermbg=237 guifg=#87ff5f guibg=#3a3a3a
    highlight User2 ctermfg=227 ctermbg=237 guifg=#ffff5f guibg=#3a3a3a
    highlight User3 ctermfg=167 ctermbg=237 guifg=#df5f5f guibg=#3a3a3a
    highlight User4 ctermfg=6 ctermbg=237 guifg=Cyan guibg=#3a3a3a
  endfunction

  function! s:eighties_customize() abort
     highlight User1 ctermbg=0 guifg=#99cc99 guibg=#2d2d2d gui=reverse cterm=reverse
     highlight User2 ctermbg=0 guifg=#f99157 guibg=#2d2d2d gui=reverse cterm=reverse
     highlight User3 ctermbg=0 guifg=#f2777a guibg=#2d2d2d gui=reverse cterm=reverse
     highlight User4 ctermbg=0 guifg=#66cccc guibg=#2d2d2d gui=reverse cterm=reverse
  endfunction

  augroup colorschemeload
    autocmd!
    autocmd ColorScheme base16-eighties call s:base16_customize()
    autocmd ColorScheme eighties call s:eighties_customize()
    autocmd ColorScheme janah call s:janah_customize()
    autocmd ColorScheme gruvbox* call s:gruvbox_customize()
    autocmd ColorScheme allomancer highlight Cursor guifg=bg guibg=fg
    autocmd ColorScheme photon call s:photon_customize()

    autocmd FileType python highlight semshiSelected ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE gui=undercurl
    " autocmd FileType python highlight semshiImported cterm=bold ctermfg=NONE gui=bold guifg=NONE
  augroup END

  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1

  let g:gruvbox_contrast_dark = 'soft'
  let g:gruvbox_italic = 1
  let g:gruvbox_improved_strings = 1
  let g:gruvbox_improved_warnings = 1

  let g:gruvbox_filetype_hi_groups = 1
  let g:gruvbox_plugin_hi_groups = 1
  let g:gruvbox_italic = 1

  let g:onedark_terminal_italics = 1
  let g:one_allow_italics = 1

  " let g:hybrid_reduced_contrast = 1

  let g:seoul256_background = 235

  let g:quantum_black = 1
  let g:quantum_italics = 1

  let g:deus_italic = 1

  " Make sure dark background is used for colorschemes.
  set background=dark
  colorscheme eighties
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

if has('nvim-0.3.2') || has('patch-8.1.0360')
  set diffopt+=algorithm:histogram,indent-heuristic
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

set wildignore=*.o
if has('patch-7.4.156')
  set wildignore+=netrw_gitignore#Hide()
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
function! Occurrences() abort
  execute 'normal [I'
  let l:nr = input("Type number and \<Enter\> (empty cancels): ")
  if l:nr
    execute 'normal ' . l:nr . '[\t'
  endif
endfunction
nnoremap <silent> ,i :call Occurrences()<CR>
" nnoremap ,i [I:let nr = input("Type number and \<Enter\>: ")<Bar>exe "normal " . nr ."[\t"<CR>

" https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2qo4k/
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
" Statusline {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if has('statusline')
  augroup statuslinewhitespace
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_whitespace_check
  augroup END

  function! s:StatuslineWhitespace() abort
    if &readonly || !&modifiable || line('$') > 20000
      return ''
    endif

    if exists('b:statusline_whitespace_check')
      return b:statusline_whitespace_check
    endif

    let l:trailing = search('\s$', 'nw')
    let l:mixed = search('\v(^\t+ +)|(^ +\t+)', 'nw')

    if l:trailing != 0
      let b:statusline_whitespace_check = l:trailing
    elseif l:mixed != 0
      let b:statusline_whitespace_check = l:mixed
    else
      let b:statusline_whitespace_check = ''
    endif

    return b:statusline_whitespace_check
  endfunction

  function! StatusLine() abort
    let l:status_line = '%<%f %h%m%r%=%-14.(%l,%c%V%) %P'

    if &runtimepath =~# 'ale'
      let l:ale = ale#statusline#Count(bufnr(''))
      if l:ale.error + l:ale.style_error > 0
        let l:status_line .= ' %3*err%*'
      elseif l:ale.warning + l:ale.style_warning > 0
        let l:status_line .= ' %2*warn%*'
      else
        let l:status_line .= ' %1*ok%*'
      endif
    endif

    let l:ws = s:StatuslineWhitespace()
    if l:ws > 0
      let l:status_line .= ' %4*ws:' . l:ws . '%*'
    endif

    return l:status_line
  endfunction

  set statusline=%!StatusLine()
endif
" Auto commands {{{1
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Resize splits when the window is resized
augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" When editing a file, always jump to the last known cursor position.
" :h last-position-jump
augroup lastpositionjump
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
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
augroup vimrc
  autocmd!
  autocmd FileType python setlocal foldmethod=indent foldlevel=2 foldnestmax=2 textwidth=79
  autocmd FileType text setlocal textwidth=79
  autocmd FileType markdown setlocal conceallevel=2 textwidth=79
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
