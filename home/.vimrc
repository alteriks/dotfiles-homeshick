" TODO http://swiety-python.blogspot.com/2013/01/vim-jako-python-ide.html
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set t_Co=256
set background=dark
set term=screen-256color
let g:solarized_termcolors=256
colorscheme solarized

"https://stackoverflow.com/questions/8604150/with-term-screen-256color-under-tmux-home-and-end-keys-dont-work-why
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

"
" tagbar + ctags + python-ctags (majutsushi/tagbar)
"
nmap <F8> :TagbarToggle<CR>

"
" airline
"
let g:airline_symbols = {}
let g:airline_symbols.space = " "
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set timeout timeoutlen=3000 ttimeoutlen=100
set ai ruler showmode showmatch wildmenu showcmd ls=2
let g:airline_theme = 'badwolf'

"
" airline + tmux (edkolev/tmuxline.vim)
"
let g:airline#extensions#tmuxline#enabled = 0


"
" pymode
"
"Turn on the run code script <leader>r
let g:pymode_run = 0

" Disable pymode_rope completion for https://github.com/davidhalter/jedi-vim
" to work
let g:pymode_rope = 0
" let g:pymode_rope_lookup_project=0

let g:pymode_lint_ignore = "E501,W"

"Turn on autocompletion when typing a period
"use <Ctrl-Space>
let g:pymode_rope_complete_on_dot = 0

" Automatically fix PEP8 errors in the current buffer:
" noremap <F8> :PymodeLintAuto<CR>

" Setup max line length                       'g:pymode_options_max_line_length'
" let g:pymode_options_max_line_length = 79
