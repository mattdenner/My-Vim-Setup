"" GUI options
set gfn=Menlo:h12
set guioptions=aAce         " Hide the scrollbars
set transparency=10         " Transparent background (experimental renderer)

"" Motion
set relativenumber          " Relative line numbering

if has("gui_macvim")
  "" Remap COMMAND+F to CTRL+P as it's more convenient!
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  nmap <d-f> :CtrlP<cr>
  nmap <d-F> :CtrlPTag<cr>

  "" Remap COMMAND+G to Gundo
  macmenu &Edit.Find.Find\ Next key=<nop>
  nmap <d-g> :GundoToggle<cr>
endif
