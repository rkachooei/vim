set nocompatible
let mapleader=","
set nocompatible

" -----------------------------------------------------------
" Indentation
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType groovy setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html.handlebars setlocal shiftwidth=2 tabstop=2
autocmd FileType exs setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType xsd setlocal shiftwidth=2 tabstop=2
autocmd FileType xslt setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType j2 setlocal shiftwidth=4 tabstop=4

" ----------------------------------------------------------- 
" Syntax highlighting

au BufReadPost *.hbs set syntax=mustache

" -----------------------------------------------------------
" Strip spaces on write
autocmd BufWritePre *.js,*.rb,*.py :%s/\s\+$//e

" Enable syntax highlighting
syntax on

" Colorscheme
set background=dark


" Allow for switching between buffers without saving
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" all vim swap files will be saved here. Make sure the dir
" exists or you get this error when trying to openup a file 
" in nerdtree
" Error invokeKeyMap When opening a file with nerdtree
set swapfile
set dir=~/vimswaptmp-rk

" ------------------------------------------------------------
" Word wrap

:set wrap
:set linebreak
:set nolist  " list disables linebreak

" ------------------------------------------------------------
" Special key mappings
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap ' ;
nnoremap ;gs :Gstatus<CR>
nnoremap ;gc :Gcommit<CR>
nnoremap ;gw :Gwrite<CR>
nnoremap ;gb :Gblame<CR>
nnoremap ;gr :Gread<CR>
nnoremap ;gp :Gpull<CR>
nnoremap <Up> 5k
nnoremap <Down> 5j

" ????????????????? not sure about this 
"-------------
" Ctrl+c mapping
map <C-c> "+y<CR>

" ------------------------------------------------------------
" Split navigation
" ------------------------------------------------------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ------------------------------------------------------------
" Plug bindings
" ------------------------------------------------------------

nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" ------------------------------------------------------------
" FZF bindings 
" ------------------------------------------------------------
nnoremap <leader>f :FZF<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <leader>sb :BLines<CR>
nnoremap <leader>b :Buffers<CR>

" ------------------------------------------------------------
" Plug
" ------------------------------------------------------------

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" statusline at the bottom of window
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }

" Git wrapper 
Plug 'tpope/vim-fugitive'

Plug 'michaeljsmith/vim-indent-object'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" linting - syntax checking
Plug 'w0rp/ale'

" color scheme
Plug 'crusoexia/vim-monokai'

Plug 'chase/vim-ansible-yaml'

Plug 'lepture/vim-jinja'

"" Plug 'python/black'

" Plug 'vim-scripts/vim-auto-save'


""Plug 'puremourning/YouCompleteMe', { 'do': './install.py', 'branch': 'fast-start' }

call plug#end()

" Initialize plugin system

" ------------------------------------------------------------
" NerdTree

set modifiable
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.jshint$']

" ------------------------------------------------------------
" Airline

let g:airline_theme="luna"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ------------------------------------------------------------
" Mustache

let g:mustache_operators = 1

" ------------------------------------------------------------
" Syntastic
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_rubocop_exec = '/Library/Ruby/Gems/2.0.0/gems/rubocop-0.38.0/bin/rubocop'
" 
" let g:synstastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_exec = '/usr/local/bin/flake8'
" 
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" ------------------------------------------------------------
" Ale
" ------------------------------------------------------------
"
" Configure a.l.e. syntax checking
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'python': ['flake8'],
 \}
 " Only lint on save.
 let g:ale_lint_on_save = 1
 let g:ale_lint_on_text_changed = 0

 " Customize flags
 let g:ale_sign_error = '✖︎'
 let g:ale_sign_warning = '❢'
 
" ------------------------------------------------------------
" FZF
" ------------------------------------------------------------

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '40' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" -----------------------------------------------------------s
" Bclose
" -----------------------------------------------------------

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
nnoremap ;bc :Bclose<CR>

syntax enable
colorscheme monokai

" --------------------------------------------------------
" capslock map
" --------------------------------------------------------
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" --------------------------------------------------------
" run black on save
" --------------------------------------------------------
"autocmd BufWritePost *.py execute ':Black'
