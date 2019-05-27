" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"  :PlugInstall 
call plug#begin('~/.config/nvim/plug/')

" Themes {{{
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}

Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'easymotion/vim-easymotion'
Plug 'yegappan/mru'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'mbbill/undotree'

" Search {{{
Plug 'nelstrom/vim-visual-star-search'
Plug 'junegunn/fzf'
" }}}
"Plug 'Shougo/denite.nvim'
"nmap ; :Denite buffer -split=floating -winrow=1<CR>
"nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
"nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
"nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>


" Linters {{{
  Plug 'w0rp/ale'
" }}}
"

" Syntax highlight {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" }}}

" Python {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
" deoplete tab-complete
inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
"automatically closing the scratch window at the top of the vim window on finishing a complete or leaving insert
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Raimondi/delimitMate'


" }}}

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
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
 
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


" Linters 'w0rp/ale'
let g:ale_fixers = {
\   'puppet': ['puppetlint'],
\}
let g:ale_fix_on_save = 1

" 'plasticboy/vim-markdown'
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 2
set conceallevel=2

" 'mhinz/vim-startify'
let g:startify_bookmarks = [
  \ { 'n': '~/.config/nvim/init.vim' },
  \ { 'i': '~/.config/i3/config'},
  \ ]
let g:startify_custom_footer =
  \ [
  \ '', "   Put new things here!", '',
  \ "   Try :UndotreeToggle https://github.com/mbbill/undotree", '',
  \ "   Try nelstrom/vim-visual-star-search Select with VISUALMODE and search for pattern using */# ", '',
  \ "   Try :SSave    save a session in vim-startify", '',
  \ ]

set mouse=a

"mkdir ~/nvim for shada (old viminfo)
set shada='50,<1000,s100,:0,n~/.local/share/nvim/shada/main.shada

"better tab completion
set wildmode=longest,list,full

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
