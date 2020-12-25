" ✓ - '<mapleader>-' in a text file

nmap h <nop>
nmap j <nop>
nmap k <nop>
nmap l <nop>
vmap h <nop>
vmap j <nop>
vmap k <nop>
vmap l <nop>

call plug#begin(stdpath('data') . '/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', { 'branch': 'release'}
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'vim-scripts/BufClose.vim'
	Plug 'sirver/ultisnips'
call plug#end()

" fzf settings
let $FZF_DEFAULT_COMMAND = 'rg --files --glob "!*node_modules/*" --glob "!*bin/*" --glob "!*obj/*" --glob "!*build/*" --glob "!*packages/*"'

" neovim settings
let mapleader = '-'
let maplocalleader = ','

" ultisnips settings
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

set autoindent
set expandtab
set hidden
set ignorecase
set list
set listchars=eol:¬,trail:·,tab:»\ 
set nohlsearch
set noswapfile
set number
set relativenumber
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2
set updatetime=300
set linespace=7
set timeoutlen=300
set guicursor=
set wildignore+=*/node_modules/*
syntax on

" highlight PMenu ctermbg=black ctermfg=white

nmap <leader><leader> <c-^>
nmap <leader><space> :Buffers<cr>
nmap <leader>e :Files<cr>
nmap <leader>t :call <SID>GoToShell()<cr>
nmap <leader>rc :e $MYVIMRC<cr>
nmap <space> :
nmap <leader>rt :call RunInTerminal("jest-tests", "watch-tests")<cr>
nmap <leader>rd :call RunInTerminal("dev-server", "run-dev")<cr>

" window navigation remappings
nmap <c-h> <c-w><c-h>
nmap <c-t> <c-w><c-j>
nmap <c-n> <c-w><c-k>
nmap <c-s> <c-w><c-l>
tnoremap <c-d> <c-\><c-n>
tnoremap <c-h> <c-\><c-n><c-w><c-h>
tnoremap <c-t> <c-\><c-n><c-w><c-j>
tnoremap <c-n> <c-\><c-n><c-w><c-k>
tnoremap <c-s> <c-\><c-n><c-w><c-l>

" terminal autocommands
augroup Terminal
  autocmd!
  autocmd BufEnter * call s:TerminalStartInsert()
  autocmd BufLeave * call s:TerminalStopInsert()
augroup end

" coc settings
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-prettier', 'coc-tsserver']
nmap <localleader>d <Plug>(coc-definition)
nmap <localleader>i <Plug>(coc-implementation)
nmap <localleader>u <Plug>(coc-references)
nmap <localleader>n <Plug>(coc-diagnostic-next)
nmap <localleader>p <Plug>(coc-diagnostic-previous)
nmap <localleader>r <Plug>(coc-rename)
nmap <localleader><space> <Plug>(coc-fix-current)
nmap <localleader>a <Plug>(coc-codeaction-selected)<cr>
inoremap <silent><expr> <c-a> coc#refresh()

augroup Coc
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.tsx,*.ts,*.html :call CocAction('format')
  autocmd BufEnter *.js,*.jsx,*.tsx,*.ts,*.html :call s:TabsAndSpaces()
augroup end

augroup TloCustom
	autocmd!
	autocmd BufEnter *.js,*.tsx :call s:InitStylesFile()
	autocmd BufEnter *.scss,*.css :call s:InitCodeFile()
augroup end

augroup TxtFiles
	autocmd!
	autocmd BufEnter *.txt nmap <buffer> <localleader>- r<c-v>u2713
augroup end

augroup VimConfig
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim :source %
augroup end

command! -nargs=1 -complete=dir NewWorkspace call s:NewWorkspace("<args>")
command! -nargs=1 Workspace call s:Workspace("<args>")
command! Dev call s:Dev()
command! -nargs=? Bd :BufClose <args>
command! FormatJson %! python -m json.tool
command! -nargs=1 Notes :e ~/OneDrive - adesegha/notes/<args>.txt
command! Todo :e ~/OneDrive - adesegha/notes/todo.txt
command! Inbox :e ~/OneDrive - adesegha/notes/inbox.txt
command! Auto :e ~/OneDrive - adesegha/notes/automation.txt
command! Quit call s:Quit()

function! s:GoToShell()
	if bufexists('shell')
		buffer shell
	else
		terminal
		file shell
		startinsert
	endif
endfunction

function! s:TabsAndSpaces()
	if exists("b:spacing")
		return
	endif

	let b:spacing = ''
	let lines = getline(1, '$')

	for line in lines
		if match(line, "^\t[^\t]") != -1
			let b:spacing = 'tabs'
		elseif (match(line, "^  [^ ]") != -1) && (b:spacing != 'tabs')
			let b:spacing = 'two spaces'
		elseif (match(line, "^    [^ ]") != -1) && (b:spacing != 'tabs') && (b:spacing == '')
			let b:spacing = 'four spaces'
		endif
	endfor

	if b:spacing == 'tabs'
		execute 'setlocal noexpandtab'
	elseif b:spacing == 'two spaces'
		execute 'setlocal tabstop=2 shiftwidth=2 expandtab'
	elseif b:spacing == 'four spaces'
		execute 'setlocal tabstop=4 shiftwidth=4 expandtab'
	endif
endfunction

function! s:InitStylesFile()
	if filereadable(expand('%:r') . '.scss')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.scss<cr>'
	endif
	if filereadable(expand('%:r') . '.css')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.css<cr>'
	endif
endfunction

function! s:InitCodeFile()
	if filereadable(expand('%:r') . '.js')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.js<cr>'
	elseif filereadable(expand('%:r') . '.tsx')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.tsx<cr>'
	endif
endfunction

function! s:Tests()
  if bufexists('jest-tests')
    buffer jest-tests
  else
    terminal
    file jest-tests
    call jobsend(b:terminal_job_id, "yarn run test\n")
  endif
endfunction

function! s:Dev()
  terminal
  file dev-server
  call jobsend(b:terminal_job_id, "yarn run dev\n")
endfunction

function! s:TerminalStartInsert()
  if &buftype ==# 'terminal'
    startinsert
  endif
endfunction

function! s:TerminalStopInsert()
  stopinsert
endfunction

function! s:StartShell()
  if bufexists('shell')
    buffer shell
  else
    terminal
    file shell
  endif
endfunction

function! s:Quit()
  bufdo bd
endfunction

source ~/tools/neovim/utilities.vim
source ~/tools/neovim/centralmarket.vim
source ~/tools/neovim/stoke.vim
source ~/tools/neovim/ulo.vim
source ~/tools/neovim/git.vim
