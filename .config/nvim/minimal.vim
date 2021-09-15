set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

packadd! sonokai

packadd vim-commentary
packadd vim-polyglot
packadd vim-qf
packadd vim-sensible

nmap ]q <Plug>(qf_qf_next)
nmap [q <Plug>(qf_qf_previous)
nmap ]l <Plug>(qf_loc_next)
nmap [l <Plug>(qf_loc_previous)

nnoremap <silent> <Plug>(next_conflict_marker) :<C-U>call <SID>search_conflict_marker(0)<CR>
nnoremap <silent> <Plug>(prev_conflict_marker) :<C-U>call <SID>search_conflict_marker(1)<CR>
nmap ]n <Plug>(next_conflict_marker)
nmap [n <Plug>(prev_conflict_marker)

function! s:search_conflict_marker(reverse) abort
  call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
endfunction

set termguicolors
set background=dark
let g:sonokai_style = 'shusia'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:sonokai_better_performance = 1
if $TERM_PROGRAM ==? 'iTerm.app'
  colorscheme plain
else
  colorscheme sonokai
endif

set breakindent
set breakindentopt=shift:2
set completeopt=menuone
set diffopt+=algorithm:histogram,indent-heuristic
set formatoptions+=1j
set grepprg=rg\ --vimgrep
set hlsearch
set inccommand=split
set incsearch
set nowrapscan
set path+=src/**
let &showbreak = "\u21AA "
set wildignorecase
set wildmode=list:lastused,list:full

function! s:stdpath(what) abort
  if !has('nvim')
    return expand('~/.vim')
  endif
  return stdpath(a:what)
endfunction

let &directory = s:stdpath('data') . '/swap'
if !isdirectory(&directory)
  call mkdir(&directory)
endif

let &backupdir = s:stdpath('data') . '/backup'
if !isdirectory(&backupdir)
  call mkdir(&backupdir)
endif

if has('persistent_undo')
  let &undodir = s:stdpath('data') . '/undo'
  if !isdirectory(&undodir)
    call mkdir(&undodir)
  endif
endif

augroup autoresize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" :h last-position-jump
augroup lastpositionjump
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END
