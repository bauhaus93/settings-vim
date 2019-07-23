syntax on
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
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0

augroup templates
    autocmd!
    autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
augroup end

augroup bindings_rust
    autocmd!
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>df :r ~/.vim/snippets/rust/default.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>ds :r ~/.vim/snippets/rust/display.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>o :r ~/.vim/snippets/rust/ord.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>e :r ~/.vim/snippets/rust/error.rs<CR>/{<CR>o
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>fe :r ~/.vim/snippets/rust/from_error.rs<CR>f<ci<
    autocmd BufNewFile,BufRead,FileType rust nnoremap <buffer> <leader>c :! cargo check<CR>
augroup end

augroup bindings_latex
    autocmd!
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>i :r ~/.vim/snippets/tex/itemize.tex<CR>jA
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>s i\section{}<ESC>ci}
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>ss i\subsection{}<ESC>ci}
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>sss i\subsubsection{}<ESC>ci}
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>f i\(\)<ESC>hi
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader>ff i\[\]<ESC>hi
    autocmd BufNewFile,BufRead,FileType tex nnoremap <buffer> <leader><F8> :! pdflatex -halt-on-error -file-line-error %<CR>
augroup end
