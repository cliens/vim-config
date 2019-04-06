set nocompatible

" Basic settings {
    let mapleader=","
    syntax on
    set number
    set shiftwidth=4
" }


" Mapping {
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>eb :vsplit ~/.vimrc.bundles<cr>
    inoremap fd <Esc>
    vnoremap fd <Esc>
    nnoremap <leader>g :grep -R <cWORD> .<cr>

    " Disdabled default keys
    noremap <Up> \<Nop>
    noremap <Down> \<Nop>
    noremap <Left> \<Nop>
    noremap <Right> \<Nop>
    noremap <Del> \<Nop>
    noremap <Bslash> \<Nop>
    noremap <Esc> \<Nop>
" }


" vundle'plugin list {
    if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
    endif
" }


filetype plugin indent on


" Plugins config {

    " syntastic
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
    augroup END

   " ctrlp
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll)$',
		\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
		\ }

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

    "airblade/vim-gitgutter
    set updatetime=100

    " nerdcommter
    let g:NERDSpaceDelims = 1
    let g:ft = ''
    function! NERDCommenter_before()
	if &ft == 'vue'
	    let g:ft = 'vue'
	    let stack = synstack(line('.'), col('.'))
	    if len(stack) > 0
		let syn = synIDattr((stack)[0], 'name')
		if len(syn) > 0
		    exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
		endif
	    endif
	endif
    endfunction
    function! NERDCommenter_after()
	if g:ft == 'vue'
	    setf vue
	    let g:ft = ''
	endif
    endfunction
    " }



