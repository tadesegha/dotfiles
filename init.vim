call plug#begin(stdpath('data') . '/plugged')
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release'}
call plug#end()

set autoindent
set expandtab
set hidden
set list
set listchars=eol:¬,trail:·,tab:»\ 
set nohlsearch
set noswapfile
set number
set relativenumber
set shiftwidth=4
set smartcase
set smartindent
set tabstop=4
set updatetime=300
set linespace=7
set splitright

nmap <space> :
nmap <leader>e :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>t :call <SID>GoToShell()<cr>
nmap <c-l> <c-w><c-l>
nmap <c-h> <c-w><c-h>
nmap <c-k> <c-w><c-k>
nmap <c-j> <c-w><c-j>
tnoremap <leader><leader> <c-\><c-n>

function! s:GoToShell()
    if bufexists('shell')
        :buffers shell
    else
        echo 'buffer does not exist'
    endif
endfunction
