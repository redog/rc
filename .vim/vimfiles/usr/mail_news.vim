so $MYVIM/usr/devgen.vim

" Stuff that should be done everytime this file is sourced
" should go below here...

set textwidth=78
vmap \qt           :s/^/><CR>           " quote mails

if exists("loaded_mail_news")
  finish
endif
let loaded_mail_news=1

" Stuff that should be only once should go below here...
