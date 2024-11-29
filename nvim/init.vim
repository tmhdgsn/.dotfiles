" https://github.com/google/vim-codefmt
augroup autoformat_settings
    autocmd FileType bzl,WORKSPACE,BUILD,bazel AutoFormatBuffer buildifier
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType nix AutoFormatBuffer nixpkgs-fmt
    autocmd FileType python AutoFormatBuffer yapf
augroup END

" Taken from http://amix.dk/vim/vimrc.html
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set autoindent
set expandtab "use spaces for indenting lines
set tabstop=2 "use 2 spaces for tabs
set shiftwidth=2 "how much to indent when using << or >>

call plug#begin()
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ocaml/vim-ocaml'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

let python_highlight_all=1
syntax on

colorscheme iceberg

set rtp^="/Users/tmhdgsn/.opam/cs3110-2024sp/share/ocp-indent/vim"


filetype plugin on

" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" configure yapf (python formatter) style
let g:yapf_style = "google"

set relativenumber
