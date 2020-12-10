set nocompatible            " required
filetype off                " required
set encoding=utf-8

" set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternativly, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
" add all your plugins here (note older versions of vundle
" used Bundle instead of plugin)

" ...

" All of your plugins must be added before the following line
call vundle#end()          " required

filetype plugin indent on  " required

" PROGRAMMING ENHANCEMENTS

" COLOUR SCHEME
let g:molokai_original = 1

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Enable docstrings for folded code
let g:SimplyFold_docstring_preview=1

" PROGRAMMING PYTHON
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile *.py 0r ~/.vim/skeleton.py " Auto insert py header 

" PROGRAMMING WEB
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" VIRTUALENV
let g:virtualenv_directory = '~/.pyenv/versions'
let g:airline_section_b = airline#section#create('%{virtualenv#statusline()}')

" FILESYSTEM
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" AIRLINE
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1

" LINTING
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \   'html': ['stylelint'],
      \   'json': ['jsonlint'],
      \}
