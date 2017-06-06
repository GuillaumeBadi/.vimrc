" ============================================================================ "
"                                                                              "
" ---------                           .vimrc                           ------- "
"                                                                              "
" ============================================================================ "


" -- Mapping {
" ==========

let mapleader=","

" easymotion trigger with only 1 leader
map <Leader> <Plug>(easymotion-prefix)

" select pasted text
nnoremap gp `[v`]

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " macOS specifics
  else
    " linux specifics
  endif
endif

nnoremap qw :wq<Enter>
noremap qe <C-z>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>r <Esc>ciw
nnoremap <Space> <Esc>viw
nnoremap <leader>g <Esc>:FZF<Enter>

nmap <leader>p <Esc>A;<Esc>

nnoremap S cc
nnoremap <Leader>a gg<S-v>VG
imap <C-x> <C-W>

nnoremap gp :silent %!prettier --stdin --trailing-comma es5 --single-quote --no-semi<CR>
"
" }

" -- Plugins {
" ==========

filetype off

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'GuillaumeBadi/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'heavenshell/vim-jsdoc'

call plug#end()
filetype plugin indent on

" }


" -- Aliases {
" ==========

command Sp set paste
command Np set nopaste
map <c-p> <Esc>:FZF<Enter>

" }

" Shift on Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

" -- Display {
" ==========

" Need explanation ?
syntax on

" The chosen one
set background=dark
colorscheme onedark
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi Normal  guibg=NONE ctermbg=NONE

set mouse=a

" Encoding, etc.
set encoding=utf-8
set termencoding=utf-8

" Correct strange bug
set backspace=indent,eol,start

" Insert space characters whenever <tab> is pressed
set expandtab

" Number of spaces inserted when hitting <tab>
set tabstop=2

" Number of spaces inserted when using :retab
set shiftwidth=2

" Don't wrap long lines
set nowrap

" Always show status bar
set laststatus=2

" Number of lines to keep above & below cursor when scrolling
set sidescrolloff=15
set sidescroll=1

" set scrolloff=8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI .= "\<Esc>[5 q"
let &t_SR .= "\<Esc>[4 q"
let &t_EI .= "\<Esc>[3 q"

" Auto reload files when changed
set autoread

" Show the 80 chars column
set colorcolumn=80

" Don't create useless files
set noswapfile
set nobackup
set nowb

" Hide unsaved buffers
set hidden

" Show cursor line
set cursorline

" Move on search
set incsearch

" Show line numbers
set relativenumber
set nu
highlight LineNr ctermfg=red
" highlight LineNr guifg=#050505

" Show infos in status bar
set ruler

" Prevent annoying highlight on search
set nohlsearch

" More intelligent searches
set ignorecase
set smartcase

" Never use Ex useless mode
nnoremap Q <ESC>
nmap ; :

" Show blank characters
set listchars=tab:>-,trail:·,nbsp:%
set list

" Transparent bg <3
" hi Normal ctermbg=NONE

" }

" -- Opening tab completion {
" =========================

set wildmode=longest,full
set wildignore=*.o,*.obj,*~
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=*ios/*
set wildignore+=*android/*
set wildignore+=*bower_components*
set wildignore+=*plugins*
set wildignore+=*platforms*
set wildignore+=*release*
set wildignore+=*dist*,*dist-server*,*lib*
set wildmenu

" }

" -- Visual helpers {
" =================

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd VimResized * :wincmd =

" disable xml different color for closing tag
highlight link xmlEndTag xmlTag

imap lambda λ

" }

" -- JSDOC {
" ========

nnoremap <Leader>d :JsDoc<Enter>

let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1

" }

" -- Ultisnips {
" ============

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }


" -- Vim JS {
" ==========

nmap <Leader><Space>, :ll<CR>

let g:jsx_ext_required = 0

" }

" -- NerdCommenter {
" ================

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

map <c-c> <leader>ci

" }

" OPENING TAB COMPLETION

set wildmode=longest,full
set wildignore=*.o,*.obj,*~
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=*ios/*
set wildignore+=*android/*
set wildignore+=*bower_components*
set wildignore+=*plugins*
set wildignore+=*platforms*
set wildignore+=*release*
set wildignore+=*dist*,*dist-server*,*lib*
set wildmenu

" -- EMMET {
" ========

let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

autocmd FileType javascript.jsx EmmetInstall

" Surround
nmap <C-b> <Esc>viw<S-s>{
nmap <C-d> <Esc>viw<S-s>)
" }

" AutComplete {
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

map  aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
" }

" AutComplete
let g:deoplete#enable_at_startup = 1
" }
