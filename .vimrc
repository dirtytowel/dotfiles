set encoding=utf-8
set t_Co=16
syntax on

set clipboard=unnamedplus

" Define an autocmd that triggers when lines are yanked
autocmd TextYankPost * silent! execute "Oscyank"

" Status bar
"set laststatus=2

" Last line configurations
" Display the current mode (e.g., INSERT, NORMAL)
set showmode

" Show the partial command as it's being typed
set showcmd

" Assume a fast terminal connection
set ttyfast

" Display line numbers
set number

" Display the cursor position in the lower right corner
set ruler

" Number of spaces a <Tab> character counts for
set tabstop=2

" Use relative line numbering to make it easy to move between lines
set relativenumber

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Improve the searching experience
set incsearch           " Show search matches as you type
set hlsearch            " Highlight search matches
nnoremap <leader><space> :nohlsearch<CR> " Clear highlighted search results
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
