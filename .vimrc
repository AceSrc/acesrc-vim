set tags+=/usr/include/tags

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

 "更改快捷键
 map f <Plug>(easymotion-prefix)
 map ff <Plug>(easymotion-s)
 map fs <Plug>(easymotion-f)
 map fl <Plug>(easymotion-lineforward)
 map fj <Plug>(easymotion-j)
 map fk <Plug>(easymotion-k)
 map fh <Plug>(easymotion-linebackward)
  "忽略大小写
 let g:EasyMotion_smartcase = 1"


set timeoutlen=200

onoremap p i(
onoremap in :normal! f)vi(<cr>

let mapleader = "\<Space>"
nnoremap <Leader>o :new<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>1 :bp<CR>
nnoremap <Leader>2 :bn<CR>
nnoremap <Leader>` :call SaveProblem()<CR>
nnoremap <Leader><F3> :o .problems<CR>
autocmd filetype python execute "nnoremap ee :w<CR> :!python %<CR>"
autocmd filetype cpp execute "nnoremap ee :w<CR> :!g++ % -std=gnu++11 && ./a.out < input<CR>"
inoremap <a-o> <esc>oi
inoremap <a-O> <esc>Oi
set noswapfile


nnoremap <CR> G


vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd filetype yaml execute "set tabstop=2 | set softtabstop=2 | set shiftwidth=2"
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
nmap ] /^\S.*{<esc>zt
nmap [ ?^\S.*{<esc>zt
nmap zz ZZ

set relativenumber
set incsearch

set nocompatible             
filetype off          
  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  
  
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'easymotion/vim-easymotion'

Bundle 'godlygeek/tabular'

Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-line'
Bundle 'bps/vim-textobj-python'
Bundle 'vimtaku/vim-textobj-keyvalue'
Bundle 'glts/vim-textobj-comment'

Bundle 'rking/ag.vim'
Bundle 'majutsushi/tagbar'
noremap <F4> :TagbarToggle<CR>

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

Bundle 'gmarik/vundle'  
Plugin 'Chiel92/vim-autoformat'
"Bundle 'AutoComplPop'
Bundle 'jiangmiao/auto-pairs'
map <silent> <F1> <Esc> :TlistToggle<CR>
"Bundle 'scrooloose/nerdtree'
"map <silent> <F2> <Esc> :NERDTreeToggle<CR>
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

"Bundle 'shougo/neocomplete.vim'
"Bundle 'valloric/youcompleteme'

Bundle 'chase/vim-ansible-yaml'

syntax enable


"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
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
