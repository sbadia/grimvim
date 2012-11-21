" sbadia vimrc
"
" Pathogen
" call pathogen#infect()
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Plugins
" Recurse :-)
Bundle 'gmarik/vundle.git'
"
Bundle 'chikamichi/mediawiki.vim.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'rodjek/vim-puppet.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdsnippets.git'
Bundle 'sbadia/puppet-vim.git'
Bundle 'vim-scripts/snipMate.git'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'gregsexton/gitv.git'
Bundle 'felipec/notmuch-vim-ruby.git'
Bundle 'depuracao/vim-rdoc.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
"Bundle 'jcf/vim-latex.git'
"Bundle 'git://git.wincent.com/command-t.git'

" Syntaxe, num lignes
syntax on
set nu
set ruler

" Encoding
set encoding=utf-8

" Whitespace stuff
"set nowrap
"set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set showmatch
set showcmd
set autowrite
"set autoindent
"set copyindent
set shiftround
set ignorecase
"set spell spelllang=fr

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
set term=xterm-256color

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

let mapleader = ","
noremap <silent><Leader>/ :nohls<CR>

set nocompatible
"Enable personalized syntax"
filetype off
"Limit the width of text for mutt to 80 columns
au BufRead /tmp/mutt* set tw=80

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=80
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}  set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=80

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
if has('gui_running')
  set background=dark
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
  "set background=light
  color solarized
else
  set background=dark
  color desert
endif
" let g:solarized_termcolors=256


" Templates
" Supprimer les espaces blancs au write
autocmd BufWritePre * :%s/\s\+$//e
" Template fichiers .tex
au bufNewFile *.tex 0r ~/.vim/templates/latex.tex

" Map
"
" Changement d'onglets sous urxvt (norm: alt PG-UP)
map <F3> <Esc>:tabnext<CR>
map <F2> <Esc>:tabprevious<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :TagbarToggle<CR>
map <F7> <Esc>:set spell spelllang=fr<CR>
map <F6> <Esc>:set paste<CR>
map <F8> :setfiletype mediawiki<CR>

" Complétion
"
" Taper CTRL X CTRL O
filetype plugin on
set ofu=syntaxcomplete#Complete
