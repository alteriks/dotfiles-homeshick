
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugins/')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'

" Initialize plugin system
call plug#end()

"'iCyMind/NeoSolarized'
colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "high"

"'vim-airline/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1 

" 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]

set clipboard=unnamed
