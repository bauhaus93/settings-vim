syntax on
colorscheme desert
set number relativenumber
set nu rnu
set exrc
set secure
set cursorline
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set expandtab
set path=**/**
set wildignore+=**/build/**
set clipboard=unnamedplus
set ssop-=options
set ssop-=folds
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0

nnoremap <leader>f m'gg=G''k<CR>
nnoremap <leader>a :s/_\([a-su-z]\)/\U\1/g<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprevious<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>d :vspl %<CR>

" folds
nnoremap <leader>z zfa}<CR>

" tabs
nnoremap <leader>tn :tabedit<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tt :tabn<CR>

" session
nnoremap <leader>ss :mksession! .session.vim<CR>
nnoremap <leader>sl :source .session.vim<CR>

augroup group_all
    autocmd!
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview
augroup end

augroup templates
    autocmd!
    autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
augroup end

augroup bindings_cpp
    autocmd!
    autocmd BufNewFile,BufRead *.hpp,*.cpp setlocal equalprg=clang-format\ -style=file
augroup end

augroup bindings_c
    autocmd!
    autocmd BufNewFile,BufRead *.h,*.c setlocal equalprg=clang-format\ -style=file
    autocmd BufNewFile,BufRead *.h,*.c nnoremap <buffer> \guard :0r ~/.vim/snippets/c/guard.c<CR>
    autocmd BufNewFile,BufRead *.h nnoremap <buffer> \extern :r ~/.vim/snippets/c/extern_c.c<CR>
    autocmd BufNewFile,BufRead *.h,*.c nnoremap <buffer> \doc :r ~/.vim/snippets/c/doc_header.c<CR>
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
    autocmd BufNewFile,BufRead *.rs setlocal equalprg=rustfmt
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>c :! cargo check<CR>
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \default :r ~/.vim/snippets/rust/default.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \display :r ~/.vim/snippets/rust/display.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \ord :r ~/.vim/snippets/rust/ord.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \error :r ~/.vim/snippets/rust/error.rs<CR>/{<CR>o
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> \fromerror :r ~/.vim/snippets/rust/from_error.rs<CR>f<ci<
augroup end

augroup bindings_latex
    autocmd!
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>b :! pdflatex -halt-on-error -file-line-error %<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> \itemize :r ~/.vim/snippets/tex/itemize.tex<CR>jA
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> \sec :r ~/.vim/snippets/tex/sec.tex<ESC>ci}
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> \ssec :r ~/.vim/snippets/tex/ssec.tex<ESC>ci}
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> \sssec :r ~/.vim/snippets/tex/sssec.tex<ESC>ci}
augroup end

