call plug#begin()
  Plug 'haishanh/night-owl.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'sirver/ultisnips'
  Plug 'omnisharp/omnisharp-vim'
  Plug 'vim-scripts/dbext.vim'
  Plug 'w0rp/ale'
  Plug 'Shougo/deoplete.nvim'
  Plug 'mxw/vim-jsx'
  Plug 'ianks/vim-tsx'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-fugitive'
  Plug 'PProvost/vim-ps1'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'vim-airline/vim-airline'
  Plug 'moll/vim-bbye'

  Plug 'tadesegha/vim-csharp'
  Plug 'tadesegha/vim-term'
call plug#end()

let maplocalleader = ','

set number
set relativenumber
set listchars=eol:¬,trail:·,tab:»\
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noswapfile
set hidden
set ignorecase
set smartcase
set smartindent
set list
set expandtab
set shiftwidth=2
set tabstop=2
set completeopt=menu,noinsert
set wrap
set nohlsearch
set cmdheight=2
set linespace=7
set splitright
set timeoutlen=250
set termguicolors

nnoremap <space> :
nnoremap <Leader>e :FZF<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader><Leader> <c-^>
tnoremap <Leader><Leader> <c-\><c-n>
nnoremap <Leader>t :call term#goToTerm('shell')<cr>a
nnoremap <Leader>d :call DatabaseBuffer()<cr>
nnoremap <Leader>/ :set hlsearch!<cr>
nnoremap L zL
nnoremap H zH
nnoremap <LocalLeader><LocalLeader> :ll<cr>
nnoremap <Leader>q :ccl<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap <Leader>guid <esc>:py3 import uuid<cr>a<c-r>=py3eval('str(uuid.uuid1())')<cr>

colorscheme night-owl

highlight LineNr guifg=#f15d2a ctermfg=white
highlight SpellBad cterm=underline ctermbg=none
highlight Pmenu ctermbg=white

" FZF settings
let $FZF_DEFAULT_COMMAND = 'rg --files --glob "!*node_module*" --glob "!*bin*" --glob "!*obj*" --glob "!*build*" --glob "!*packages*"'

" nvim-typescript settings
let $NVIM_NODE_LOG_FILE = 'c:\users\tolu_adesegha\temp\nvim-node.log'
let $NVIM_NODE_LOG_LEVEL = 'warn'

" ale settings
let g:ale_linters = { 'cs': ['OmniSharp'] }

" omnisharp settings
let g:OmniSharp_selector_ui = 'fzf'

" deoplete settings
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \ 'sources': { 'cs': ['omnisharp'] },
      \ 'auto_complete': v:false
      \ })

" prettier settings
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 120
let g:prettier#config#trailing_comma = 'none'
augroup prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
augroup END

augroup sql
  autocmd!
  autocmd FileType sql nnoremap <buffer> <LocalLeader>r :DBExecSQLUnderCursor<cr>
augroup END

augroup json
  autocmd!
  autocmd FileType json nnoremap <buffer> <LocalLeader>cf :%!python -m json.tool<cr>
augroup END

augroup xml
  autocmd!
  autocmd FileType xml nnoremap <buffer> <LocalLeader>cf :%!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"<cr>
augroup END

augroup quickfix
  autocmd!
  autocmd FileType qf nnoremap <buffer> q :ccl<cr>
augroup END

" -------- Coc Settings -----------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <LocalLeader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <LocalLeader>f  <Plug>(coc-format-selected)
nmap <LocalLeader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<LocalLeader>aap` for current paragraph
xmap <LocalLeader>a  <Plug>(coc-codeaction-selected)
nmap <LocalLeader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <LocalLeader>ca  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <LocalLeader><space>  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <c-c>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <c-c>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <c-c>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <c-c>o  :<C-u>CocList outline<cr>
" Search workc-c symbols
nnoremap <silent> <c-c>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <c-c>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <c-c>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <c-c>p  :<C-u>CocListResume<CR>

" ========= Windows OS specific settings ============
if has('win32') || has('win64')
  let windowsrc = expand('<sfile>:h') . "/init.windows.vim"
  if filereadable(windowsrc)
    execute "source " . windowsrc
  endif
endif

" ========= Mac OS specific settings ============
if !(has('win32') || has('win64'))
  let macrc = expand('<sfile>:h') . "/init.mac.vim"
  if filereadable(macrc)
    execute "source " . macrc
  endif
endif

" ========= Local settings ============
let localInitFile = expand('<sfile>:h') . "/init.local.vim"
if filereadable(localInitFile)
  execute "source " . localInitFile
endif
