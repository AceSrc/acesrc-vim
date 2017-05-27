onoremap p i(
onoremap in :normal! f)vi(<cr>

let mapleader = "\<Space>"
nnoremap oo o<ESC>
nnoremap OO O<ESC>
nnoremap <Leader>o :new<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>1 :bp<CR>
nnoremap <Leader>2 :bn<CR>
nnoremap <Leader>` :call SaveProblem()<CR>
nnoremap <Leader><F3> :o .problems<CR>
autocmd filetype python execute "nnoremap rr :w<CR> :!python %<CR>"
autocmd filetype cpp execute "nnoremap rr :w<CR> :!g++ % && ./a.out < input<CR>"
inoremap <a-o> <esc>oi
inoremap <a-O> <esc>Oi


nnoremap <CR> G


vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set number
"set hlsearch
set cmdheight=2
set ignorecase
"set incsearch
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nmap <F9> <ESC>:w<CR>:!g++ % -std=gnu++11 && ./a.out<CR>
imap <F9> <ESC>:w<CR>:!g++ % -std=gnu++11 && ./a.out<CR>
nmap <F12> <ESC>:w<CR>:!cp % ~/windows/ <CR>
nmap ; :
nnoremap ;; :q!<CR>
inoremap jk <ESC>l
vnoremap jk <ESC>l 
nmap ] /^\S.*{<esc>zt
nmap [ ?^\S.*{<esc>zt
nmap zz ZZ

set nocompatible             
filetype off          
  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
Bundle 'gmarik/vundle'  
Bundle 'jiangmiao/auto-pairs'
map <silent> <F1> <Esc> :TlistToggle<CR>
Bundle 'scrooloose/nerdtree'
map <silent> <F2> <Esc> :NERDTreeToggle<CR>
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
Bundle 'vim-syntastic/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rkulla/pydiction.git'
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height=3
filetype plugin indent on

syntax enable


set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
colorscheme acesrc

func SaveProblem()
    let oj = split(split(getline(2), ' \zs')[-1], ' ')[0]
    let id = split(getline(3), ' \zs')[-1]
    let dstpath = $HOME . '/.problems/' . oj . '/' . id 
    let dstdir = $HOME . '/.problems/' . oj
    echo dstdir
    if isdirectory(dstdir) == 0
        call mkdir(dstdir, 'p')
    endif
    execute "write! " . dstpath
endfunc
