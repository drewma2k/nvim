" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "defaultplus"

" vim: sw=2
set notermguicolors
hi Pmenu ctermbg=darkgrey ctermfg=white
hi PmenuSel ctermbg=grey ctermfg=lightgrey
hi ColorColumn ctermbg=darkgrey
hi clear SignColumn
hi TelescopeNormal ctermbg=black
hi WhichKeyFloat ctermbg=black
hi TelescopeBorder ctermbg=black
hi TelescopePromptNormal ctermbg=black
hi TelescopePromptBorder ctermbg=black
hi link NvimTreeFolderIcon Directory
hi NvimTreeRootFolder ctermfg=magenta
hi Directory ctermfg=darkcyan
