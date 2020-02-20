syntax on
colorscheme desert
set nocompatible
set number relativenumber
set nu rnu
set exrc
set secure
set cursorline
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set noexpandtab
set autowrite
set laststatus=2
set wildmenu
set path=**/**3
set path+=**
set wildignore+=**/__pycache__/**
set wildignore+=**/build/**
set wildignore+=**/env/**
set wildignore+=**/target/**
set clipboard=unnamedplus
set ssop-=options
set ssop-=folds
set laststatus=2
set statusline=%(%t%m%r%)%{GetGitBranch()}%=[%l/%L]
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20

nnoremap <leader>f m'gg=G''k<CR>

nnoremap <C-j> 50jzz
nnoremap <C-k> 50kzz
nnoremap <C-y> <C-a>
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <n> nzz
nnoremap <N> Nzz

" building/running
nnoremap <leader>b mo<CR>:execute BuildCmd()<CR>'ok<CR>
nnoremap <leader>r mo<CR>:execute RunCmd()<CR>'ok<CR>

match ErrorMsg '\s\+$'

augroup bindings_cpp
    autocmd!
    autocmd BufNewFile,BufRead *.hpp,*.cpp :compiler gcc
    autocmd BufNewFile,BufRead *.hpp,*.cpp setlocal equalprg=clang-format\ -style=file
augroup end

augroup bindings_c
    autocmd!
    autocmd BufNewFile,BufRead *.h,*.c :compiler gcc
    autocmd BufNewFile,BufRead *.h,*.c,*.y,*.l setlocal equalprg=clang-format\ -style=file

    autocmd BufNewFile,BufRead *.h,*.c nnoremap <buffer> \doc :r ~/.vim/snippets/c/doc_file.c<CR>
    autocmd BufNewFile,BufRead *.h,*.c nnoremap <buffer> \fdoc :r ~/.vim/snippets/c/doc_func.c<CR>
    autocmd BufNewFile,BufRead *.c nnoremap <buffer> <leader>s :e %:r.h<CR>
    autocmd BufNewFile,BufRead *.c nnoremap <buffer> <leader>v :vspl %:r.h<CR>
augroup end

augroup bindings_c_header
    autocmd BufNewFile,BufRead *.h nnoremap <buffer> <leader>s :e %:r.c<CR>
    autocmd BufNewFile,BufRead *.h nnoremap <buffer> <leader>v :vspl %:r.c<CR>
augroup end

augroup bindings_cmake
    autocmd!
    autocmd BufNewFile,BufRead CMakeLists.txt,*.cmake setlocal equalprg=cmake-format\ -\ \|\ unexpand\ \|\ sponge
augroup end

augroup bindings_rust
autocmd!
    autocmd BufNewFile,BufRead *.rs :compiler cargo
    autocmd BufNewFile,BufRead *.rs setlocal equalprg=rustfmt
augroup end

augroup bindings_elm
	autocmd!
	autocmd BufNewFile,BufRead *.elm set syntax=elm
	autocmd BufNewFile,BufRead *.elm set expandtab
    autocmd BufNewFile,BufRead *.elm setlocal equalprg=elm-format\ --stdin
augroup end

augroup bindings_yaml
	autocmd!
	autocmd BufNewFile,BufRead *.yml,*.yaml set expandtab
augroup end

augroup bindings_tex
	autocmd!
	autocmd BufNewFile,BufRead *.tex nnoremap <leader>i i\begin{itemize}<Esc>yyplciwend<ESC>O<TAB>\item<Space>
augroup end
