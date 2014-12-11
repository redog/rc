" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim
so $MYVIM/usr/shcom.vim
so $MYVIM/macros/python.vim       "  some macros from vimonline

iab zc class_name_:<C-O>b<C-O>f_
iab zd def_func_name_( args ):<C-O>4b<C-O>f_
iab ze else:<C-O>h<C-O>a
iab zE elif:<C-O>h<C-O>a
iab zf for_foo_ in _bar_:<C-O>3b<C-O>f_
iab zF from_foo_ import *<C-O>3b<C-O>f_
iab zh ################################################################################<CR>#<CR># file:     xxx.py<CR>#<CR># purpose:<CR>#<CR># author:   brian m sturk   bsturk@adelphia.net<CR>#                           http://users.adelphia.net/~bsturk<CR>#<CR># created:  ??/??/02<CR># last_mod: ??/??/??<CR># version:  0.1<CR>#<CR># usage:      <CR>#<CR># history:<CR>#<CR>################################################################################
iab zi if:<C-O>h<C-O>a
iab zI import
iab zp print
iab zt try:<C-O>h<C-O>a

"  python.vim macro overrides

nmap  \vb   [[V]]
nmap  \vc   :call PythonSelectObject("class")<CR>
nmap  \vf   :call PythonSelectObject("function")<CR>

unmap ]c
unmap ]f

nmap ]c :call PythonDec("class", 1)<CR>
nmap [c :call PythonDec("class", -1)<CR>
nmap ]f :call PythonDec("function", 1)<CR>
nmap [f :call PythonDec("function", -1)<CR>

unmap ]<up>
unmap ]<down>

map  ]k  :call PythonNextLine(-1)<CR>
map  ]j  :call PythonNextLine(1)<CR>

set cinwords=class,def,elif,else,except,finally,for,if,try,while

""  re-arrange python menu

unmenu <silent> Python.-Sep3-
unmenu <silent> Python.Comment\ Selection 
unmenu <silent> Python.Uncomment\ Selection 
unmenu <silent> Python.-Sep4-
unmenu <silent> Python.Previous\ Class 
unmenu <silent> Python.Next\ Class 
unmenu <silent> Python.Previous\ Function 
unmenu <silent> Python.Next\ Function 
unmenu <silent> Python.-Sep5-
unmenu <silent> Python.Select\ Block
unmenu <silent> &Python.Select\ Function
unmenu <silent> &Python.Select\ Class
unmenu <silent> &Python.-Sep6-
unmenu <silent> &Python.Previous\ Line\ wrt\ indent
unmenu <silent> &Python.Next\ Line\ wrt\ indent

nmenu &Python.-Sep3- :
vmenu <silent> &Python.Comment\ Selection<TAB>\\cc 
    \:call CommentToggleSmart("0", '#')<CR>
nmenu <silent> &Python.Comment\ Selection<TAB>\\cc 
    \:call CommentToggleSmart("0", '#')<CR>
vmenu <silent> &Python.Uncomment\ Selection<TAB>\\cc 
    \:call CommentToggleSmart("0", '#')<CR>
nmenu <silent> &Python.Uncomment\ Selection<TAB>\\cc 
    \:call CommentToggleSmart("0", '#')<CR>

nmenu &Python.-Sep4- :
nmenu <silent> &Python.Previous\ Class<TAB>[c 
    \:call PythonDec("class", -1)<CR>
nmenu <silent> &Python.Next\ Class<TAB>]c 
    \:call PythonDec("class", 1)<CR>
nmenu <silent> &Python.Previous\ Function<TAB>[f 
    \:call PythonDec("function", -1)<CR>
nmenu <silent> &Python.Next\ Function<TAB>]f 
    \:call PythonDec("function", 1)<CR>
nmenu &Python.-Sep5- :
nmenu <silent> &Python.Select\ Block<Tab>\\vb 
    \[[V]]
nmenu <silent> &Python.Select\ Function<Tab>\\vf 
    \:call PythonSelectObject("function")<CR>
nmenu <silent> &Python.Select\ Class<Tab>\\vc 
    \:call PythonSelectObject("class")<CR>
nmenu &Python.-Sep6- :
nmenu <silent> &Python.Previous\ Line\ wrt\ indent<Tab>]k 
    \]k
nmenu <silent> &Python.Next\ Line\ wrt\ indent<Tab>]j 
    \]j

if exists("loaded_python")
  finish
endif
let loaded_python=1

" Stuff that should be only once should go below here...
