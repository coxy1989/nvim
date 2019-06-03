" Set leader key to space
let mapleader="\<SPACE>"

" Set font
set guifont=Fira\ Code:h6

"PLUGINS -------------------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim'
Plug 'jebberjeb/clojure-socketrepl.nvim'
Plug 'qpkorr/vim-bufkill'
Plug 'hkupty/iron.nvim'
Plug 'connorholyday/vim-snazzy'
Plug 'nightsense/plumber'
call plug#end()

" Python dependency for plugins
let g:python_host_prog = '/Users/jamiecox/.pyenv/versions/neovim2/bin/python'
" Using 3.5.x as here as clojure-vim/acid.nvim crashes with python < 3.5
let g:python3_host_prog = '/Users/jamiecox/.pyenv/versions/neovim3-5-3/bin/python'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Open nerdtree with alt + z 
:map Ω : NERDTreeToggle<ENTER>

" NerdTree ignore pyc
let NERDTreeIgnore = ['\.pyc$']

" Open IronRepl with alt + x
:map ≈ : IronRepl<ENTER>


" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" kill buffers with leader x
noremap <Leader>x :BD<CR>

" Toggle between normal and relative numbering.
nnoremap <leader>n :call NumberToggle()<cr>

" REPL

noremap <Leader>r :IronRepl<CR>
nmap <Leader>w Vctr
nmap <Leader>e VGctr
tnoremap <Esc> <C-\><C-n>

" Config for airline bar - the status bar..
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'


" RainbowParentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"NAVIGATION -------------------------------------------------------------------------------------------------

" Horizontal split below current.
set splitbelow

" Vertical split to right of current.
set splitright

" Show next 5 lines while scrolling.
if !&scrolloff
    set scrolloff=5
endif

" Show next 5 columns while side-scrolling.
if !&sidescrolloff
    set sidescrolloff=5
endif

" Make searching case insensitive
set ignorecase

" ... unless the query has capital letters.
set smartcase

" Use 'g' flag by default with :s/foo/bar/.
set gdefault 

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

set relativenumber

"Higlight Cursor Line

set cursorline

"Spacing

set linebreak
set breakindent
set linespace=2
set tabstop=2
set shiftwidth=2
set expandtab
"filetype indent plugin on


" Use ; for commands.
nnoremap ; :

"Splits - Alt + HJKL

nnoremap ∆ <C-W><C-J> 
nnoremap ˚ <C-W><C-K> 
nnoremap ¬ <C-W><C-L> 
nnoremap ˙ <C-W><C-H> 

" Cycle buffers - Ctrl + HJ

:nnoremap <C-l> :bnext<CR>
:nnoremap <C-h> :bprevious<CR>


nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>j G
nnoremap <Leader>k gg

"SAVING -----------------------------------------------------------------------------------------------------

:au FocusLost * :wa
set autowrite
nnoremap zz  :w <CR>

"FORMATTING -------------------------------------------------------------------------------------------------

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

"JSON

nmap =j :%!python -m json.tool<CR>

"COLORS -----------------------------------------------------------------------------------------------------

"Syntax

syntax on
set showmatch

"Cosmetic

"Show true colors in terminal
"set termguicolors

"Set the colorscheme
"colorscheme industry
"colorscheme snazzy
colorscheme plumber-dark

"Set a colored column at 110 width
set colorcolumn=110

"LINES ------------------------------------------------------------------------------------------------------ 


"CLOJURE ----------------------------------------------------------------------------------------------------
augroup rainbow_lisp
autocmd!
autocmd FileType lisp,clojure,scheme,clojurescript RainbowParenthesesToggle
augroup END
au BufReadPost *.boot set syntax=clojure

