set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Add Gutentags, a ctags manager
Plugin 'ludovicchabant/vim-gutentags'
" Visualize the tag generation process
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = '~/gutentags_cache'
