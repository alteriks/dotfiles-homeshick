" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugins/')

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'easymotion/vim-easymotion'
Plug 'yegappan/mru'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'

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

"'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"'yegappan/mru'
"let MRU_Use_Current_Window = 1
let MRU_Window_Height = 15
let MRU_Add_Menu = 0

"yank/paste with xclip
"ctrl+shift+v to paste yanked buffer (unnamedplus) doesn't conflict with
"MiddleClick in tmux.conf with xclip
set clipboard=unnamedplus

set mouse=a

"mkdir ~/nvim for shada (old viminfo)
set shada='50,<1000,s100,:0,n~/nvim/shada


" https://jeffkreeftmeijer.com/vim-number/
set relativenumber
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
