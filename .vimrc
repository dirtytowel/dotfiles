set encoding=utf-8
set t_Co=16
syntax on
" Status bar
" set laststatus=2

" Last line
set showmode
set showcmd
set ttyfast

set number

set ruler

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
