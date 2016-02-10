set nocompatible
set nobackup
"Set my local .vim directory so stuff doesn't complain about it
let g:VIMFILESDIR = "/Users/ryancotter/.vim/"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'

Plugin 'rking/ag.vim'

Plugin 'tpope/vim-surround.git'

Plugin 'vim-scripts/TaskList.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'google/vim-colorscheme-primary'

"Plugin 'joonty/vim-phpqa.git'
"Bundle 'joonty/vim-xdebug.git'

call vundle#end()
filetype plugin indent on

set history=700
set autoread
set nu
let g:netrw_liststyle = 3

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
if !exists("g:sudo_save_command")
    let g:sudo_save_command = "on"
    command W w !sudo tee % > /dev/null
endif


set so=7

let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler
set cmdheight=2
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

if has('mouse')
  set mouse=a
endif

set ignorecase
set smartcase
set hlsearch
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 
set magic

set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


syntax enable 

"try
"    colorscheme desert
"catch
"endtry

set t_Co=256
set background=light
try
	colorscheme primary
catch
endtry

set background=dark

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

if !has('nvim')
	set encoding=utf8
endif

set ffs=unix,dos,mac


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile


set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500

set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
inoremap jk <esc>
vnoremap v <esc>
inoremap <esc> <nop>

nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
set viminfo^=%
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
"
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>
set nopaste


" Helper functions from Amix's vimrc: http://amix.dk

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

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
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


""""""""""""""""""""""""""""""
" => Sass
""""""""""""""""""""""""""""""
au FileType,BufWrite,BufRead *.sass setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab si

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

"au FileType python map <buffer> F :set foldmethod=indent<cr>

"au FileType python inoremap <buffer> $r return 
"au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


""""""""""""""""""""""""""""""
" => JavaScript section
""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen shiftwidth=4 tabstop=4 noexpandtab softtabstop=4

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

"au FileType javascript inoremap <buffer> $r return 
"au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => YAML section
""""""""""""""""""""""""""""""
au FileType,BufWrite text setl ft=yaml
au FileType,BufWrite yaml setl shiftwidth=2 tabstop=2 expandtab softtabstop=2 


""""""""""""""""""""""""""""""
" => PHP section
""""""""""""""""""""""""""""""
au FileType,BufWrite php setl shiftwidth=4 tabstop=4 noexpandtab softtabstop=4 


""""""""""""""""""""""""""""""
" => Remaps a custom key to NOP
"""""""""""""""""""""""""""""""
nnoremap <D-P> <NOP>
inoremap <D-P> <NOP>
vnoremap <D-P> <NOP>


au FileType,BufRead,BufNewFile,BufCreate *.php inoremap <leader>i <% if X %>
au FileType,BufRead,BufNewFile,BufCreate *.php inoremap <leader>e <% end_if %>

nmap <leader>@ :Vex<cr>
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <leader>d :bd<cr>

""""""""""""""""""""""""""""""
" => Silverstripe
""""""""""""""""""""""""""""""

au BufNewFile,BufRead,BufCreate,WinLeave,WinEnter *.ss setl filetype=xhtml
au FileType,BufWrite xhtml setl shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab si
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"au FileType html,xhtml,*.ss compiler html


""""""""""""""""""""""""""""""
" => Templates
""""""""""""""""""""""""""""""
let g:file_template_default = {}
let g:file_template_default["default"] = "Default"
let g:file_template_default["php"] = "PHPClass"
"au BufNewFile *.php :LoadFileTemplate

""""""""""""""""""""""""""""""
" => SVN
""""""""""""""""""""""""""""""
let g:svnj_browse_cache_all = 1
let g:svnj_allow_leader_mappings=1

