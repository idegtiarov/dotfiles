"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle

Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode

" colorschemes
Plugin 'chriskempson/base16-vim'

" syntax helper
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more deils or wiki for FAQ
" Put your non-Plugin stuff after this line
" a Python IDE - Martin Brochhaus
" PyCon Asia Pacific

set nocompatible " not compatible with vi
set autoread " detect when a file is changed


" Better Copy & Paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and Backspace
set mouse=a
set bs=2 " Set Backspace behave like normaly

" Rebind <Leader key>
let mapleader=","

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" faster redrawing
set ttyfast

"" code folding settings
"set foldmethod=syntax " fold based on indent
"set foldnestmax=10 " deepest fold is 10 levels
"set nofoldenable " don't fold by default
"set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"QuickSave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"Quick Quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :quit!<CR> " Quit current window

" Easier moving a code block
vnoremap < <g " better indentation
vnoremap > >g " better indentation

" Show whitespaces
" MUST be inserted BEFORE the colorscheme command
"autocmd Colorscheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" Showing line numbers amd length
set number
set tw=79
set nowrap " dont automaticaly wrap on load
set fo-=t " don't automaticaly wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
nnoremap <silent> <esc> :noh<cr><esc>

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
syntax on

set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
"let base16colorspace=256  " Access colors present in 256 colorspace"

let g:solarized_termcolors=256
syntax enable
set background=dark
"colorscheme delek
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
"
"map <leader>wc :wincmd q<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
"map <C-n> :NERDTreeToggle<CR>
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
