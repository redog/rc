" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim
so $MYVIM/usr/shcom.vim

set makeprg=perl\ -w\ %
set shellpipe=2>&1\|tee\ /tmp/perlerr
set errorfile=/tmp/perlerr
set errorformat=%m\ at\ %f\ line\ %l\%*[,.]

iab ze      else<CR>{<CR>}<Up><CR>
iab zE      elsif ( )<CR>{<CR><CR>}<Up><Up><Up><C-O>f(<Right>
iab zf      foreach( )<CR>{<CR><CR>}<C-O><Up><Up><Up><C-O>f(<Right>
iab zi      if( )<CR>{<CR><CR>}<C-O><Up><Up><Up><C-O>f(<Right>
iab zp      print;<Left>
iab zw      while( )<CR>{<CR><CR>}<C-O><Up><Up><Up><C-O>f(<Right>

if exists("loaded_perl")
  finish
endif
let loaded_perl=1

" Stuff that should be only once should go below here...
