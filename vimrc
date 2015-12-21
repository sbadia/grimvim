" sbadia vimrc
" https://github.com/sbadia/grimvim
" https://stackoverflow.com/questions/6951672/how-can-i-insert-a-real-tab-character-in-vim

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
" Manage plugins Recurse :-)
Plugin 'gmarik/vundle'
" Syntax plugins
Plugin 'chikamichi/mediawiki.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'depuracao/vim-rdoc'
Plugin 'tpope/vim-markdown'
" Syntax checking through external checkers.
Plugin 'scrooloose/syntastic'
Plugin 'dbakker/vim-lint'
" Git integration.
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'rodjek/vim-puppet'
Plugin 'dougireton/vim-chef'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdsnippets'
Plugin 'sbadia/puppet-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/snipMate'
Plugin 'sbadia/snipmate.vim'
" Git syntax highlighting
Plugin 'tpope/vim-git'
" Surround selection with quotes, parenthesis…
Plugin 'tpope/vim-surround'
" Automatically closes quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'
" Automatically closes functions, blocks, etc.
Plugin 'tpope/vim-endwise'
Plugin 'gregsexton/gitv'
"Plugin 'felipec/notmuch-vim-ruby'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" A better stats bar
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
" Aligns text.
Plugin 'godlygeek/tabular'
" Browse tags of source code files.
Plugin 'majutsushi/tagbar'
" Emacs Org-Mode for Vim.
" Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'saltstack/salt-vim'
" Vim latex helpers
"Plugin 'jcf/vim-latex.git'
Plugin 'lervag/vimtex'
Plugin 'manicmaniac/betterga'
" Example for git style plugin
"Plugin 'git://git.wincent.com/command-t.git'
" Color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'mrtazz/molokai.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'peaksea'
Plugin 'nextval'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'paranoida/vim-airlineish'
" https://github.com/daylerees/colour-schemes
" Misc.
"Plugin 'vim-scripts/DrawIt'
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'miyakogi/conoline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-tbone'
" https://github.com/t9md?tab=repositories
Plugin 't9md/vim-choosewin'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'chrisbra/vim-diff-enhanced'
"Plugin 'ryanoasis/vim-webdevicons'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lilydjwg/colorizer'
Plugin 'Quramy/vison'
Plugin 'Yggdroot/indentLine'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'ktonga/vim-follow-my-lead'
" Syntaxe, num lignes
syntax on
set synmaxcol=200
set nu
" Backup and swap files
"silent! execute '!mkdir -p ${HOME}/.vimsessions'
set backupdir=$HOME/.vimsessions
set directory=$HOME/.vimsessions
"set cul
set ruler
" Encoding
set encoding=utf-8
" Whitespace stuff
"set nowrap
"set tabstop=2
set shiftwidth=2
set softtabstop=2
"set mouse=a
" tabs limits (default: 10)
set tabpagemax=150
set expandtab
"set list listchars=tab:\ \ ,trail:·
set list listchars=nbsp:¤,tab:··,trail:¤,extends:▶,precedes:◀
set showmatch
set showcmd
set noautowrite
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
" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
"let g:airline_theme='airlineish'
"let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
set term=xterm-256color
" ultisnips
let g:snips_author = "Sebastien Badia"
let g:snips_email = 'seb@sebian.fr'
" Identline
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
let g:indentLine_enabled = 0
" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

command! W w !sudo tee "%" > /dev/null
"command! W w !sudo dd of=%

let mapleader = ","
noremap <silent><Leader>/ :nohls<CR>
"Drop vi compat
set nocompatible
set clipboard=unnamed

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
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,mdwn} call s:setupMarkup() | set ft=markdown
" wrap txt file
au BufRead,BufNewFile *.txt call s:setupWrapping()
" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set tabstop=4 textwidth=80
"Limit the width of text for mutt to 80 columns
au BufRead,BufNewFile mutt* set tw=80 | setlocal fo+=aw | set ft=mail
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
" Nextval inc/dec settings
nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec
" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_ruby_exec='ruby1.9.1'
let g:syntastic_full_redraws=1
let g:syntastic_puppet_puppetlint_args='--no-80chars-check'
"let g:syntastic_debug=1
" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
if has('gui_running')
  set background=dark
  "set background=light
  color solarized
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
else
  set background=dark
  color desert
endif
" let g:solarized_termcolors=256
" Supprimer les espaces blancs au write
autocmd BufWritePre *.py :%s/\s\+$//e
" spell if txt or md
autocmd BufEnter *.txt,*.md,mutt-grimoire*,mutt-baloo* setl spell spelllang=fr
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
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" Complétion
"
" Taper CTRL X CTRL O
filetype plugin on
set ofu=syntaxcomplete#Complete
" espaces
"highlight NbSp ctermbg=lightgreen guibg=lightred
"match NbSp /\%xa0/

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
