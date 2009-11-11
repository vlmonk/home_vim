set nocp
set si
syntax enable
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set guioptions=-T
set smartcase
"remove toolbar 
set tb=
filetype plugin on
filetype indent on


autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rails_abbreviations = 0
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd BufNewFile,BufRead *.rb,*.rhtml source ~/.vim/scripts/rubysnippets.vim

let SVNCommandEdit='edit'


let g:proj_flags="imstg"

"enable line numbers
set nu

colorscheme sand

autocmd BufRead /home/monk/crypto/notes/*  set ft=viki

set foldcolumn=4
let g:vikiNameSuffix='.txt'

set guifont=Liberation\ Mono\ 11
map \r :RunSpec<CR>
nmap \t :!touch tmp/restart.txt<CR><CR>:!rm log/*.log<CR><CR>

imap jj <Esc>
imap оо <Esc> 
