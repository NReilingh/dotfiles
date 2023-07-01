" Spaces instead of tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent

" Something about buffers
set hidden

" Editor layout
set number relativenumber
set signcolumn=yes
set colorcolumn=80

" Text rendering
set nowrap
set listchars=tab:\\u00bb\ ,eol:\\u21b2,extends:\|,precedes:\|,lead:\\u00b7,trail:\\u00b7,nbsp:\\u2620
set list

" Editor behavior
set mouse=n
set scrolloff=5
set scroll=15
" Make the block cursor in insert mode instead of neovim's default bar
set guicursor=
" macOS Terminal does not support True Colors
" Ref: https://github.com/termstandard/colors
set termguicolors " Need to experiment with this.
" Incomplete mappings will not exit automatically
" set showcmd is default, also
set notimeout ttimeout ttimeoutlen=100
" Fuzzier finding of paths with :find et al
set path+=**

" Space is a good leader key because it's not useful in normal mode.
" I can't emphasize this enough: space as leader is life changing.
let mapleader = " "

" Set a shortcut to toggle visible whitespace on and off.
nnoremap <silent> <Leader>l <Cmd>set list!<CR>
" Remove search highlighting.
nnoremap <silent> <Leader>h <Cmd>nohlsearch<CR>
nnoremap <Leader>s <Cmd>write<CR>
nnoremap <Leader>w <Cmd>bprevious<CR><Cmd>bdelete #<CR>
nnoremap <Leader>rl <Cmd>LspRestart<CR>

" Makes autocmd assignments idempotent!
augroup NmrSaveVimrc
    autocmd!
    " Automatically source vimrc when saving it
    autocmd BufWritePost init.vim source $MYVIMRC
    autocmd BufWritePost lsp.lua source $MYVIMRC
augroup END

" Install vim-plug if it's not already installed.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'rebelot/kanagawa.nvim'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'rust-lang/rust.vim'

Plug 'numToStr/Comment.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'natecraddock/telescope-zf-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'github/copilot.vim'

" Colorschemes
Plug 'rose-pine/neovim'
Plug 'fabi1cazenave/kalahari.vim'
Plug 'josephwecker/murphytango.vim'
Plug 'reewr/vim-monokai-phoenix'
Plug 'sainnhe/sonokai'
call plug#end()

colorscheme kanagawa

"Do all the config stuff for LSP and the like
luafile ~/.config/nvim/lsp.lua

set completeopt=menu,menuone,noselect,preview

" Find files using Telescope command-line sugar.
nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fr <Cmd>Telescope grep_string<CR>
nnoremap <Leader>fb <Cmd>Telescope buffers<CR>
nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>

nnoremap <Leader>i :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>e :lua vim.diagnostic.open_float()<CR>

augroup NmrQuickFixMaps
    autocmd!
    autocmd FileType qf nnoremap <buffer> o <CR><C-w>p
augroup END

" Use * as tmux buffer instead of duplicating system clipboard on +.
let g:clipboard = {
    \   'name': 'macos+tmux',
    \   'copy': {
    \      '+': ['pbcopy'],
    \      '*': ['tmux', 'load-buffer', '-'],
    \    },
    \   'paste': {
    \      '+': ['pbpaste'],
    \      '*': ['tmux', 'save-buffer', '-'],
    \   },
    \   'cache_enabled': 0,
    \ }
