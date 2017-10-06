" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" load plugins with vundle
Bundle 'VundleVim/Vundle.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'stephenmckinney/vim-solarized-powerline'
" Bundle 'ervandew/supertab.git'
" Bundle 'jpalardy/vim-slime'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'millermedeiros/vim-statline'
" Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/snipmate-snippets'
" Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
" Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
" Bundle 'vim-scripts/dbext.vim'
" Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
" Bundle 'sukima/xmledit'
"Bundle 'jcf/vim-latex'
" Bundle 'derekwyatt/vim-scala'
" Bundle 'nelstrom/vim-blackboard'

Bundle 'tpope/vim-git'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'mitechie/pyflakes-pathogen'
" Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-commentary'
" Bundle 'tpope/vim-afterimage'
" Bundle 'vimez/vim-showmarks.git'
" Bundle 'rbgrouleff/bclose.vim'
Bundle 'michaeljsmith/vim-indent-object'

" Bundle 'junegunn/seoul256.vim'

Bundle 'kana/vim-textobj-user'
" Bundle 'rbonvall/vim-textobj-latex'
Bundle 'nvie/vim-flake8'
Bundle 'derekwyatt/vim-scala'
Bundle 'ktvoelker/sbt-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'lervag/vimtex'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'powerman/vim-plugin-AnsiEsc'

Bundle 'romainl/vim-qf'

Bundle 'AndrewRadev/linediff.vim'

Bundle 'petRUShka/vim-pycuda.git'

Bundle 'vim-scripts/taglist.vim'

call vundle#end()

" Keep all swap files together
set swapfile
set backupdir=~/.vimtmp
set directory=~/.vimswp
set modelines=0               
set shiftround               
set encoding=utf-8          


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    "
    " turn off filetype, see http://blog.darevay.com/2010/10/a-brief-note-on-pathogen-for-vim/
    filetype off
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        " autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
    " scheme
    au BufReadPost *.scheme,*.sc set filetype=scheme


else
    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

"Below is copied from www.jonlee.ca/hacking-vim-the-ultimate-vimrc"
set nocompatible
set bs=2 "set backspace to be able to delete previous characters”Enable line numbering, taking up 6 spaces
set number

"Turn off word wrapping
set wrap!

"Turn on smart indent
" set smartindent
"set tabstop=4 "set tab character to 4 characters
set softtabstop=4 "backspace over 4 characters when at beginning of line"
set expandtab "turn tabs into whitespace
"set shiftwidth=4 "indent width for autoindent
filetype indent on "indent depends on filetype

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set laststatus=2

"clear out highlighting by hitting '\ '
nnoremap <leader><space> :noh<cr>

syntax enable

"Enable indent folding
"set foldenable
"set fdm=indent

"Set space to toggle a fold
nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

set hidden

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"indentation for python"
filetype plugin indent on

"autoclose braces"
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {

" settings for eclim, taglist"
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:EclimBrowser='xdg-open'
"let TList_WinWidth = 50
"map <F3> <ESC>:JavaImportMissing<cr>:JavaImportClean<cr>
"map <F4> <ESC>:TlistToggle<CR>
"map <F5> <ESC>:JavaSearch<CR>
"map <F6> <ESC>:JavaImpl<CR>
"map <F7> <ESC>:JavaDocComment<CR>
"map <F8> <ESC>:JavaSearchContext<CR>
"map <F9> <ESC>:Java<CR>
"nnoremap <F11> <ESC>:Validate<cr>
" map <F2> <ESC>:JavaCorrect<cr>
" map <F3> <ESC>:JavaSearchContext<CR>

" settings for exuberant ctags "
set tags=tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <A-/> <C-x><C-u>

set ttyfast                   " send more characters

set wildmenu
set wildmode=list:longest,full

" enhanced movement
map <C-j> 8j
map <C-k> 8k
map <C-h> 8h
map <C-l> 8l

" syntastic
" let g:syntastic_auto_loc_list=1
" let g:syntastic_disabled_filetypes=['html', 'tex']
" let g:syntastic_enable_signs=1
" let g:syntastic_python_checker = 'pylint'

" statusline
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:statline_fugitive = 1
let g:statline_rvm = 1 
let g:statline_filename_relative = 1

" gundo
noremap <F4> :GundoToggle<CR>

" Powerline fonts
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" xml stuff
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
let g:xml_use_xhtml=1

" python stuff
" au FileType python set omnifunc=pythoncomplete#Complete
" let ropevim_vim_completion = 1
" let ropevim_extended_complete = 1
" imap <Nul> <C-R>=RopeCodeAssistInsertMode()<CR>

" pydoc command to use virtualenv
" let g:pydoc_cmd = '~/py/bin/python -m pydoc'
"
" turn off toolbar in gvim
:set guioptions-=T

:set guifont=Liberation\ Mono\ 10
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" noremap 0 g0
" noremap $ g$
" noremap g0 0
" noremap g$ $

let g:Softwrapped = 0
function! ToggleSoftwrap()
if g:Softwrapped == 0
    let g:Softwrapped = 1
    set formatoptions+=l
    set lbr
    set wrap
else
    let g:Softwrapped = 0
    set formatoptions-=l
    set nolbr
    set nowrap
endif
endfunction

noremap <leader>s :call ToggleSoftwrap()<cr>

set shell=/bin/bash

" leader mappings
nnoremap <leader>w :w<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>l :PymodeLint<cr>
nnoremap <leader>p :set paste!<cr>

" ignore files in dir listings and Command-T
set wildignore+=*.pyc,*.gz

let g:gitgutter_max_signs=1000

" python options
" let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
set completeopt=menuone
let g:pymode_folding = 0
let g:pymode_lint_write = 0
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_ignore = 'E501'
let g:pymode_lint_checker='pyflakes'
let g:pymode_rope = 0

au BufNewFile,BufRead *.scl set filetype=scala

" let g:vimtex_latexmk_enabled = 1
" let g:vimtex_latexmk_callback = 0
let g:vimtex_view_method = 'zathura'

set tabstop=2
set shiftwidth=2

" colors
" set t_Co=256
" " colorscheme molokai
" let g:seoul256_background = 235
" colo seoul256
" colo peaksea

let g:Powerline_colorscheme='solarized16_dark'
let g:Powerline_theme='short'
colo solarized

" https://github.com/airblade/vim-gitgutter/issues/243 and https://news.ycombinator.com/item?id=5326438
au VimEnter * highlight clear SignColumn
