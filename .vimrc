" ************* Settings for Vundle ****************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Add jedi-vim, a Python autocompletion plugin
" Remove jedi-vim, because of syntax error
" Plugin 'davidhalter/jedi-vim'

" Add vim-liberty, a syntax plugin for liberty files
Plugin 'tarikgraba/vim-liberty'

" Add vim-cpp-enhanced-highlight, enhance the syntax highlight for C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Add vim-signature, add signs before the marked lines
Plugin 'kshenoy/vim-signature'

" Add NERDTree, a tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
" Show the hidden files by default
" let NERDTreeShowHidden=1

" Add vim-lefdef, a LEF/DEF syntax file
Plugin 'tarikgraba/vim-lefdef'

" Add AutoComplPop, automatically opens popup menu for completions
Plugin 'vim-scripts/AutoComplPop'

" Add LargeFile, disable lots of functions if the file is too large
" Plugin 'vim-scripts/LargeFile'

" Add NERD Commenter, a plugin to comment in/out code block
Plugin 'scrooloose/nerdcommenter'

" Add VIM Airline, a toolbar
Plugin 'vim-airline/vim-airline'

" " Not working for VIM v7!
" " Add Gutentags, a ctags manager
" Plugin 'ludovicchabant/vim-gutentags'
" " Visualize the tag generation process
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_cache_dir = '~/gutentags_cache'

" Add VIM-Session, save and restore vim sessions
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ************ My settings ***************

" Enable backspace
set backspace=indent,eol,start

" Tab and indent settings
set shiftwidth=4
set tabstop=4

" Auto apply .vimrc when saving
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Turn on incremental search
set incsearch

" Not case-sensitive, using smart case
set ignorecase
set smartcase

" Vim command-line auto-complete
set wildmenu

" Always show the status bar
set laststatus=2

" Show the ruler
set ruler

" Show the line number
set number

" Highlight the current line and column
set cursorline
" set cursorcolumn

" Highlight the search results
set hlsearch

" Color and scheme
set t_Co=256
" Molokai color settings
set background=dark
" colorscheme molokai
colorscheme molokai

syntax on

" No wrapping lines
" set nowrap

" Turn on folding based on indent
set foldmethod=indent
set foldcolumn=1
" Unfold everything in a file by default
set foldlevel=99
set mouse=a
" set nofoldenable

" Iterate the tag stack 
nmap tn :tnext<CR>
nmap tp :tprevious<CR>

" Change the NERDTree arrows
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'
let NERDTreeNodeDelimiter="\t"

" Auto start NERDTree when open a directory
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Auto close NERDTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto detect the LEF/DEF filetype
autocmd FileType lef so ~/.vim/syntax/lef.vim
autocmd FileType def so ~/.vim/syntax/def.vim

" Turn on smart indent
set smartindent

" Turn off showmatch
" set noshowmatch

" Cat selected text
let mapleader=";"
"xnoremap <leader>c <ESC>:'<,'>:w !cat<CR>

" Copy/paste settings for vimx
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" replace currently selected text with default register
" without yanking it
vnoremap <leader>v "_dP

" Adjust indent for selected text using TAB
" xnoremap <TAB> <ESC>:'<,'>:s/^/\t/g<CR>

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Custimized settings for Nerd Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Vertical go-to-file split
map <leader>f :vertical wincmd f<CR>

" Turn on/off line numbers
map <leader>n :set nu!<CR>

" Copy the absolute path of current file
nmap <leader>g :let @* = expand("%:p")<cr>
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Set paste mode automatically to avoid unexpected indent

" ************ Auto-compile *************
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	elseif &filetype == 'tcl'
		exec "!time tclsh %"
	elseif &filetype == 'csh'
		exec "!time csh %"
	endif
endfunc
