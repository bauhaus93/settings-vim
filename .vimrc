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
" set expandtab
let mapleader=","
let g:netrw_liststyle=3
let g:netrw_banner=0

augroup templates
    autocmd!
    autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
augroup end

augroup bindings_rust
    autocmd!
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>df :r ~/.vim/snippets/rust/default.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>ds :r ~/.vim/snippets/rust/display.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>o :r ~/.vim/snippets/rust/ord.rs<CR>/T<CR>ciw
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>e :r ~/.vim/snippets/rust/error.rs<CR>/{<CR>o
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>fe :r ~/.vim/snippets/rust/from_error.rs<CR>f<ci<
    autocmd BufNewFile,BufRead *.rs nnoremap <buffer> <leader>c :! cargo check<CR>
augroup end

augroup bindings_latex
    autocmd!
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>i :r ~/.vim/snippets/tex/itemize.tex<CR>jA
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>s :r ~/.vim/snippets/tex/sec.tex<ESC>ci}
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>ss :r ~/.vim/snippets/tex/ssec.tex<ESC>ci}
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>sss :r ~/.vim/snippets/tex/sssec.tex<ESC>ci}
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>f :r ~/.vim/snippets/tex/formula_inl.tex<ESC>hi
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader>ff :r ~/.vim/snippets/tex/formula_ex.tex<ESC>hi
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <leader><F8> :! pdflatex -halt-on-error -file-line-error %<CR>
augroup end

augroup bindings_cmake
    autocmd!
    autocmd BufNewFile,BufRead CMakeLists.txt nnoremap <buffer> <leader>f :1,$d<CR>:0r! cmake-format % \| unexpand \| sponge <CR>
augroup end
