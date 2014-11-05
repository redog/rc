au!

au FileType c,cpp                     so $MYVIM/usr/cdev.vim
au BufEnter *.c,*.h,*.cpp,*.cc        so $MYVIM/usr/cdev.vim
                                      
au FileType java                      so $MYVIM/usr/java.vim
au BufEnter *.java                    so $MYVIM/usr/java.vim
                                      
au FileType csharp                    so $MYVIM/usr/cdev.vim
au BufEnter *.cs                      so $MYVIM/usr/cdev.vim

au FileType html                      so $MYVIM/usr/html.vim
au BufEnter *.html,*.shtml,*.htm      so $MYVIM/usr/html.vim
                                      
au FileType perl                      so $MYVIM/usr/perl.vim
au BufEnter *.pl,*.prl,*.perl         so $MYVIM/usr/perl.vim
                                      
au FileType vim                       so $MYVIM/usr/vim.vim
au BufEnter *.vim                     so $MYVIM/usr/vim.vim
                                      
au FileType python                    so $MYVIM/usr/python.vim
au BufEnter *.py                      so $MYVIM/usr/python.vim
                                      
au FileType sh,zsh,ksh,csh            so $MYVIM/usr/sh.vim
au BufEnter *.sh,*.ksh,*.zsh,*.csh    so $MYVIM/usr/sh.vim
au BufRead  prototype                 set syntax=sh | set ft=sh | so $MYVIM/usr/sh.vim
                                      
au Filetype makefile                  set noexpandtab
au BufRead *.txt,TODO                 set textwidth=80
au BufRead .emacs,.viper              set syntax=lisp | set ft=lisp
au BufRead .fvwm2rc                   set syntax=fvwm | set ft=fvwm | set textwidth=200
                                      
au BufRead article.txt,letter.txt     set syntax=mail | set ft=mail
au BufRead /tmp/mutt*                 normal :g/^> -- $/,/^$/-1d^M/^$^M^L

aug Binary    " vim -b : edit binary using xxd-format!
    au!
      au BufReadPre  *.bin,*.exe,*.com,*.dll let &bin=1
      au BufReadPost * if &bin | %!xxd
      au BufReadPost * so $VIMRUNTIME/syntax/xxd.vim | set ft=xxdbin | endif   
      au BufWritePre * if &bin | %!xxd -r
      au BufWritePre * endif
aug END
