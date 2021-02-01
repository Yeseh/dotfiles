" Polyglot
let g:polyglot_disabled = ['elm']

call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim' 
Plug 'preservim/nerdcommenter'
Plug 'habamax/vim-godot'
Plug 'elmcast/elm-vim'
Plug 'dense-analysis/ale'

call plug#end()

set termguicolors
colorscheme nightfly 

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" editor variables
set tabstop=4
set shiftwidth=4
set nu
set rnu
set cmdheight=2
set updatetime=300
set splitright
set splitbelow
let mapleader=","
" coc configuration
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-omnisharp',
			\ 'coc-rust-analyzer',
			\ 'coc-json',
			\ 'coc-prettier',
			\ 'coc-eslint'
			\ ]
" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>)"")


" Terminal
tnoremap <Esc> <C-\><C-n>
 au BufEnter * if &buftype == 'terminal' | :startinsert | endif
 " open terminal on ctrl+n
 function! OpenTerminal()
  	 term
     resize 10
  endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

" CoC mappings
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>g] <Plug>(coc-diagnostic-next)

" FZF Keybindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-q': 'vsplit' }

" Buffer management
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args> , 1, <bang> 0)

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

func! GodotSettings() abort
	nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>			    
	nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
