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

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

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

nnoremap <c-s> :w<Enter>
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


Plug 'drewtempelmeyer/palenight.vim'
Plug 'ajmwagar/vim-deus'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'farfanoide/inflector.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'w0rp/ale'
Plug 'brooth/far.vim'
Plug 'yuttie/comfortable-motion.vim'
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
filetype plugin on

" }


" -- Aliases {
" ==========

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
colorscheme palenight

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
nmap <leader>w :w

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

" -- Ultisnips {
" ============

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }

" -- Inflector {
let g:inflector_mapping = 'gI'
"  }

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
"

" scroll

nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0

" }

" Far.vim {
nmap <Leader>q <Esc>:Far <C-r><C-w> 
nmap <Leader>d <Esc>:Fardo<Enter>:q!<Enter>

" }
"
" utils {
iabbrev fn function
" }

" Lint {

let g:ale_linters = {
\   'javascript.jsx': ['eslint'],
\}

let g:ale_lint_on_text_changed = 1
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '🙄'
let g:ale_javascript_eslint_executable = '/Users/guillaume/.nvm/versions/node/v7.6.0/bin/eslint'
let g:ale_javascript_eslint_use_global = 1
nmap <c-e> <Esc>:ALENext<Enter>
" }

set exrc
set secure
