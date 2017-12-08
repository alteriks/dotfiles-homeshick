
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugins/')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux'

" Initialize plugin system
call plug#end()

"'iCyMind/NeoSolarized'
"https://github.com/icymind/NeoSolarized#tmux
colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
set termguicolors

"'vim-airline/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
 
   

" 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1
"let g:signify_line_highlight = 1
let g:signify_realtime = 1

"yank/paste with xclip
set clipboard=unnamed
