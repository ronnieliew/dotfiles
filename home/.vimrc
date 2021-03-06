"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-unimpaired'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/Rename2'
Bundle 'Lokaltog/vim-powerline'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on               " Enable filetype plugin
filetype indent on

set history=100
set autoread                    " Auto read when file is changed from the outside
set lazyredraw                  " Don't update the display while executing macros
set scrolloff=8                 " Start scrolling when 8 lines away from margin

set ruler                       " Always show current position:
set hidden                      " Change buffer - without saving
set showcmd                     " show current command at lower right
set clipboard+=unnamed         " yanks go to clipboard
set encoding=utf8
set number

set backspace=eol,start,indent  " Allow backspace in insert mode
set whichwrap+=<,>,h,l

set magic                       " Set magic on, for regular expressions
set showmatch                   " Show matching brackets when cursor is over them
set cpoptions=ces$              " Make cw and like commands put a $ at the end

set listchars=tab:▸\ ,eol:¬     " Show textmate-style tab and eol
set switchbuf=useopen           " Reuse opened file from quickfix window


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wild
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                    " Turn on wild menu
set wildmode=list:full          " Show a list when <TAB> and complete first full macth
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/vendor/bundle/*,*/tmp/*
set wildignore+=*.swp,*~,._*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                  " Ignore case when searching
set smartcase
set hlsearch                    " Highlight search things
set incsearch                   " Make search act like search in modern browsers



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set expandtab                   " Insert space characters when <tab> key is pressed
set shiftwidth=2                " number of space characters for indentation
set tabstop=2
set softtabstop=2

set autoindent
set smartindent

set list
set listchars=""          " reset listchars
set listchars=tab:‣\      " display tabs with a sign
set listchars+=trail:·    " display trailing whitespaces with a dot
set listchars+=extends:»  " right wrap
set listchars+=precedes:« " left wrapped


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   "Enable syntax hl
colorscheme molokai

if has("gui_running")
    set guifont:Menlo:h14
    set guioptions=ace
    set fuoptions=maxvert,maxhorz
    set background=dark
    set transparency=3
    if has("gui_macvim")
        "macmenu &File.New\ Tab key=<D-T>
        map <silent> <leader>t <Plug>PeepOpen
        map <silent> <leader><leader> <C-w>v<C-w>l<Plug>PeepOpen
    end
endif






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

map <C-c> <ESC>

map <leader>] :tabn<CR>
map <leader>[ :tabp<CR>

nmap <leader>; :bp<CR>
nmap <leader>' :bn<CR>

" Map j,k to more by screen line (wrapped mode)
nnoremap j gj
nnoremap k gk

" Toggle hlsearch
nmap <leader>. :set hlsearch! hlsearch?<cr>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=


" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>

" Smart way to move btw. windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Map <tab> to match bracket pairs
nnoremap <TAB> %
vnoremap <TAB> %


" set number column toggle
nmap <C-N> :set number! number?<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Unimpaired
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move a line/multiline of text using Apple+[jk] on mac
nmap <D-k> [e
nmap <D-j> ]e
vmap <D-k> [egv
vmap <D-j> ]egv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MiniBufferExplorer settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrl-tab/ctrb-shift-tab to toggle btw buffers
let g:miniBufExplMapCTabSwitchBufs = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>/ <plug>NERDCommenterToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeChDirMode=2
nmap <leader>n :NERDTreeClose<CR>:execute 'NERDTreeToggle "' . getcwd() . '"'<CR>
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>

autocmd VimEnter * NERDTreeToggle %:p:h
autocmd VimEnter * wincmd p
autocmd BufEnter * NERDTreeMirror

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ACK
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>a :Ack
