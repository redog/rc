" file:     vim_cmdr.vim
" purpose:  support file for vim_cmdr, when sourced starts a vim_cmdr session
"
" author:   brian m sturk   bsturk@adelphia.net,
"                           http://users.adelphia.net/~bsturk
" created:  06/03/03
" last_mod: 
" version:  see vim_cmdr.py
"
" usage:    :so[urce] vim_cmdr.vim

function! VimCmdrRedraw()
    redraw
endfunction

au FileType vim_commander source <sfile>:p:h/vim_commander.vim
pyfile <sfile>:p:h/vim_cmdr.py
