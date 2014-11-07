if exists("b:did_vim_commander_ftplugin") | finish | endif
let b:did_vim_commander_ftplugin = 1

setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile
setlocal tabstop=8
setlocal modifiable
setlocal nowrap
setlocal textwidth=999

source <sfile>:p:h/vim_cmdr_keys.vim
