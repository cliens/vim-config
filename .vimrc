set nocompatible
set cursorline " cursorcolumn

syntax on
" set number

let mapleader=","

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

map <C-e> :NERDTreeToggle<CR>

let g:used_javascript_libs = 'underscore,vue'

" nerdtree
let NERDTreeNodeDelimiter="\u00a0"

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
