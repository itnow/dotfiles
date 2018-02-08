" Use vim settings, rather then vi settings. Must be first.
set nocompatible

" Setup swaps & backups
"
" if empty(glob('~/.vim/_bckp'))
"     silent call mkdir($HOME . '/.vim/_bckp', 'p', 0700)
" endif
" set backupdir=~/.vim/_bckp//
if empty(glob('~/.vim/_swp'))
    silent call mkdir($HOME . '/.vim/_swp', 'p', 0700)
endif
set directory=~/.vim/_swp//
set nobackup
set nowritebackup
" set backup
" set writebackup
" set noswapfile


set encoding=utf-8
set background=dark
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


" Load vim-plug
"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" --sync flag is used to block the execution until the installer finishes.

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


" Schemes
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
" Reload .vimrc and :PlugInstall to install plugins.


" colorscheme slate
colorscheme gruvbox


syntax enable                   " Enable syntax highlighting
" To see the current status:
"   :filetype
" To read more:
"   :h :filetype-overview
filetype plugin indent on


" Search down into subfolders.
" Provides tab-completion for all file-related tasks:
" - Hit tab to :find by particular match
" - Use * to make it fuzzy
"
" set path+=**
set path+=$PWD/**


set fileformats="unix"

" set mouse=a                     " Enable using the mouse if terminal emulator
                                  "  supports it (xterm does).

set lazyredraw                  " The screen will not be redrawn while executing
                                "  macros, registers and other commands that
                                "  have not been typed.
set showmode                    " Always show current mode.
set number                      " Show line numbers.
set cursorline                  " Highlight the current line.
set ruler                       " Show the line and column of the cursor position.
set showcmd                     " Show partial command in last line of the screen.
set wildmenu                    " Visual autocomplete for command menu.
set laststatus=2                " Always display status line.
set nowrap                      " Don't wrap lines.

set showmatch                   " Highlight matching [{()}].
set matchpairs+=<:>             " Append <> to pairs list.

set colorcolumn=80              " Hightlight at specified column.
" REF: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
hi ColorColumn ctermbg=236

set tabstop=4                   " A hard TAB displays as 4 columns.
set softtabstop=4               " Insert/delete 4 spaces when hitting a TAB/BACKSPACE.
set expandtab                   " Insert spaces when hitting TABs.

set shiftwidth=4                " Number of spaces to use for autoindenting,
                                "  operation '>>' indents 4 columns,
                                "  '<<' unindents 4 columns.
set shiftround                  " Round indent to multiple of 'shiftwidth'
                                "  when indenting with '<' and '>'.

set smarttab                    " Insert tabs on the start of a line according to
                                "  shiftwidth, not tabstop.

set autoindent                  " Always set autoindenting on.
set copyindent                  " Copy the previous indentation on autoindenting.


" Show current 'formatoptions':
"  :set fo?
" Show current and where it was set:
"  :verbose set fo?
" The default setting: 'tcq'.
set formatoptions+=1            " Don't break a line after a one-letter word.


set hlsearch                    " Highlight matches.
set incsearch                   " Search as characters are entered.
set ignorecase                  " Ignore case when searching.
set smartcase                   " Ignore case if search pattern is all lowercase,
                                "  case-sensitive otherwise.
" set gdefault                    " Search/replace 'globally' (on a line) by default.

set splitright                  " Open new split panes to right.
set splitbelow                  " Open new split panes to bottom.
set diffopt+=vertical           " Always use vertical diffs.

" set virtualedit=all             " Allow the cursor to go in to 'invalid' places.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set scrolloff=4                 " Minimal number of screen lines to keep above
                                "  and below the cursor.
" set sidescrolloff=4             " The minimal number of screen columns to keep
                                  "  to the left and to the right of the cursor.
" set sidescroll=1                " The minimal number of columns to scroll
                                  "  horizontally.


set list                        " Show invisible characters.
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" Highlight trailing whitespace:
" hi TrailWhitespace ctermbg=9
" match TrailWhitespace /\s\+$/
match WarningMsg /\s\+$/
" To show all highlight groups:
"   :hi


" Enable all Python syntax highlighting features.
let python_highlight_all = 1

" Treat <li> and <p> tags like the block tags they are.
let g:html_indent_tags = 'li\|p'

" Shortcuts: tabstop (ts), softtabstop (sts), shiftwidth (sw)
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2


" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window.
" It will change to the directory containing the file which was opened
" or selected.
" NOTE: When this option is on some plugins may not work.
" set autochdir




" Keys
" --------------------------------------------------------------------------


let mapleader = " "             " Map leader to spacebar

" Move lines up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi

" Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
" Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Toggle paste mode
set pastetoggle=<F10>

" Navigate properly when lines are wrapped
" nnoremap j gj
" nnoremap k gk

" Use tab to jump between blocks, because it's easier
" nnoremap <tab> %
" vnoremap <tab> %

" Quick save
" vnoremap <silent> <C-S>         <C-C>:update<CR>
" inoremap <silent> <C-S>         <C-O>:update<CR>
nnoremap <leader>s :update<CR>

" Quickly close windows / splits
nnoremap <leader>q :close<CR>
" nnoremap <leader>q :q<cr>
" nnoremap <leader>X :q!<cr>

" Turn off highlighted matches from searches
nnoremap <leader><leader><leader> :nohlsearch<CR>

" Move between windows
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>

" Resize panes
" NOTE: not work in tmux
" nnoremap <silent> <C-Right> :vertical resize +5<cr>
" nnoremap <silent> <C-Left> :vertical resize -5<cr>
" nnoremap <silent> <C-Up> :resize +5<cr>
" nnoremap <silent> <C-Down> :resize -5<cr>


" To open a new empty buffer
nnoremap <leader>t :enew<cr>
" Move to the next buffer
nnoremap <leader>l :bnext<CR>
nnoremap <leader><tab> :bnext<CR>
" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>x :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>



" Plugins settings
" -----------------------------------------------------------------------------


" Airline settings
" ----------------
" The following are some unicode symbols for customizing the left/right
" separators, as well as the powerline font glyphs. We must define
" the dictionary first before setting values. Check whether it exists
" as to avoid accidentally overwriting its contents.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" NERDTree
" --------
let NERDTreeShowHidden = 1        " show hidden files
map <F2> :NERDTreeToggle<CR>

