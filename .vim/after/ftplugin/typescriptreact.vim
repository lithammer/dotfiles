" Remove node_modules from path because it slows down :find too much.
" https://github.com/HerringtonDarkholme/yats.vim/blob/4d76c5391b7975bd6dd09c0562c0fd4d78e14fa0/ftplugin/typescript.vim#L32
setlocal path-=./node_modules/**,node_modules/**
setlocal path+=src/**

let b:coc_root_patterns = ['tsconfig.json', 'package.json', '.git']
