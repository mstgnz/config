call plug#begin('~/.vim/plugged') " BEGIN

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'jnurmine/Zenburn'
Plug 'fugalh/desert.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tell-k/vim-autopep8'
Plug 'Yggdroot/indentLine'
Plug 'tomlion/vim-solidity'
Plug 'mhinz/vim-mix-format'
Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ibmedit.vim'
Plug 'pangloss/vim-javascript'
Plug 'chriskempson/base16-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'suan/vim-instant-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'vim-syntastic/syntastic.git'
Plug 'altercation/vim-colors-solarized'
Plug 'albertorestifo/vim-playground-colors'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end() " END

" COLOR SCHEME AND APPERANCE 
syntax enable
set termguicolors
set relativenumber
set background=dark
colorscheme base16-atelier-cave
set guicursor+=i:block-cursor " Always use blockcursor.
" GENERAL SETTINGS 
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
set smartindent
set shiftwidth=4
"set colorcolumn=80
set timeout timeoutlen=5000 ttimeoutlen=100
set splitbelow " split panes below instead above.
" OPTIMIZATIONS
let loaded_matchparen = 1 " avoid loading the param pluging
" KEY BINDINGS 
imap jj <Esc>
let mapleader="\<SPACE>"
nmap <silent> <leader>v :vsp<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> mm :noh<CR> " clear highlight selection
" ACK
nnoremap <Leader>f :Ack!<Space>
" NERDTREE
nmap <leader>b :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
" Coc completion engine
" use Tab to navigate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" commit completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" CTRLP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env'
" AIRLINE
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" PRETTIER
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.scss,*.json,*.md,*yaml PrettierAsync
let g:prettier#exec_cmd_async = 1
" LANGUAGE CONFIGURATION
" GOLANG
let g:go_fmt_command="goimports"
" ELIXIR
let g:mix_format_on_save = 1
" RUST
let g:rustfmt_autosave = 1
" PYTHON
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
" CUSTOM SCRIPTS
" Set the current indentation :Indent <number>
" E.G <:Indent 2> will set the indentation to 2 spaces.
:command -nargs=1 Ee :ident <args>
fun! s:indent(indent)
    execute ':set tabstop=' . a:indent
    execute ':set shiftwidth=' . a:indent
endfun
" Search and replace :Replace <origin> <dest>
" E.G <:Replace foo bar> will replace occurences of foo with bar.
fun! s:sub(search, replace)
    execute ':%s/' . a:search . '/' . a:replace . '/gc'
endfun
command! -nargs=+ Replace call s:sub(<f-args>)
command! -nargs=+ Indent call s:indent(<f-args>)