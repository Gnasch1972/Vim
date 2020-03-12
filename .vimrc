" *****************************************************************************
" Author: Joseph Cunningham
" Date: 3/7/2020
" File:  .vimrc
" This is an attempt to try some new settings.
" *****************************************************************************

" This must be first to make things work in VIM

set nocompatible

" *** General Settings to make vim workable as an IDE *************************

set backspace=indent,eol,start 	" Allows backspace key to work
set history=100			" keeps 100 lines of CMD line hitory
set ruler 			" Set the ruler up
set tw=80			" line width is 80
set number 			" Line numebrs
set showcmd 			" Displays a list of commands issued
set incsearch			" Displays results of search and you type them
set hlsearch 			" Turns search highlighting on
syntax enable 			" Enables colors to be maintained with highlighting
set mouse=a 			" Enables the mouse
set linebreak			" wrap lines on 'word' boundries
set scrolloff=3			" don't let the cursor touch the edge of the viewport
set splitright			" Vertical splits use right half of screen
set autoindent          " indents the next line to where it left off
"******************************************************************************

" ***  For timeout issue when typing commands *********************************

set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50

"******************************************************************************

" *** Indent wrapped lines up to the same level

if exists('&breakinted')
    set breakindent
endif

" *****************************************************************************

" *** Tab Settings ************************************************************

"set expandtab 			" Expands tabs into spaces
se tabstop=4			" default to 4 spaces for a hard tab
set softtabstop=4		" default to 4 spaced for soft tab
set shiftwidth=4		" for when <TAB> is pressed at the beginning of a line

"******************************************************************************

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" *** Set color scheme ********************************************************

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" *****************************************************************************

" *** vim-airline settings - status bar at the bottom *************************

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='ayu'

" *****************************************************************************

" ***  jistr/vim-nerdtree-tabs - Enables NERDTree side panel ******************
" Open/close NERDTree Tabs with \t
map <C-n> :NERDTreeToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" *****************************************************************************

"" *** scrooloose/syntastic settings - Syntax checker by file type ***********
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup ENDi

" *****************************************************************************

" ***  xolox/vim-easytags settings - Creates tags for tagbar ******************
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" *****************************************************************************

" ***  majutsushi/tagbar settings - opens a left window to shoe functions *****
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" *****************************************************************************

" *** airblade/vim-gitgutter settings - Use GIT inside of VIM ******************

" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" *****************************************************************************

" *** Raimondi/delimitMate settings - Places delimiters in pairs **************

let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" *****************************************************************************

" *** jez/vim-superman settings - open man pages in vim **********************
" better man page support
noremap K :SuperMan <cword><CR>

"******************************************************************************

"*** YouCompleteMe  **********************************************************

let g:ycm_global_ycm_extra_conf='$HOME/.vim/pack/bundle/start/ycm_extra_conf.py'

