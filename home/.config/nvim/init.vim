"Map leader to space
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>
"map <Space> <leader> 
" Specify a directory for plugins
"
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"  :PlugInstall 
call plug#begin('~/.config/nvim/plug/')

" Themes {{{
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'liuchengxu/vista.vim'

" }}}

Plug 'mhinz/vim-signify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'easymotion/vim-easymotion'
Plug 'yegappan/mru'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'mbbill/undotree'

Plug 'SirVer/ultisnips'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'                               " git support
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }



" Search {{{
Plug 'nelstrom/vim-visual-star-search'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-fish' }
Plug 'junegunn/fzf.vim'

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
Plug 'luochen1990/rainbow'
" }}}

" Python {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"""""let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'


Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Raimondi/delimitMate'
" }}}

" Initialize plugin system
call plug#end()

" deoplete tab-complete
inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
"automatically closing the scratch window at the top of the vim window on finishing a complete or leaving insert
augroup pumvisible
  autocmd!
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

"'vim-syntastic/syntastic'
" Note that airline will set the statusline info, so these three lines are not needed
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
set clipboard=unnamed
"vnoremap y "*y
"vnoremap p "*p


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
\ { 'i': '~/.config/i3/config'},
\ { 'n': '~/.config/nvim/init.vim' },
\ { 't': '~/.config/tmux/tmux.conf' },
\ { 'z': '~/.zshrc' },
\ ]
let g:startify_custom_footer =
\ [
\ '', "   Put new things here!", '',
\ "   Try :UndotreeToggle https://github.com/mbbill/undotree", '',
\ "   Try nelstrom/vim-visual-star-search Select with VISUALMODE and search for pattern using */# ", '',
\ "   Try :SSave    save a session in vim-startify", '',
\ "   Try :Ultisnip 'TODO<tab> + yaml.ansible'", '',
\ "   Try <leader> \\", '',
\ "   Try :FZF <leader>o", '',
\ ]

"Plug 'junegunn/fzf.vim'
" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'
" [Buffers] Jump to the existing window if possible
" let g:fzf_buffers_jump = 1

nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> <leader>O :FZF!<CR>
nnoremap <silent> <leader>l  :FzfBuffers<CR>
nnoremap <silent> <leader>b :FzfBLines<CR>
nnoremap <silent> <leader>`  :FzfMarks<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <F1> :FzfHelptags<CR>
inoremap <silent> <F1> <ESC>:FzfHelptags<CR>`


set mouse=a

"mkdir ~/nvim for shada (old viminfo)
set shada='50,<1000,s100,:1000,n~/.local/share/nvim/shada/main.shada

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

"Easier split navigations
"We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"More natural split opening
"Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

"Source config after every write
"autocmd BufWritePost ~/.config/nvim/init.vim source %

" Toggle paste mode mode with <Leader>pp
nnoremap <Leader>pp :set paste!<CR>

" Indent whole file while preserving cursor location with <Leader>=
nnoremap <Leader>= m'gg=G`'

" Clear trailing whitespace with <Leader>cw
nnoremap <Leader>cw :%s/\s\+$//g<CR>:nohlsearch<CR>

" select all text in buffer
map <Leader>a ggVG

" Paste at end of the line
map <Leader>p A<Space><ESC>p

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"let $FZF_DEFAULT_OPTS='    --margin=1,4'
let g:fzf_layout = { 'window': 'call OpenPaddedFloating()' }

let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
let g:rainbow_active = 1 

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

"let g:vista_default_executive = 'nvim-lsp'
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
