unlet b:current_syntax
syn include @Lua syntax/lua.vim
syn region embedlua matchgroup=vimEmbedError start="^lua << EOF$" end="^EOF$" keepend contains=@Lua
let b:current_syntax = 'vim'
