" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim
so $MYVIM/usr/ccom.vim

set include=^#\s*import 
set includeexpr=substitute(v:fname,'\\.','/','g')

if !has("unix")
    set shellpipe=>\ %s\ 2>&1
endif

set makeprg=javac\ %
set makeef=err
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

iab zb      boolean
iab zF      finally<CR>{<CR>}<Up><CR><BS>
iab #i      import
iab #p      package
iab zpr     System.out.println( );<C-O>2h
iab zS      static

"let java_highlight_functions="style"
let java_highlight_java_lang_ids=1
let java_allow_cpp_keywords=1

":map <f2> :exe'%!java Jindent'\|if shell_error\|undo\|endif
":set report=999999 

if exists("loaded_java")
  finish
endif
let loaded_java=1

" Stuff that should be only once should go below here...
