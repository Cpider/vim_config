"
" __  __          __     ___                    
"|  \/  |_   _    \ \   / (_)_ __ ___  _ __ ___ 
"| |\/| | | | |____\ \ / /| | '_ ` _ \| '__/ __|
"| |  | | |_| |_____\ V / | | | | | | | | | (__ 
"|_|  |_|\__, |      \_/  |_|_| |_| |_|_|  \___|
"        |___/                                  
"
"
"
let mapleader=" "
"defualt config
syntax on 
set number
set relativenumber
set cursorline
set wildmenu
set hlsearch
set incsearch
set showcmd
set wrap
set smartcase
set ignorecase
"set spell
"set clipboard=unnamedplus

"Buff config
set hidden


"Plug config
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
"Cursor config
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


exec "nohlsearch"

"Keyboard config
noremap i k
noremap k j
noremap j h
noremap I 5k
noremap K 5j
noremap J 7h
noremap L 7l

noremap <LEADER><CR> :nohlsearch<CR>

map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j
map <LEADER>l <C-w>l

noremap <C-h> 0
noremap <C-e> $

noremap h i
noremap H I
vnoremap Y "+y


map ; :
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"Split confer
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map sll <C-w>t<C-w>H
map skk <C-w>t<C-w>K

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

"Tabe config
map ti :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

"Spell check
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s


"Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"Cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set csverb
  set cscopetag
  set cscopequickfix=s-,g-,d-,t-,e-,f-,i-
endif
nmap gcs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap gcd :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap gcr :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap gct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap gce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap gcf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap gci :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap gcc :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap gn :cn<CR>
nmap gp :cp<CR>


"Plug install
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'wesleyche/SrcExpl'

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()

"Snazzy config
color snazzy
let g:SnazzyTransparent = 1

"NERDTree config
map tt :NERDTreeToggle<CR>
let NERDTreeWinPos = "left"
let NERDTreeMapOpenSplit=""
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "u"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "h"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


"undotree
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>
" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/usr/bin/python3"
let g:ycm_python_binary_path = "/usr/bin/python3"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }
" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1
      \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
      \ 'Leader'             :  "m",
      \ 'PlaceNextMark'      :  "m,",
      \ 'ToggleMarkAtLine'   :  "m.",
      \ 'PurgeMarksAtLine'   :  "dm-",
      \ 'DeleteMark'         :  "dm",
      \ 'PurgeMarks'         :  "dm/",
      \ 'PurgeMarkers'       :  "dm?",
      \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

"Tag list(ctags)
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow =1
let Tlist_Use_Right_Window =1
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Auto_Open = 0
nmap <F7> :TlistToggle<CR>

"Source Explorer
nmap <F4> :SrcExplToggle<CR>
let g:Srcexpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey ="<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

