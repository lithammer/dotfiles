function ll -w exa --description 'List contents of directory using long format'
    set -x EXA_COLORS ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:sn=0:sb=0:uu=0:un=0:da=0
    exa --long $argv
end
