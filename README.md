# acesrc-vim
这是我按照我电脑上的vim8配的环境, 用之前需要 lua 和 python 支持, 而且运行BundleInstall之前需要安装Vundle

acesrc's Vim Configuration.

Using [Vundle](https://github.com/VundleVim/Vundle.vim) to manage Plugins. 

After cloning this repository, please copy the .vimrc and .vim into the home dirctory, 
start vim and run :

```
:BundleInstall
```

to configure the Plugins.

You may have some bugs caused by the Lint Engine [ale](https://github.com/w0rp/ale) 
if your vim is not the latest version.
If you don't want to update your vim, please comment 

```
Bundle 'w0rp/ale'
```

and uncomment

```
"Bundle 'vim-syntastic/syntastic'
```

## Key-mapping

I set my leader key as Space, you can change it into any key you like. 
```
let mapleader = "\<Space>"
```

I have prepare some common shortcuts

```
nnoremap <Leader>o :new<CR> "Open a new file
nnoremap <Leader>w :w<CR> "Save the file
nnoremap <Leader>x :x<CR> "Save the file and exit vim
nnoremap <Leader>q :q!<CR> "exit vim
```

## Compiling and Running

I use some shortcuts to compile and run my codes. 

```
autocmd filetype python execute "nnoremap ee :w<CR> :!python %<CR>"
autocmd filetype cpp execute "nnoremap ee :w<CR> :!g++ % -g -o %< && ./%< < input<CR>"
autocmd filetype lisp execute "nnoremap ee :w<CR> :!clisp %<CR>"
autocmd filetype asm execute "nnoremap ee :w<CR> :!nasm -f elf64 -g -o %<.o % && ld -o %< %<.o && ./%<<CR>"
nmap <F9> <ESC>:w<CR>:!g++ % -g -o %< -std=gnu++11 && ./%<<CR>
```

you can run python programs with "ee" and cpp programs with "<F9>", or with "ee". 
However, running cpp programs with "ee" will use a file named "input" as standard input. 

## Plugins

[auto-pairs](https://github.com/jiangmiao/auto-pairs) for completing brackets
[vim-snippets](https://github.com/honza/vim-snippets) for snippets


... so lazy ... 

