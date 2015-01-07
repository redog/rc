" Vundle Settings Required
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle,/usr/share/vim/vimfiles/,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after
call vundle#begin()
" Plugin list being
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
" Plugin list end
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" End Vundle Settings

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Put Non Plugin stuff after this line

" TODO move other settings into bundles

"
"au FileType json source ~/.vim/colors/json.vim

"let g:solarized_termcolors= 16 | 256 
"let g:solarized_termtrans = 0 | 1
"let g:solarized_degrade = 0 | 1 
"let g:solarized_bold = 1 | 0 
"let g:solarized_underline = 1 | 0 
"let g:solarized_italic = 1 | 0 
"let g:solarized_contrast = "normal"| "high" or "low" 
"let g:solarized_visibility= "normal"| "high" or "low"
"
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_contrast = "high"
let g:solarized_visibility= "high"
let g:solarized_termcolors= 256 

colorscheme solarized
set bg=dark
"colorscheme vividchalk
"colorscheme ego-dev
"
syntax on

set ai						" always set autoindenting on
set backup					" keep a backup file
set bdir=~/tmp				" where to keep backup
set viminfo='20,\"50		" read/write a .viminfo file, don't store more
							" than 50 lines of registers
set makeprg=/usr/bin/gmake	" 
set makeef=/tmp/vim##.err	" make errors? :cprevious :cnext
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m " set error format for python
set vb t_vb=		" dont't beep audibly, or visibly
set noerrorbells 	" Did I mention I hate beeps and bells?
set showmode 
set noshowmatch
set remap 
set matchtime=5
set spelllang=en
"set spell
" popup suggestions
set mousemodel=popup
" set redraw 
set noterse 
set ruler
set wrapscan
set fileformat=unix
" set notextmode
"
" useful settings for python 
let g:py_select_leading_comments = 0
set tabstop=4
set shiftwidth=4
set softtabstop=0
" I really don't like spaces in place of tabs... not sane
set noexpandtab
" set expandtab
set smarttab
set nolist
set smartindent
" Hilight trailing spaces.
au BufNewFile,BufRead * syn match EolSpace display excludenl "\s\+$"
au BufNewFile,BufRead * hi EolSpace term=reverse ctermbg=DarkRed
set stl=F
set title
" annoys me in python
"set cindent
set cinkeys=0{,0},:,0#,!^F,o,O,e
set autowrite
set foldmethod=marker

" Makes up and down on broken long lines sane
nmap j gj
nmap k gk

"map  :%s/^/> /g
"map  :w!<CR>:!aspell check %<CR>:e! %<CR>
map  \s?
map  :r! echo '\#\!/usr/bin/env python'
map  :r! echo '\#\!/usr/bin/bash'
map <F5> :w<CR>:!Eterm -t /home/eric/.Eterm/themes/python % &<CR><CR>
" Enable spell checking
map <F10> <Esc>:setlocal spell spelllang=en_us<CR>
" Disable spell checking
map <F11> <Esc>:setlocal nospell<CR>
" aC` in #vim exclaimed 'how practical' when I suggested this one
" " spiiph said 'Not a bad idea, I might incorporate that mapping. .D'
" " Wipe last search ; I got tired of doing /alskdjfalskdfjlakdf<CR>
noremap <C-l> :nohl<CR><C-l>

" what does this add? seems to do the same as :set list so ~/.vim/cream-showinvisibles.vim highlight Search cterm=bold term=standout ctermfg=7 ctermbg=1 
" au FileType python source /usr/share/vim/vimfiles/plugin/python.vim 
" au FileType python source ~/.vim/vimfiles/macros/python.vim 
" remap man page call because I use K for python 
" nmap <Leader>M :call <SID>PreGetPage(0)<CR> set guifont=Bitstream\ Vera\ Sans\ Mono\ 8 set background="dark" 
"
" colorscheme ego 
" colorscheme delek 
" colorscheme ego-dev 
" colorscheme torte 

" For editing binary shit 
" change .bin to needed extention
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
" Status bar stuff
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2 " 2 = always ; 0 = never ; 1 = more than 1 window

" Completion stuff ...(TODO disable for some file types(i.e. conf files txt etc)

"set wildmenu
"set wildmode=longest:full
"set wildchar=<Tab>
"set wildignore=*.o,*.obj
"
"function! InsertTabWrapper(direction)
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    elseif "backward" == a:direction
"        return "\<c-p>"
"    else
"        return "\<c-n>"
"    endif
"endfunction
"
"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
