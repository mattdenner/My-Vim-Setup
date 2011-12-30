"" GUI options
set gfn=Andale\ Mono:h13    " Set the font
set guioptions=aAce         " Hide the scrollbars
color lucius                " jellybeans is good too
set foldmethod=syntax       " Syntax folding
set transparency=10         " Transparent background (experimental renderer)

if has("gui_macvim")
  "" Remap COMMAND+F to CTRL+P as it's more convenient!
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  nmap <d-f> <c-p>
endif
