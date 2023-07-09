:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

set encoding=UTF-8

" Plugins --------------------------------------------------------------------

call plug#begin()

Plug 'https://github.com/preservim/nerdtree'             " NERDTree
Plug 'https://github.com/tpope/vim-commentary'           " For Commenting gcc & gc
Plug 'https://github.com/tc50cal/vim-terminal'           " Vim Terminal
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }       " Tokyo colorschemes
Plug 'elixir-editors/vim-elixir'                         " Elixir support
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Fuzzy file search
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'

call plug#end()

" Mappings -------------------------------------------------------------------

" General
nnoremap <Tab> <C-w>

" NERDTree
nnoremap <Tab><Tab> :NERDTreeFocus<CR>
nnoremap <Tab>t :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

" Set search highlighting toggle
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

" Dynamically reload init.vim
cnoreabbrev reload source $MYVIMRC<CR>

" Shortcut for changing window width
cnoreabbrev vres vertical resize

" Command for quickly changing colorschemes
cnoreabbrev day colorscheme tokyonight-day
cnoreabbrev storm colorscheme tokyonight-storm

" Initial setup --------------------------------------------------------------

" colorscheme tokyonight-day

:set colorcolumn=89

:set foldmethod=indent

" Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeMinimalUI=1
let NERDTreeStatusLine='tree'
let NERDTreeWinSize=30

"let NERDTreeDirArrowExpandable=":black_small_square:"
"let NERDTreeDirArrowCollapsible=":white_small_square:"

augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

" Whitespace remover
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
