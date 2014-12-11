hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "bms_dark"

hi Directory      term=bold                                    ctermfg=DarkGreen                                                guifg=#00c000
hi ErrorMsg       term=standout                                ctermfg=White          ctermbg=Red                               guifg=Black            guibg=Red
hi IncSearch      term=reverse           cterm=reverse                                                      gui=reverse                                guibg=darkgreen
hi ModeMsg        term=bold              cterm=bold                                                         gui=bold              
hi MoreMsg        term=bold                                    ctermfg=DarkGreen                            gui=bold            guifg=SeaGreen
hi NonText        term=bold                                    ctermfg=Blue                                 gui=bold            guifg=yellow
hi Question       term=standout                                ctermfg=DarkGreen                            gui=bold            guifg=SeaGreen
hi SpecialKey     term=bold                                    ctermfg=DarkBlue                                                 guifg=Blue
hi StatusLine     term=bold,reverse      cterm=bold            ctermfg=Yellow         ctermbg=DarkBlue      gui=none            guifg=lawngreen        guibg=royalblue4
hi StatusLineNC   term=reverse           cterm=reverse         ctermfg=Black          ctermbg=DarkGreen                         guifg=lightblue        guibg=darkblue
hi Title          term=bold                                    ctermfg=DarkMagenta                          gui=bold            guifg=darkgrey         guibg=black
hi Visual         term=standout          cterm=reverse         ctermfg=DarkMagenta                          gui=reverse         guifg=darkslateblue    guibg=fg
hi VisualNOS      term=bold,underline    cterm=bold,underline                                               gui=bold,underline  guifg=DarkBlue         guibg=springgreen
hi WarningMsg     term=standout                                ctermfg=DarkRed                                                  guifg=Black            guibg=green
hi WildMenu       term=standout                                ctermfg=DarkRed        ctermbg=DarkBlue                          guifg=Black            guibg=Yellow
hi LineNr         term=underline                               ctermfg=DarkYellow                                               guifg=black            guibg=darkgrey
hi Normal                                                      ctermfg=White          ctermbg=Black                             guifg=white            guibg=black
hi Search         term=reverse                                                        ctermbg=DarkCyan                                                 guibg=#c0c000
hi Comment        term=bold                                    ctermfg=DarkGrey                             gui=bold            guifg=#808080
hi Constant       term=underline                               ctermfg=Yellow                               gui=none            guifg=#00ffff
hi Special        term=bold                                    ctermfg=Red                                                      guifg=#0000ff
hi Identifier     term=underline                               ctermfg=DarkYellow                                               guifg=#00c0c0
hi Statement      term=bold                                    ctermfg=DarkCyan                             gui=bold            guifg=#c0c000
hi PreProc        term=underline                               ctermfg=Green                                                    guifg=lightblue
hi Type           term=underline                               ctermfg=DarkGreen                                                guifg=#00c000
hi Ignore                                                      ctermfg=White                                                    guifg=bg
hi Error          term=reverse                                 ctermfg=White          ctermbg=Blue                              guifg=White            guibg=Red
hi Todo           term=standout                                ctermfg=DarkRed        ctermbg=DarkCyan                          guifg=#000080          guibg=#c0c000
hi Label                                                                                                                        guifg=magenta
hi Operator                                                                                                                     guifg=orange
hi Cursor                                                                                                                       guifg=bg               guibg=LightGreen

hi link javaPunct Operator

set guicursor=n:block-nCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=i:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=v:block-vCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=c:block-cCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=r:hor10-rCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=ci:ver30-ciCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=cr:ver30-crCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=sm:ver30-smCursor-blinkwait300-blinkon200-blinkoff150
set guicursor=o:ver30-oCursor-blinkwait300-blinkon200-blinkoff150

hi nCursor      gui=reverse                  guifg=green            guibg=bg
hi iCursor      gui=reverse                  guifg=orange           guibg=bg 
hi vCursor      gui=reverse                  guifg=magenta          guibg=bg 
hi cCursor      gui=reverse                  guifg=red              guibg=bg 
hi rCursor      gui=reverse                  guifg=turquoise        guibg=bg 
hi ciCursor     gui=reverse                  guifg=blue             guibg=bg
hi crCursor     gui=reverse                  guifg=red              guibg=bg
hi smCursor     gui=reverse                  guifg=blue             guibg=bg
hi oCursor      gui=reverse                  guifg=darkblue         guibg=bg 

if has("unix")
    " so Eterm etc do not get screwed up

"   hi Normal   ctermbg=NONE
"   hi Visual   ctermbg=NONE
"   hi ErrorMsg ctermbg=NONE
"   hi WildMenu ctermbg=NONE
"   hi Search   ctermbg=NONE
"   hi Todo     ctermbg=NONE
"   hi Error    ctermbg=NONE

"   hi User2    ctermbg=NONE
"   hi User3    ctermbg=NONE
"   hi User4    ctermbg=NONE
"   hi User5    ctermbg=NONE
"   hi User6    ctermbg=NONE
"   hi User7    ctermbg=NONE
"   hi User8    ctermbg=NONE
"   hi User9    ctermbg=NONE
endif    
