syntax on
colorscheme desert
set number relativenumber
set nu rnu
set exrc
set secure
set cursorline
set shiftwidth=8
set tabstop=8
set autoindent
set smartindent
set noexpandtab
set autowrite
set path=**/**
set path+=**
set wildignore+=**/__pycache__/**
set wildignore+=**/build/**
set wildignore+=**/env/**
set wildignore+=**/target/**
set clipboard=unnamedplus
set ssop-=options
set ssop-=folds
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0

nnoremap <leader>f m'gg=G''k<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprevious<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>d :vspl %<CR>
nnoremap <leader>ym yyma<CR>


" folds
nnoremap <leader>z zfa}<CR>

" tabs
nnoremap <leader>t :tabn<CR>

" session
nnoremap <leader>ws :mksession! .session.vim<CR>
nnoremap <leader>wl :source .session.vim<CR>

" building
nnoremap <leader>b :make<CR><CR>:ccl<CR>:cl<CR>
nnoremap <leader>r :execute RunCmd()<CR>

augroup group_all
    autocmd!
    autocmd BufNewFile,BufRead *.* let &l:makeprg = GetBuildCmd()
augroup end

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
