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
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set foldenable
set shortmess+=c
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
noremap P "+p

" Markdown previwer
nmap <LEADER>m <PLug>MarkdownPreview
nmap <LEADER>M <Plug>StopMarkdownPreview

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

" Terminal
tnoremap <Esc> <C-\><C-n>

"Auto (
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
		        return "\<Right>"
	else
			    return a:char
	endif
endfunction


"Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"Cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  set cscopetag
  set cscopequickfix=s-,g-,d-,t-,e-,f-,i-
  if filereadable("cscope.out")
    exec "cs add cscope.out " . getcwd()
  endif
  set csverb
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
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Taglist
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'wesleyche/SrcExpl'

" Error checking
Plug 'w0rp/ale'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'

" Firrtl syntax
Plug 'azidar/firrtl-syntax'

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
Plug 'airblade/vim-gitgutter'

" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'theniceboy/vim-snippets'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Verilog
Plug 'vhda/verilog_systemverilog.vim'
Plug 'lfiolhais/vim-chisel'

" Translator
Plug 'voldikss/vim-translator'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

"Snazzy config
color snazzy
let g:SnazzyTransparent = 1

"NERDTree config
"map tt :NERDTreeToggle<CR>
map tt :CocCommand explorer<CR>
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

"Colorschemes
autocmd vimenter * ++nested colorscheme gruvbox

"FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
    \|  autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
    \ call fzf#vim#buffers(
    \   '',
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:0%', '?'),
    \   <bang>0)
       
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   '',
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)

noremap <C-f> :FZF<CR>
"execute "set <M-h>=\eh"
noremap <C-a> :Ag<CR>
noremap <M-h> :MRU<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :LinesWithPreview<CR>
noremap <C-b> :Buffers<CR>
noremap q; :History:<CR>

"undotree
let g:undotree_DiffAutoOpen = 0
map T :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" ===
" === You Complete ME
" ===
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_use_clangd = 0
"let g:ycm_python_interpreter_path = "/usr/bin/python3"
"let g:ycm_python_binary_path = "/usr/bin/python3"


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

" ==
" == Gitgutter
" ==
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
let g:gitgutter_enable = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_max_signs = 500
let g:gitgutter_max_signs = -1

" ==
" == Translator
" ==
nmap <silent> <leader>t <Plug>TranslateW
vmap <silent> <leader>t <Plug> TranslateWV
nmap <silent> <Leader>x <PLug> TranslateX
nmap <silent> <leader>r <Plug>TranslateR
vmap <silent> <leader>r <Plug> TranslateRV

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
"let g:mkdp_browser = 'chromium'
let g:mkdp_browser = 'google-chrome'
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
" === coc.nvim
" ===
let g:coc_global_extensions = [
      \ 'coc-json', 
      \ 'coc-vimlsp', 
      \'coc-docker',
      \'coc-cmake',
      \'coc-sh',
      \'coc-clangd', 
      \'coc-pyright',
      \ 'coc-flutter-tools',
      \ 'coc-actions',
      \'coc-syntax',
      \'coc-yank',
      \'coc-translator',
      \'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-sourcekit',
      \ 'coc-stylelint',
      \ 'coc-syntax',
      \ 'coc-lists',
      \ 'coc-gitignore',	
      \ 'coc-omnisharp',
      \ 'coc-tasks',
      \ 'coc-metals',
      \ 'coc-explorer',
      \ 'coc-import-cost',
      \ 'coc-vetur']

set updatetime=100

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <c-h> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> M :call Show_documentation()<CR>

"function! ShowDocumentation()
  "if CocAction('hasProvider', 'hover')
    "call CocActionAsync('doHover')
  "else
    "call feedkeys('M', 'in')
  "endif
"endfunction
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
hi CocMenuSel ctermbg=237 guibg=#d3869b

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
" coc-translator
nmap ts <Plugin>(coc-translator-p)
" Remap for do codeAction of selected region
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coc-snippets
imap <C-e> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-l>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Jason lee'


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
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Ctags_Cmd = "~/software/ctags/build/bin/ctags"
let Tlist_Auto_Open = 0
nmap <F7> :TlistToggle<CR>

"Source Explorer
nmap <F4> :SrcExplToggle<CR>
let g:Srcexpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey ="<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0


"function! LoadCscope()
  "let db = findfile("cscope.out", ".;")
  "let path = strpart(db, 0, match(db, "/cscope.out$"))
  "if (!empty(db))
    ""let path = strpart(db, 0, match(db, "/cscope.out$"))
    "set nocscopeverbose " suppress 'duplicate connection' error
    "exe "cs add " . db . " " . getcwd()
    "set cscopeverbose
  "" else add the database pointed to by environment variable 
  "elseif $CSCOPE_DB != "" 
    "exe "cs add " . $CSCOPE_DB . " " . getcwd()
    ""cs add $CSCOPE_DB
  "endif
"endfunction
"au BufEnter /* call LoadCscope()
"
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
