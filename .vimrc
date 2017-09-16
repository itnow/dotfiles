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


let mapleader = " "
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
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Reload .vimrc and :PlugInstall to install plugins.

Plug 'vim-airline/vim-airline'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'

" Plug 'tpope/vim-fugitive'
" Plug 'davidhalter/jedi-vim'
" Plug 'Yggdroot/indentLine'    " Bug: with Json quotes
" Plug 'tpope/vim-surround'
" Plug 'vim-syntastic/syntastic'
" Plug 'easymotion/vim-easymotion'
" Plug 'nvie/vim-flake8'
" Plug 'airblade/vim-gitgutter'

" Schemes
" Plug 'tomasr/molokai'
" Plug 'sickill/vim-monokai'
" Plug 'nanotech/jellybeans.vim'
" Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

" Add plugins to &runtimepath
call plug#end()


" colorscheme slate
colorscheme gruvbox


" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window.
" It will change to the directory containing the file which was opened
" or selected.
" NOTE: When this option is on some plugins may not work.
" set autochdir

set laststatus=2                " Always display status line

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright
set diffopt+=vertical           " Always use vertical diffs

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set colorcolumn=80              " hightlight at specified column
" DOCS: https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
hi ColorColumn ctermbg=236


hi ExtraWhitespace ctermbg=9
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
" :match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
" :match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
" :match ExtraWhitespace /^\t*\zs \+/
" Switch off :match highlighting.
" :match


set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
" set sidescrolloff=15
" set sidescroll=1
"set virtualedit=all             " allow the cursor to go in to 'invalid' places
set list

"set gdefault                    " search/replace 'globally' (on a line) by default

set matchpairs+=<:>             " append <> to pairs list
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set fileformats="unix"

"set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)

set number                      " show line numbers
set cursorline                  " highlight the current line
set ruler                       " show the cursor position all the time

filetype indent on              " load filetype-specific indent files

set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to.
set showmatch                   " highlight matching [{()}]
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set showcmd                     " show partial command in last line of the screen

set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches




" enable all Python syntax highlighting features
let python_highlight_all = 1


" NERDTree settings
let NERDTreeShowHidden = 1        " show hidden files

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


" Airline settings
" The following are some unicode symbols for customizing the left/right
" separators, as well as the powerline font glyphs.
" Note: You must define the dictionary first before setting values. Also, it's a
" good idea to check whether it exists as to avoid accidentally overwriting
" its contents.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
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


" Toggle relative numbering, and set to absolute on loss of focus or insert mode
" set rnu
" function! ToggleNumbersOn()
"     set nu!
"     set rnu
" endfunction
" function! ToggleRelativeOn()
"     set rnu!
"     set nu
" endfunction
" autocmd FocusLost * call ToggleRelativeOn()
" autocmd FocusGained * call ToggleRelativeOn()
" autocmd InsertEnter * call ToggleRelativeOn()
" autocmd InsertLeave * call ToggleRelativeOn()



" Jedi-vim
"

" Disable docstring preview window
autocmd FileType python setlocal completeopt-=preview
" alternative variant:
" let g:jedi#auto_vim_configuration = 0
" set completeopt=menuone,longest



" Shortcuts
" --------------------------------------------------------------------------

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


" NERDTree
" --------
map <F2> :NERDTreeToggle<CR>


" CtrlP
" -----
nnoremap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bm :CtrlPMixed<cr>
nnoremap <leader>bs :CtrlPMRU<cr>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
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

" Show dot files
let g:ctrlp_show_hidden = 1

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" let g:ctrlp_working_path_mode = 'ra'

