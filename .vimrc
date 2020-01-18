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
set path=**/**
set path+=**
set wildignore+=**/__pycache__/**
set wildignore+=**/build/**
set wildignore+=**/env/**
set wildignore+=**/target/**
set clipboard=unnamedplus
set ssop-=options
set ssop-=folds
set laststatus=2
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20

nnoremap <leader>f m'gg=G''k<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprevious<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>d :vspl %<CR>
nnoremap <leader>ym yyma<CR>
nnoremap <leader>q bi'<Esc>ea'<Esc>

nnoremap <C-j> 50jzz
nnoremap <C-k> 50kzz
nnoremap <C-y> <C-a>

nnoremap <n> nzz
nnoremap <N> Nzz

" building/running
nnoremap <leader>b :execute BuildCmd()<CR>
nnoremap <leader>r :execute RunCmd()<CR>

augroup bindings_cpp
    autocmd!
    autocmd BufNewFile,BufRead *.hpp,*.cpp :compiler gcc
    autocmd BufNewFile,BufRead *.hpp,*.cpp setlocal equalprg=clang-format\ -style=file
augroup end

augroup bindings_c
    autocmd!
    autocmd BufNewFile,BufRead *.h,*.c :compiler gcc
    autocmd BufNewFile,BufRead *.h,*.c,*.y,*.l setlocal equalprg=clang-format\ -style=file

    autocmd BufNewFile,BufRead *.h,*.c nnoremap <buffer> \guard :0r ~/.vim/snippets/c/guard.c<CR>
    autocmd BufNewFile,BufRead *.h nnoremap <buffer> \extern :r ~/.vim/snippets/c/extern_c.c<CR>
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
    autocmd BufNewFile,BufRead *.h,*.c :compiler cargo
    autocmd BufNewFile,BufRead *.rs setlocal equalprg=rustfmt

    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \default :r ~/.vim/snippets/rust/default.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \display :r ~/.vim/snippets/rust/display.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \ord :r ~/.vim/snippets/rust/ord.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \error :r ~/.vim/snippets/rust/error.rs<CR>/{<CR>o
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \fromerror :r ~/.vim/snippets/rust/from_error.rs<CR>f<ci<
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
