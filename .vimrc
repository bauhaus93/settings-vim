syntax on
filetype plugin indent on
colorscheme desert
set nocompatible exrc secure
set number relativenumber cursorline
set shiftwidth=4 tabstop=4 autoindent smartindent noexpandtab
set autowriteall hidden noswapfile
set laststatus=2
set wildmenu
set clipboard=unnamedplus
set ssop-=options
set ssop-=folds
set laststatus=2
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tikhomirov/vim-glsl'
call vundle#end()

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
match ErrorMsg '\s\+$'

"center on g/G
nnoremap gg ggzz
nnoremap G Gzz

" format binding
nnoremap <leader>f m'gg=G''k<CR>

" ag/fzf bindings
nnoremap <leader>fc "ayiw :Ag <C-r>a<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fw :Ag<CR>

" ctags bindings
nnoremap <silent> <leader>t :execute system("ctags -R", "$CWD")<CR>:echom "Updated tags"<CR>
nnoremap <leader>d <C-]>

" tab/buffer navigation
nnoremap <silent> <C-h> :tabprev<CR>
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

augroup bindings_format
	autocmd!
	autocmd BufNewFile,BufRead *.hpp,*.cpp,*.h,*.c,*.y,*.l,*.cs setlocal equalprg=clang-format\ -style=file
	autocmd BufNewFile,BufRead CMakeLists.txt,*.cmake setlocal equalprg=cmake-format\ -\ \|\ unexpand\ \|\ sponge
	autocmd BufNewFile,BufRead *.py setlocal equalprg=black\ -q\ \ -
	autocmd BufNewFile,BufRead *.rs setlocal equalprg=rustfmt
	autocmd BufNewFile,BufRead *.elm setlocal equalprg=elm-format\ --stdin
augroup end

augroup bindings_switch_hdr_src
	autocmd!
	autocmd BufNewFile,BufRead *.c nnoremap <buffer> <leader>s :e %:r.h<CR>
	autocmd BufNewFile,BufRead *.h nnoremap <buffer> <leader>s :e %:r.c<CR>
	autocmd BufNewFile,BufRead *.c nnoremap <buffer> <leader>v :vspl %:r.h<CR>
	autocmd BufNewFile,BufRead *.h nnoremap <buffer> <leader>v :vspl %:r.c<CR>
	autocmd BufNewFile,BufRead *.cpp nnoremap <buffer> <leader>s :e %:r.hpp<CR>
	autocmd BufNewFile,BufRead *.cpp nnoremap <buffer> <leader>v :vspl %:r.cpp<CR>
	autocmd BufNewFile,BufRead *.hpp nnoremap <buffer> <leader>s :e %:r.hpp<CR>
	autocmd BufNewFile,BufRead *.hpp nnoremap <buffer> <leader>v :vspl %:r.cpp<CR>
augroup end

augroup other_stuff
	autocmd!
	autocmd BufNewFile,BufRead *.elm,*.yml,*.yaml,*.hs set expandtab
augroup end
