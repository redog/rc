" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim
so $MYVIM/usr/shcom.vim

iab zc    case "TODO" in<CR>case1)<CR>TODO_LOGIC<CR>;;<CR>*)<CR>TODO_LOGIC<CR>;;<CR>esac<CR>
iab ze    echo " "<C-O>2h
iab zf    forTODO_STUFF in TODO_STUFF<CR>do<CR><CR>done<CR><Up><Up><Up><Up><C-O>fT
iab zF    function TODO_NAME<CR>{<CR><CR>}<Up><Up><Up><C-O>fT<Esc>
iab zi    if [  ]; then<CR><CR>fi<CR><Up><Up><Up><C-O>f[<Right>
iab zw    while ; do<CR><CR>done<CR><Up><Up><Up><C-O>f 
iab zeof  cat >TODO_FILENAME << "EOF"<CR><CR>EOF<Up><Up><C-O>fT

if exists("loaded_sh")
  finish
endif
let loaded_sh=1

" Stuff that should be only once should go below here...
