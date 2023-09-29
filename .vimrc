call plug#begin('~/.vim/plugged') " BEGIN

Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'fatih/vim-go', {'do':':GoUpdateBinaries'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['go','javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end() " END

" GENERAL SETTINGS 
syntax enable
set bs=2
set hidden
set hlsearch
set expandtab
set incsearch
set tabstop=4
set smartcase
set ignorecase
set noswapfile
set autoindent
set splitbelow 
set smartindent
set belloff=all
set laststatus=2
set shiftwidth=4
set termguicolors
set relativenumber
set background=dark 
set guicursor+=i:block-cursor
set timeout timeoutlen=5000 ttimeoutlen=100
" KEY BINDINGS 
let mapleader="\<SPACE>"
nmap <silent> <leader>v :vsp<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> mm :noh<CR> " clear highlight selection
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" CTRLP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env'
" AIRLINE
let g:airline#extensions#tabline#enabled = 1
" PRETTIER
let g:prettier#exec_cmd_async = 1
" GOLANG
let g:go_fmt_command="goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)