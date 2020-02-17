" help ctrl-w
" |CTRL-W__|	CTRL-W _	   set current window height to N (default: very
" high)

call plug#begin(stdpath('data') . '/plugged')
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release'}
call plug#end()

" fzf settings
let $FZF_DEFAULT_COMMAND = 'rg --files --glob "!*node_module*" --glob "!*bin*" --glob "!*obj*" --glob "!*build*" --glob "!*packages*"'

" neovim settings
let maplocalleader = ','

set autoindent
set hidden
set ignorecase
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
syntax off

highlight PMenu ctermbg=black ctermfg=white

nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>
nmap <leader><leader> <c-^>
nmap <leader>b :Buffers<cr>
nmap <leader>e :Files<cr>
nmap <leader>t :call <SID>GoToShell()<cr>
nmap <space> :
tnoremap <leader><leader> <c-\><c-n>

" coc settings
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']
nmap <localleader>d <Plug>(coc-definition)
nmap <localleader>i <Plug>(coc-implementation)
nmap <localleader>u <Plug>(coc-references)
nmap <localleader>n <Plug>(coc-diagnostic-next)
nmap <localleader>p <Plug>(coc-diagnostic-previous)
nmap <localleader>a :CocAction<cr>
nmap <localleader>f :call CocAction('format')<cr>
inoremap <silent><expr> <c-space> coc#refresh()

augroup Coc
	autocmd BufWritePre *.js,*.jsx,*.tsx,*.ts :call CocAction('format')
augroup end

function! s:GoToShell()
    if bufexists('shell')
        buffer shell
        startinsert
    else
        terminal
        file shell
        startinsert
    endif
endfunction
