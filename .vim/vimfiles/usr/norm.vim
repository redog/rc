" Stuff that should be done everytime this file is sourced
" should go below here...

if exists("loaded_norm")
  finish
endif
let loaded_norm=1

" Stuff that should be only once should go below here...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimsh_split_open          = 1
let g:selBufActKeySeq           = '\ls'

so $MYVIM/macros/selectbuffer.vim
so $MYVIM/macros/align.vim
so $MYVIM/macros/align_maps.vim
so $MYVIM/macros/align_regex.vim

if !has("win32")
    so $VIMRUNTIME/ftplugin/man.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! CDCurBuf()
if bufname ("%") != "" && isdirectory (expand ("%:p:h"))
    cd %:p:h 
	echo "':cd %:p:h'\t\t chdir: --> " . (expand("%:p:h"))
endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! ToggleLineNumbers()
    if &number == 1
        set nonumber
    else
        set number
    endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! ToggleShowMenu()
    if has("gui_running")
        if &guioptions !~# "m"
            set guioptions+=m
            echo "Showing menu..."
        else
            set guioptions-=m
            echo "Hiding menu..."
        endif
    endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:TextModeColorsOn = 0
let g:PrevFGColor      = 0
let g:PrevBGColor      = 0

func! ToggleTextMode()

	let g:TextModeColorsOn=!g:TextModeColorsOn

	if g:TextModeColorsOn
		" if text mode isn't on get the fg and bg colors to restore later
		let g:PrevBGColor = synIDattr(synIDtrans(hlID("Normal")), "bg")
		let g:PrevFGColor = synIDattr(synIDtrans(hlID("Normal")), "fg")

		exec "hi Normal guibg=#260062 guifg=grey77"
	else    
		exec "hi Normal guibg=" . g:PrevBGColor . " guifg=" . g:PrevFGColor
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! GrepParams()
    echo "Not implemented yet...allow changing of parameters passed to grep"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
    func! PrintBuffer (mode)
        if(!g:printer_spool_started)
            exe "!start " . $UTILITY . "/Misc/Print_File/PrFile32.exe /s:". $TEMP ."/spool/*.*"
            let g:printer_spool_started = 1
        endif

        if a:mode == 'Visual'
            let tmp_file=$TEMP . "/spool/Partial-" . expand ("%:t")
            exec ":'<,'>w! ". tmp_file
        else
            let tmp_file= $TEMP. "/spool/" . expand ("%:t")
            exec "w! ". tmp_file
        endif
    endfunc

    map  <M-Space>         :simalt ~<CR>
    imap <M-Space>         <C-O>:simalt ~<CR>
    cmap <M-Space>         <C-C><M-Space>
    nmap <M-p>             :call PrintBuffer ('Normal')<CR>
    vmap <M-p>             <Esc>:call PrintBuffer ('Visual')<CR>

    let g:Grep            ='findstr'
    let g:GrepParams      ='/N /P'      " line number and skip non printable
    let g:GrepRecurseFlag ='/S'
endif
 
" ** Alt keys : NOTE: F, E, T, Y, B, and N are used for menu access! **

""  Unused mappings

unmap <xHome>
unmap <xEnd>
unmap <S-xF4>
unmap <S-xF3>
unmap <S-xF2>
unmap <S-xF1>
unmap <xF4>
unmap <xF3>
unmap <xF2>
unmap <xF1>

if has("gui_running") && has("win32")
    unmap <C-Del>
    unmap <S-Del>
    unmap <C-Insert>
    unmap <S-Insert>
    unmap <C-PageDown>
    unmap <C-PageUp>
endif    

nmap  '            `
map   <M-a>        wbve
imap  <M-a>        <C-O>wbve
vmap  <M-a>        "*x
vmap  <M-c>        "*y
nmap  <M-v>        \\Paste\\ 
imap  <M-v>        x<Esc>\\Paste\\"_s
cmap  <M-v>        <C-R>*
vmap  <M-v>        "-cx<Esc>\\Paste\\"_x  
nmap  \\Paste\\    "=@*.'xy'<CR>gPFx"_2x:echo<CR>

nmap  gf           <C-W>f
nmap  gc           gdb<C-W>f

nmap Y             y$
nmap <C-Space>     i<Space><Esc>
imap <C-S>         <C-O>yiW<End>=<C-R>=<C-R>0<CR>   " calculator in insert mode

vmap \alre         :call DoAlign()<CR>
nmap \cd           :call CDCurBuf()<CR>
nmap \cl           :Cal<CR>
nmap \ee           :Explore<CR>
nmap \es           :Sexplore<CR>
nmap \hi           :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
nmap \hg           :echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")<CR>
nmap \hl           :set hls!<CR>:set hls?<CR>
nmap \in           :Info <cword><CR>
nmap \jj           o<Esc>j2kj
nmap \kk           O<Esc>k2jk
nmap \mn           :call ToggleShowMenu()<CR>
nmap \nm           :call ToggleLineNumbers()<CR>
nmap \ru           0O....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8
nmap \sh           :so $MYVIM/macros/vimsh/vimsh.vim<CR>
nmap \tx           :call ToggleTextMode()<CR>
vmap \we           "*y:!lynx '<C-R>*' &<CR>
vmap \ww           "*y:!galeon -n '<C-R>*' &<CR>

let  g:GrepRecurse = 0

nmap \gw           :GrepCw<CR>
nmap \g?           :GrepPrompt<CR>
nmap \gr           :GrepR<CR>
nmap \g.           :GrepCwd<CR>
nmap \g/           :GrepRoot<CR>
nmap \gp           :GrepParams<CR>

""  Jump to previous spot in alt file
noremap <C-^>      <C-^>`"

""  Show date and filesize in explorer
let g:explDetailedList = 1

iab teh the
iab THe The
iab alos also
iab aslo also
iab becuase because
iab Becuase Because

iab zdate <C-R>=strftime("%m/%d/%y")<CR>
iab ztime <C-R>=strftime("%X")<CR>
