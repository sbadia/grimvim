" sbadia vimrc
" https://github.com/sbadia/grimvim
"
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
" Pathogen
" call pathogen#infect()
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Plugins
" Manage plugins Recurse :-)
Bundle 'gmarik/vundle'
" Syntax plugins
Bundle 'chikamichi/mediawiki.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'depuracao/vim-rdoc'
Bundle 'tpope/vim-markdown'
" Syntax checking through external checkers.
Bundle 'scrooloose/syntastic'
" Git integration.
Bundle 'tpope/vim-fugitive'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdsnippets'
Bundle 'sbadia/puppet-snippets'
Bundle 'vim-scripts/snipMate'
" Git syntax highlighting
Bundle 'tpope/vim-git'
" Surround selection with quotes, parenthesis…
Bundle 'tpope/vim-surround'
" Automatically closes quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
" Automatically closes functions, blocks, etc.
Bundle 'tpope/vim-endwise'
Bundle 'gregsexton/gitv'
Bundle 'felipec/notmuch-vim-ruby'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/bufexplorer.zip'
"Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
" A better stats bar
Bundle 'Lokaltog/vim-powerline'
" Aligns text.
Bundle 'godlygeek/tabular'
" Browse tags of source code files.
Bundle 'majutsushi/tagbar'
" Emacs Org-Mode for Vim.
Bundle 'jceb/vim-orgmode'
Bundle 'tpope/vim-speeddating'
" Vim latex helpers
"Bundle 'jcf/vim-latex.git'
" Example for git style plugin
"Bundle 'git://git.wincent.com/command-t.git'
" Color scheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'mrtazz/molokai.vim'
" Syntaxe, num lignes
syntax on
set nu
"set cul
set ruler
" Encoding
set encoding=utf-8
" Whitespace stuff
"set nowrap
"set tabstop=2
set shiftwidth=2
set softtabstop=2
" tabs limits (default: 10)
set tabpagemax=50
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
"Turn on the WiLd menu
set wildmenu
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc
"For regular expressions turn magic on
set magic
" Status bar
set laststatus=2
"python from powerline.ext.vim import source_plugin; source_plugin()
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
"Drop vi compat
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
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" load the plugin and indent settings for the detected filetype
filetype plugin indent on
" make uses real tabs
au FileType make set noexpandtab
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,mdwn} call s:setupMarkup()
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,mdwn} set ft=markdown
" wrap txt file
au BufRead,BufNewFile *.txt call s:setupWrapping()
" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=80
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
let g:syntastic_quiet_warnings=0
let g:syntastic_ruby_exec='ruby1.9.1'
let g:syntastic_full_redraws=1
"let g:syntastic_puppet_puppetlint_args='--no-80chars-check'
"let g:syntastic_debug=1

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
let g:org_todo_keywords = ['TODO', '|', 'DONE']
let g:org_plugins = [ 'ShowHide', '|', 'Navigator','EditStructure', '|', 'Todo', 'Date', 'Misc']
" Supprimer les espaces blancs au write
autocmd BufWritePre *.py :%s/\s\+$//e
" Template fichiers .tex
au bufNewFile *.tex 0r ~/.vim/templates/latex.tex
" Map
"
" Changement d'onglets sous urxvt (norm: alt PG-UP)
map <F3> <Esc>:tabnext<CR>
map <F2> <Esc>:tabprevious<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :TagbarToggle<CR>
map <F6> <Esc>:%s/\s\+$//e<CR>
" http://ftp.vim.org/pub/vim/runtime/spell/
map <F7> <Esc>:set spell spelllang=fr<CR>
map <F8> :setfiletype mediawiki<CR>
map <F10> <Esc>:s/"/'/g<CR>
map <F11> zr
map <F12> zm
"Smart way to move between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Complétion
"
" Taper CTRL X CTRL O
filetype plugin on
set ofu=syntaxcomplete#Complete
" espaces
"highlight NbSp ctermbg=lightgreen guibg=lightred
"match NbSp /\%xa0/
