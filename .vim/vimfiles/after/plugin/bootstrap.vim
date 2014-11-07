if has("autocmd")  " must be done first for some reason
    so $MYVIM/usr/au.vim
    filetype plugin indent on
endif

if has("syntax") 
    syntax on
endif    

colorscheme bms_dark

so $MYVIM/usr/norm.vim
