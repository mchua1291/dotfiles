"=============================================================================
" chua's .vimrc
"=============================================================================

" Vundle Settings
set nocompatible                   " be iMproved, required
filetype off                       " required
set rtp+=~/.vim/bundle/Vundle.vim  " required
call vundle#begin()                " required
Plugin 'VundleVim/Vundle.vim'      " required

" Editer Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'marijnh/tern_for_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/SQLComplete.vim'

" Theme/Colorscheme Plugins
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Vundle Commands
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" Color Scheme
set encoding=utf8
let base16colorspace=256       " Access colors present in 256 colorspace
set t_Co=256
set background=dark
"colorscheme molokai           " molokai colorscheme
colorscheme PaperColor         " PaperColor colorscheme
"let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

" Tern settings
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1"

" Vim-Javascript
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1
let g:javascript_plugin_flow=1
let g:javascript_conceal_function="ƒ"
let g:javascript_conceal_null="ø"
let g:javascript_conceal_this="@"
let g:javascript_conceal_return="⇚"
let g:javascript_conceal_undefined="¿"
let g:javascript_conceal_NaN="ℕ"
let g:javascript_conceal_prototype="¶"
let g:javascript_conceal_static="•"
let g:javascript_conceal_super="Ω"
let g:javascript_conceal_arrow_function="⇒"
set foldmethod=syntax
set foldnestmax=10       " deepest fold is 10 levels
set nofoldenable         " don't fold by default
set foldlevel=1

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let NERDTreeShowHidden=1       " show hidden files in NERDTree

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Powerline
"let g:airline_theme='molokai'   "molokai colorscheme
let g:airline_theme='PaperColor' "PaperColor colorscheme
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:bufferline_echo=0
set laststatus=2

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
             \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
             \ 'file': '\.exe$\|\.so$'
             \ }
let g:ctrlp_working_path_mode = 2 " find nearest ancestor containing (.git, .hg, .svn)


"=============================================================================
" Maintainer:	Bram Moolenaar <Bram@vim.org> (edited by Michael Chua)
" Last change:	2016 Mar 21
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

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
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set autoread        " detect when a file is changed

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

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
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

else

  set autoindent		" always set autoindenting on
  set smartindent       " always set smartindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Line numbers
set number

" Buffer switching
:nnoremap <D-Right> :bnext<CR>
:nnoremap <M-Right> :bnext<CR>
:nnoremap <D-Left> :bprevious<CR>
:nnoremap <M-Left> :bprevious<CR>

" don't let MacVim remap them
if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
endif

" Tab control
set noexpandtab    " tabs ftw
set smarttab	   " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4      " the visible width of tabs
set softtabstop=4  " edit as if the tabs are 4 characters wide
set shiftwidth=4   " number of spaces to use for indent and unindent
set shiftround     " round indent to a multiple of 'shiftwidth'

" Always replace tab with 8 spaces, except for Makefiles
" set expandtab
" autocmd FileType make setlocal noexpandtab

" faster redrawing
set ttyfast

" Settings for editing *.txt files
" -auto indent lines according to previous line
" -replace tab with 8 spaces
" -tab key move 2 spaces instead of 8
" -wrap text if line goes longer than 76 columns
" -check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=76 spell spelllang=en_us

" Don't do spell-check on Vim help files
autocmd FileType help setlocal nospell

" Setup backup directories
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Ignore case when searching
set ignorecase

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors 
"highlight NonText guifg=#a6a6a6
"highlight SpecialKey guifg=#a6a6a6

" maintain opacity w/ colorscheme
hi Normal ctermbg=none
