"
" *************************************************************
" Filename : $HOME/vim/myfiletypes.vim
" See the document by typing :help autocmd within vim session
" see also the doc at /usr/share/vim/doc/autocmd.txt
" This file will setup the autocommands for new filetypes 
" using the existing syntax-filetypes.
" For example when you open foo.prc it will use syntax of plsql
" Basically does :set filetype=prc inside vim
" Add a line in $HOME/.gvimrc as below:
" so $HOME/vim/myfiletypes.vim
"
" *************************************************************

augroup filetype
        au!
        au! BufRead,BufNewFile *.php    set filetype=php
        au! BufRead,BufNewFile *.phc    set filetype=php
        au! BufRead,BufNewFile *.phps   set filetype=php
        au! BufRead,BufNewFile *.mine   set filetype=mine
        au! BufRead,BufNewFile *.xyz    set filetype=drawing
        au! BufRead,BufNewFile *.prc    set filetype=plsql
        au! BufRead,BufNewFile *.html   set filetype=html
        au! BufRead,BufNewFile *.htm    set filetype=html
        au! BufRead,BufNewFile *.asp    set filetype=html
        au! BufRead,BufNewFile *.txt    set filetype=php
        au! BufRead,BufNewFile *.php~   set filetype=php
        au! BufRead,BufNewFile *.phc~   set filetype=php
        au! BufRead,BufNewFile *.phps~  set filetype=php
        au! BufRead,BufNewFile *.mine~  set filetype=mine
        au! BufRead,BufNewFile *.xyz~   set filetype=drawing
        au! BufRead,BufNewFile *.prc~   set filetype=plsql
        au! BufRead,BufNewFile *.html~  set filetype=html
        au! BufRead,BufNewFile *.htm~   set filetype=html
        au! BufRead,BufNewFile *.asp~   set filetype=html
        au! BufRead,BufNewFile *.txt~   set filetype=html
		au! BufNewFile,BufRead *.json~  set filetype=json
		au! BufNewFile,BufRead *.json   set filetype=json
augroup END
