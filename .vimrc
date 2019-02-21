set nocompatible

" Basic settings {
    let mapleader=","
    syntax on
    set number
    set shiftwidth=4
" }


" Mapping {
    inoremap <C-u> <Esc>viwU<Esc>i
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    inoremap jk <Esc>
    vnoremap jk <Esc>
    nnoremap <leader>g :grep -R <cWORD> .<cr>
" }


" vundle'plugin list {
    if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
    endif
" }


filetype plugin indent on


" Plugins config {

    " syntanstic
    let g:syntastic_javascript_checkers = ['eslint']
    
    " nerdtree
    noremap <C-e> :NERDTreeToggle<CR>
    let NERDTreeNodeDelimiter="\u00a0"

    " colorschemes
    colorscheme molokai_dark

    " workspace
    nnoremap <leader>s :ToggleWorkspace<cr>
    let g:workspace_autosave_always = 1

    " vim-vue
    augroup file_vue
        autocmd!
        autocmd FileType vue syntax sync fromstart
        autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    augroup END

   " ctrlp
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    " undotree
    noremap <C-h> :UndotreeToggle<CR>

    " tagbar
    nnoremap <leader>t :TagbarToggle<cr>

    " javascript-libraries-syntax
    let g:used_javascript_libs = 'underscore,vue'

    " emmet
    let g:user_emmet_leader_key = '<C-y>'

    " youcomplete
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " UltiSnips
    let g:UltiSnipsExpandTrigger = "<C-s>"

    " nerdcommter
    let g:ft = ''
    fu! NERDCommenter_before()
	if &ft == 'vue'
	    let g:ft = 'vue'
	    let stack = synstack(line('.'), col('.'))
	    if len(stack) > 0
		let syn = synIDattr((stack)[0], 'name')
		if len(syn) > 0
		    let syn = tolower(syn)
		    exe 'setf '.syn
		endif
	    endif
	endif
    endfu
    fu! NERDCommenter_after()
	if g:ft == 'vue'
	    setf vue
	    g:ft
	endif
    endfu
    " }



