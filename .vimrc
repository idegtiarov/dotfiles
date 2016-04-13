set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
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

Plugin 'scrooloose/nerdtree'

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
map <C-n> :NERDTreeToggle<CR>

" Better Copy & Paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and Backspace
set mouse=a
set bs=2 " Set Backspace behave like normaly

" Rebind <Leader key>
let mapleader=","

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

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Tabs but space

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


