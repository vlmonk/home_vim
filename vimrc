set nocp
set si
syntax enable
set nowrap
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set guioptions=c
set ignorecase
set smartcase
set hidden
set nobackup
set noswapfile
set hlsearch

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

autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

" pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" set mapleater
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

" highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" remap : to ;
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clear selection buffer
nmap <silent> ,/ :nohlsearch<CR>

let SVNCommandEdit='edit'

" use w!! to save with sudo
cmap w!! w !sudo tee % >/dev/nul


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

"nnoremap <silent> <F12> :NERDTreeToggle /home/monk/project<cr>

let g:syntastic_enable_signs=1
