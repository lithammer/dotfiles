scriptencoding utf-8

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
" let g:loaded_python3_provider = 1
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = expand('~/.local/share/nvim/venv/bin/python')

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if v:progname ==# 'nv' && filereadable(expand('~/.vim/minimal.vim'))
  " source stdpath('config') . '/minimal.vim'
  source ~/.vim/minimal.vim
  finish
endif

source ~/.vim/vimrc

" packadd nvim-treesitter
" lua require("treesitter")

" :h lua-highlight
autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()

packadd plenary.nvim
packadd telescope.nvim
packadd telescope-coc.nvim

lua <<EOF
local telescope = require('telescope')
telescope.load_extension('coc')
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<Esc>'] = require('telescope.actions').close,
      },
    }
  }
})
EOF

nnoremap <C-p> <cmd>Telescope find_files theme=ivy<cr>

packadd diffview.nvim
lua <<EOF
local cb = require('diffview.config').diffview_callback
require('diffview').setup({
  use_icons = false,
  ['diffview-config-enhanced_diff_hl'] = true
})
EOF

" set fillchars+=diff:╱
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
      return luaeval('require("lsp-status").status()')
    endif
    return ''
  endfunction

  set statusline=%<%f\ %h%m%r%{LspStatus()}%=%-14.(%l,%c%V%)\ %P

  highlight link LspReferenceRead CursorColumn
  highlight link LspReferenceText CursorColumn
  highlight link LspReferenceWrite CursorColumn

  lua require('init')
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
