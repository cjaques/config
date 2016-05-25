set nocompatible              " required
filetype off                  " required:autocmd InsertLeave * NoMatchParen
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Code folding plugin
Plugin 'tmhedberg/SimpylFold'
" Auto-indentation plugin
Plugin 'vim-scripts/indentpython.vim'
" Auto-completion
" Plugin 'Valloric/YouCompleteMe'

" Latex plugin 
Plugin 'xuhdev/vim-latex-live-preview'

" colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" NerdTree / Syntastic
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Latex support
" Plugin 'lervag/vimtex'
"
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added beore the following line
call vundle#end()            " required
filetype plugin indent on    " required

set grepprg=grep\ -nH\ $* 

" Split screens
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" search with a key on ;;
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

" Nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd VimEnter * NERDTree
let NERDTreeShowBookmarks=1 
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p


" Python specific configuration
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

set encoding=utf-8
let python_highlight_all=1
syntax on
let g:syntastic_check_on_open = 1


if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme zenburn
endif

call togglebg#map("<F6>")
" nnoremap <silent> <F5> :!clear;:w;python %<CR>
:map <F5> <Esc>:w<CR>:!clear;python %<CR>
" Set configuration file for YouCompleteMe
" let g:ycm_confirm_extra_conf = 0
" map command to build latex files
:map <F7> <Esc>:w<CR>:!clear;pdflatex %<CR>
" custom command to enter latex text automatically
":command -nargs=1 Bg :normal i\begin{<args>}<CR>\end{<args>}<Esc>k :insert

" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Smart search
set ignorecase
set smartcase

" Lines number
set nu

" Share clipboard with OS
set clipboard=unnamed

" Cursor line
set cul
:autocmd InsertEnter * set nocul
:autocmd InsertLeave * set cul

" Following lines create a problem with NERDTree, when editing multiple file,
" InsertEnter ALWAYS makes vim focus on the last open file...
" Matching selected parenthesis
"highlight MatchParen ctermfg=94
":autocmd InsertEnter * DoMatchParen
":autocmd InsertLeave * NoMatchParen
":autocmd VimEnter * NoMatchParen


" Cursor stays in the middle of the screen when possible
:set so=15

