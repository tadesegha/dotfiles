" help ctrl-w
" |CTRL-W__|  CTRL-W _	 set current window height to N (default: very
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
set noexpandtab
set hidden
set ignorecase
" set list
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
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html']
nmap <localleader>d <Plug>(coc-definition)
nmap <localleader>i <Plug>(coc-implementation)
nmap <localleader>u <Plug>(coc-references)
nmap <localleader>n <Plug>(coc-diagnostic-next)
nmap <localleader>p <Plug>(coc-diagnostic-previous)
nmap <localleader>r <Plug>(coc-rename)
nmap <localleader>a :CocAction<cr>
nmap <localleader>f :call CocAction('format')<cr>
inoremap <silent><expr> <c-space> coc#refresh()

augroup Coc
  autocmd!
  " autocmd BufLeave *.js,*.jsx,*.tsx,*.ts,*.html :call CocAction('format')
  autocmd BufEnter *.js,*.jsx,*.tsx,*.ts,*.html :call s:TabsAndSpaces()
augroup end

augroup TloCustom
	autocmd!
	autocmd BufEnter *.js,*.scss :call s:AlternateFile()
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

function! s:AlternateFile()
	if match(&filetype, "javascript") == 0 && filereadable(expand('%:r') . '.scss')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.scss<cr>'
	elseif match(&filetype, "scss") == 0 && filereadable(expand('%:r') . '.js')
		execute 'nmap <buffer> <localleader><localleader> :edit ' . expand('%:r') . '.js<cr>'
	endif
endfunction
