execute pathogen#infect()
" Set to auto read when a file is changed from the outside
set autoread

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader its possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" JsDoc
let g:jsdoc_allow_input_prompt = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set numbers
set nu

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Makes search act like search in modern browsers
set incsearch 

" Search code with silver search
let g:ag_working_path_mode="r"
" open ag.vim
nnoremap <leader>a :Ag<space>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" NERDTree
map <leader>n :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
colorscheme tender

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
augroup END

let g:jsx_ext_required = 0

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent

" }}} 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related {{{
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" jj is escape
inoremap jj <Esc>
inoremap kk <Esc>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and windows {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" vim-maximizer
nnoremap <leader>w :MaximizerToggle<CR>
vnoremap <leader>w :MaximizerToggle<CR>gv
inoremap <leader>w <C-o>:MaximizerToggle<CR>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" save session
nnoremap <leader>s :mksession<CR>

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
let g:lightline = { 
  \ 'colorscheme': 'jellybeans', 
  \ 'separator': { 'left': '⮀', 'right': '⮂' }, 
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
  \ 'component_function': {
  \   'ctrlpmark': 'CtrlPMark',
  \ },
  \ }

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

""set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :!source $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sz :!source ~/.zshrc<CR>
nnoremap <leader>ec :vsp ~/.vim/cheatsheet<CR>
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Turn persistent on (undo even when you close VIM)
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

set listchars=tab:▸\ ,eol:¬,trail:•,extends:❱,precedes:❰,nbsp:░
map <leader>l :set list!<cr>  " toggle show invisible characters

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command line aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("gst", "Gstatus")
call SetupCommandAlias("gd", "Gdiff")
call SetupCommandAlias("gc", "Gcommit")

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $c e <C-\>eCurrentFileDir("e")<cr>

" Bash like keys for the command line
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

call SetupCommandAlias("W", "w")

" }}} 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=syntax   " fold based on syntax level

set modelines=1

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open Test File {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
	let l:alternate = system("find . -path ./_site -prune -or -path ./target -prune -or -path ./.DS_Store -prune -or -path ./build -prune -or -path ./Carthage -prune -or -path tags -prune -or -path ./tmp -prune -or -path ./log -prune -or -path ./.git -prune -or -type f -print | alt -f - " . a:path)
	if empty(l:alternate)
		echo "No alternate file for " . a:path . " exists!"
	else
		exec a:vim_command . " " . l:alternate
	endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}} 
"
"
" Plugins to checkout:
" * sirver/ultisnips
"
" vim:foldmethod=marker:foldlevel=0
