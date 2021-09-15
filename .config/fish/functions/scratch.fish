function scratch -d 'Open scratch buffer'
    # :help special-buffers
    nvim +'setl buftype=nofile bufhidden=hide noswapfile'
end

