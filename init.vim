set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" " Add Gutentags, a ctags manager
" Plugin 'ludovicchabant/vim-gutentags'
" " Visualize the tag generation process
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_cache_dir = '~/gutentags_cache'


" Vim-plug settings:
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

" Add Gutentags, a ctags manager
Plug 'ludovicchabant/vim-gutentags'
" Visualize the tag generation process
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = '~/gutentags_cache'

" Add CoC, Conquer of Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Disable AutoComplPop when CoC is available
autocmd FileType * AcpDisable 

" CoC configurations:
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
