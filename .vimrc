set nocompatible

" Basic settings {
    let mapleader=","
    syntax on
    set number
    set shiftwidth=2 tabstop=2 expandtab
    set clipboard=unnamed
    " set hlsearch
    set dir=$VIMTEMP
    " set autoread
    set foldmethod=manual
" }

" Mapping {
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>eb :vsplit ~/.vimrc.bundles<cr>
    inoremap fd <Esc>
    vnoremap fd <Esc>
    nnoremap <leader>g :grep -R <cWORD> .<cr>
    nnoremap <leader>q :q<cr>

    " Disdabled default keys
    noremap <Up> \<Nop>
    noremap <Down> \<Nop>
    noremap <Left> \<Nop>
    noremap <Right> \<Nop>
    noremap <Del> \<Nop>
    noremap <Bslash> \<Nop>
    " noremap <Esc> \<Nop>
    " Disable lowercase conversion of visiual mode to prevent misopration
    vnoremap u \<nop>
" }

" vim features {
    if has('persistent_undo')         "check if your vim version supports
      set undofile                    "turn on the feature
      set undodir=$VIMHOME/undo     "directory where the undo files will be stored
    endif
" }

" vundle'plugin list {
    if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
    endif
" }


filetype plugin indent on


" Plugins config {

    " nerdtree
    noremap <C-e> :NERDTreeToggle<CR>
    let NERDTreeNodeDelimiter = "\u00a0"

    " colorschemes
    colorscheme molokai_dark

    " surround
    "

    " ctrlp
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
	  \ 'dir': 'node_modules\|DS_Store\|git|dist|build',
	  \ 'file': '\v\.(exe|so|dll|swp|ico)$',
	  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	  \ }

    " airline
    let g:airline#extensions#tabline#enabled = 0

    " mundo
    " noremap <C-h> :MundoToggle<CR>

    " easymotion
    map <Leader> <Plug>(easymotion-prefix)

    " multiple-cursors
    let g:multi_cursor_next_key = '<C-n>'
    let g:multi_cursor_prev_key = '<C-p>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'

    " signature
    " :SignatureToggle
    
    " searchindex
    " g/ to display search index for the last search term at the current cursor position


    " syntastic
    let g:syntastic_javascript_checkers = ['eslint']

    " workspace
    nnoremap <leader><leader>s :ToggleWorkspace<cr>
    let g:workspace_autosave_always = 1
    let g:workspace_autosave = 1
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
    let g:workspace_persist_undo_history = 1
    let g:workspace_undodir= $HOME . '/.vim/undo/'

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

    " tabular
    " if exists(":Tabularize")
      " nmap <Leader>a= :Tabularize /=<CR>
      " vmap <Leader>a= :Tabularize /=<CR>
      " nmap <Leader>a: :Tabularize /:\zs<CR>
      " vmap <Leader>a: :Tabularize /:\zs<CR>
    " endif

    " autoclose
    "

    " Ack
    let g:ackprg = 'ag --nogroup --nocolor --column'
    nnoremap <leader>a :Ack!<CR>
    nnoremap<leader>A :Ack!<Space>

    " vim-vue
    augroup file_vue
        autocmd!
        autocmd FileType vue syntax sync fromstart
    augroup END

    " tagbar
    " nnoremap <leader>t :TagbarToggle<cr>

    " javascript-libraries-syntax
    let g:used_javascript_libs = 'vue'

    " emmet
    let g:user_emmet_leader_key = '<C-c>'

    " youcomplete
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:ycm_key_list_stop_completion = ['<C-y>']
    let g:ycm_key_invoke_completion = '<C-Space>'
    let g:SuperTabDefaultCompletionType = '<C-n>'
    let g:ycm_collect_identifiers_from_tags_files = 0
    " required -> npm install -g vue-language-server
    let g:ycm_language_server = [ {
    \ 'name': 'vue',
    \ 'filetypes': [ 'vue' ],
    \ 'cmdline': [ 'vls'  ]
    \ } ]
    nnoremap <leader>gi :YcmCompleter GoTo<CR>
    nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

    " UltiSnips
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
    let g:UltiSnipsExpandTrigger="<C-j>"
    " let g:UltiSnipsJumpForwardTrigger="<c-j>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    "airblade/vim-gitgutter
    set updatetime=100

    " instant-markdown
    "let g:instant_markdown_autostart = 0

    "vim-prettier
    nnoremap <leader>p :PrettierAsync<CR>
    let g:prettier#config#semi = 'false'
    let g:prettier#config#trailing_comma = 'none'
    let g:prettier#config#bracket_spacing = 'true'
    let g:prettier#config#single_quote = 'true'

    " vim-gutentags
    " let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
    " let s:vim_tags = expand('~/.vim/tags')
    " let g:gutentags_cache_dir = s:vim_tags
    " if !isdirectory(s:vim_tags)
      " silent! call mkdir(s:vim_tags, 'p')
    " endif
    " let g:gutentags_file_list_command = 'rg --files'

    " jsdoc
    let g:jsdoc_allow_input_prompt = 0
    let g:jsdoc_input_description = 1
    let g:jsdoc_enable_es6 = 1
    nnoremap <leader>d :JsDoc<cr>


    " }



