set nocompatible                " Disable vi-compatibility
set t_Co=256

colorscheme xoria256
set guifont=Menlo-regular:h16
set guioptions-=T               " removes top toolbar
set guioptions-=r               " removes right hand scroll bar
set go-=L                       " removes left hand scroll bar
set linespace=15

set showmode                    " Always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4
set smarttab
set tags=tags
set softtabstop=4               " When hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default
set shiftwidth=4
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set nohlsearch                  " Don't continue to highlight searched phrases.
set incsearch                   " Make searches case-insensitive.
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase
set timeout timeoutlen=200 ttimeoutlen=100
set noeb vb t_vb=               " No bells
set autowrite                   " save on buffer switch
set mouse-=a

" Hightlight when above 80 chars wide
" match ErrorMsg '\%>80v.\+'

let mapleader = ","
let g:mapleader = ","

" Fast save
nmap <leader>w :w!<cr>

" Saving with sudo tee trick
cmap w!! w !sudo tee > /dev/null %

" Close current buffer but don't mess with everything, please
nnoremap <leader>q :bp<cr>:bd #<cr>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Easy escaping to normal mode
imap jj <esc>

" Auto change directory to match current file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" easier window management
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" resize vsplit
nmap <C-v> :vertical resize +5<cr>
" nmap <C-f> :res +5<cr>

nmap <C-b> :NERDTreeToggle<cr>
"
" show partial command in status line
set showcmd

" shortcut to column
nmap <space> :<space>

" create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSufrForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Run PHPUnit tests
map <leader>t :!phpunit %<cr>

" Powerline
let g:Powerline_symbols = 'fancy'
set t_Co=256                        " Set colors
set laststatus=2                    " Always show the status line
set encoding=utf-8                  " Necessary to show Unicode glyphs
set noshowmode                      " Hide the default mode text (e.g. -- INSERT -- below the status line)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" command! H let @/=""              " Remove search results
nnoremap H :nohl<cr>                " Clears search results
" nnoremap <silent> <C-l> :nohl<CR><C-l> " Clears search results

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

autocmd BufWritePre *.php :%s/\s\+$//e  " Remove trailing whitespaces

nmap ,todo :e todo.txt<cr>          " Edit todo for current project

" Laravel specifics
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>127GF(%0
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Ctrl-p
map <D-p> :CtrlP<cr>
nnoremap <C-S-n> :CtrlP<cr>
map <C-r> :CtrlBufTag<cr>
set wildignore+=*/vendor/**

nmap :ed :edit %:p:h/               " Create / edit file in current directory

filetype plugin on
syntax on

" set fileformat=unix
set number
syn on
 
"My prefered values :)
set nowrapscan
set foldmethod=marker
set hlsearch

let g:vim_markdown_folding_disabled=1   " Disable folding for vim-markdown plugin

let php_sql_query = 1 "Coloration des requetes SQL
let php_htmlInStrings = 1 "Coloration des balises HTML

set nocompatible              " be iMproved, required
filetype off                  " required

" Allows to close the buffer without actually closing the split
map fc <Esc>:call CleanClose(1)i<cr>
map fq <Esc>:call CleanClose(0)<cr>


function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd".todelbufNr
endfunction


" vundle section
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PHP QA Tools For Vim - https://github.com/joonty/vim-phpqa
" Bundle 'joonty/vim-phpqa.git'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Syntastic
Plugin 'scrooloose/syntastic'

" Sparkup
Plugin 'tristen/vim-sparkup'

" Powerline
Bundle 'Lokaltog/vim-powerline'

" Ctrl-p
Bundle 'kien/ctrlp.vim'

" Visual star mapping
Bundle 'nelstrom/vim-visual-star-search'

" Tabular
Plugin 'godlygeek/tabular'

" Vim markdown highlight
Plugin 'plasticboy/vim-markdown'

" NERD commenter
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
