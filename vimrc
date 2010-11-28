set nocp
set si
syntax enable
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set guioptions=c
set smartcase

filetype plugin on
filetype indent on


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rails_abbreviations = 0
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd BufNewFile,BufRead *.rb,*.rhtml source ~/.vim/scripts/rubysnippets.vim

autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

let SVNCommandEdit='edit'


let g:proj_flags="imstg"

"enable line numbers
set nu

colorscheme sand

autocmd BufRead /home/monk/crypto/notes/*  set ft=viki

set foldcolumn=4
let g:vikiNameSuffix='.txt'

"set guifont=Liberation\ Mono\ 11
set guifont=Meslo\ LG\ L\ 11
map \r :RunSpec<CR>
nmap \y :!touch tmp/restart.txt<CR><CR>:!rm log/*.log<CR><CR>

imap jj <Esc>

nnoremap <silent> <F12> :NERDTreeToggle /home/monk/project<cr>

let g:syntastic_enable_signs=1
