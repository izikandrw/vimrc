call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ruanyl/vim-fixmyjs'
Plug 'w0rp/aler/local/opt/fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

autocmd VimEnter * NERDTree

" general editor configuration
set number

" go to the editor pane first (not the bookmark pane)
" autocmd VimEnter * wincmd p

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

"color scheme
colors slate
set hlsearch

set backspace=2

"close vim if NERDTree is the last open pane
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" take C-V back from evil windows
noremap <C-V> <C-Q>

" ALE 
let g:ale_sign_column_always = 1

" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = { 
\   'javascript': ['eslint'], 
\}
" fix files automatically on save.
let g:ale_fix_on_save = 1

"vimgrep mapping
" noremap <C-F> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"vimgrep configuration
:set wildignore+=node_modules/**

"fuzzy finder using FZF
nnoremap <C-T> :Files .<Enter>
"dont open FZF file in NERDTree buffer
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

"folding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
" set foldlevelstart=1
