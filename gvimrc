"" GUI options
set gfn=Menlo:h12
set guioptions=aAce         " Hide the scrollbars
set transparency=10         " Transparent background (experimental renderer)

if has("gui_macvim")
  "" Remap COMMAND+F to CTRL+P as it's more convenient!
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  ""nmap <d-f> <c-p>
  nmap <d-f> :CtrlP<cr>
  nmap <d-F> :CtrlPMRU<cr>
endif
