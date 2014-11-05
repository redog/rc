" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim
so $MYVIM/usr/ccom.vim

set define=^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)

noremap \hf   :call SwitchCH()<CR>

iab #i      #include
iab #d      #define
iab #e      #endif
iab zb      bool

if exists("loaded_cdev")
  finish
endif
let loaded_cdev=1

" Stuff that should be only once should go below here...

so $MYVIM/macros/header_switch.vim
