" let g:python_host_prog = '/usr/local/bin/python2'
" let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0
let g:python3_host_prog = expand('~/.local/share/nvim/venv/bin/python')

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" :h lua-highlight
autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()

packadd nvim-treesitter
lua require("treesitter")
if 0
  packadd lsp-status.nvim
  packadd lsp_extensions.nvim
  packadd nvim-cmp
  packadd nvim-colorizer.lua
  packadd nvim-diagnosticls
  packadd nvim-lspconfig
  packadd nvim-treesitter
  packadd vim-lsp-python
  packadd vim-vsnip
  packadd zen-mode.nvim

  function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
      return luaeval("require('lsp-status').status()")
    endif
    return ''
  endfunction

  set statusline=%<%f\ %h%m%r%{LspStatus()}%=%-14.(%l,%c%V%)\ %P

  highlight link LspReferenceRead CursorColumn
  highlight link LspReferenceText CursorColumn
  highlight link LspReferenceWrite CursorColumn

  if &runtimepath =~? 'nvim-compe'
    inoremap <silent><expr> <CR> compe#confirm('<CR>')
    inoremap <silent><expr> <C-e> compe#close('<C-e>')
    inoremap <silent><expr> <C-f> compe#scroll({'delta': +4})
    inoremap <silent><expr> <C-b> compe#scroll({'delta': -4})
  endif

  lua require("init")
end

if has('gui_vimr')
  colorscheme photon

  set laststatus=1

  set guioptions-=m  " Menu bar.
  set guioptions-=r  " Right-hand scrollbar.
  set guioptions-=L  " Left-hand scrollbar.
  set guioptions-=T  " Toolbar.
endif
set guifont=PragmataPro\ Liga:h14
