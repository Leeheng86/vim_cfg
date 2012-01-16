call pathogen#infect()
call pathogen#helptags()
let g:OS = "mac"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode..
set nocompatible

" Sets how many lines of history VIM have to remember
set history=400

" Enable file type plug-in
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Have the mouse enabled all the time:
if g:OS == "windows"
	set mouse=a
endif

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <LEADER>w :w!<CR>
nmap <LEADER>f :e ~/buffer<CR>

" Must let the g:OS first (windows, unix, or mac)
if g:OS == "windows"
	" Fast reloading of the _vimrc
	map <LEADER>s :source ~/_vimrc<CR>
	" Fast editing of _vimrc
	map <LEADER>e :e! ~/_vimrc<CR>
		" When _vimrc is edited, reload it
	autocmd! bufwritepost vimrc source ~/_vimrc
else
	" Fast reloading of the .vimrc
	map <LEADER>s :source ~/.vimrc<CR>
	" Fast editing of .vimrc
	map <LEADER>e :e! ~/.vimrc<CR>
	" When .vimrc is edited, reload it
	autocmd! bufwritepost vimrc source ~/.vimrc
endif

" None of these should be word dividers, so make them not be
set isk+=_,$,@,%,#,-


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 啟動後是使用 utf-8 編碼
set encoding=utf-8

" 新開的檔案預設是 utf-8 編碼
set fileencoding=utf-8

" 所有可能的編碼
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" 當 Terminal.app 的 Display > encoding 是設成 Big5-hkscs，也就是說 terminal
" 會把鍵盤的輸入以 big5 編碼方式送到 vim 時，vim 需要有這個設定，才會將 big5 的輸入
" 轉成上面設定的 utf-8 編碼。如果你的 Terminal.app 是用 utf-8 編碼，則可忽略此項。
set termencoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the color level
set t_Co=256

" Enable syntax highlighting
syntax enable

" Set font
if g:OS == "windows"
	set gfn=Consolas:h10
endif

if has("gui_running")
	set guioptions-=T
	colorscheme wombat
else
	set background=dark
    "colorscheme greens
    "colorscheme dante
	colorscheme kalt
endif

" Highlight current line in Insert Mode
func! s:EnterInsert()
	set cursorline
endfunc

func! s:LeaveInsert()
	set nocursorline
endfunc

autocmd InsertLeave * call s:LeaveInsert()
autocmd InsertEnter * call s:EnterInsert()

"set cursorline
"hi cursorline guibg=#333333 cterm=none ctermbg=darkgrey

" Omni menu colors
hi Pmenu guibg=#333333 ctermbg=darkgrey
hi PmenuSel guibg=#555555 guifg=#ffffff ctermbg=darkblue

" Pattern matching
hi MatchParen guifg=#000000 guibg=#d0d090


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite file types
set ffs=unix,dos,mac

nmap <LEADER>fd :se ff=dos<CR>
nmap <LEADER>fu :se ff=unix<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertical..
set so=7

" Turn on wild menu
set wildmenu

" Always show current position
set ruler

" The command bar is 2 high
set cmdheight=2

" Show line number
set nu

" Do not redraw while running macros (much faster) (LazyRedraw)
set lz

" Change buffer without saving
set hid

" Set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Show the first match
set incsearch

" Set magic on
set magic

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" show matching braces
set showmatch

" How many tenths of a second to blink
set mat=2

" Highlight search things
set hlsearch

" Windows size
if g:OS == "windows"
	set columns=120
	set lines=60
endif

	""""""""""""""""""""""""""""""
	" Status line
	""""""""""""""""""""""""""""""
	" Always hide the status line
	set laststatus=2

	func! CurDir()
		return substitute(getcwd(), "/home/yzlin", "~/", "g")
	endfunc

	" Format the status line
	"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L
	set statusline=\ %F%m%r%h\ %w\ [FORMAT:%{&ff}]\ [ASCII:\%3.3b]\ [POS:%3l,%3v:\ %p%%]\ [LN:%L]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 快速修改等號左右式
nmap cr= $F=a<SPACE><ESC>lcf;
nmap cl= $F=hc^

"Tab configuration
map <C-T>n <ESC>:tabnew %<CR>
map <C-T>c <ESC>:tabclose<CR>
map <C-T>l <ESC>:tabnext<CR>
map <C-T>h <ESC>:tabprev<CR>
set switchbuf=usetab
set stal=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Comment for C like languages
autocmd BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css inoremap $c /**<CR>  **/<ESC>O

"My information
iab xdate <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>
iab xname Y.Z. Lin
iab xemail yzlin1985@gmail.com


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
	let cwd = getcwd()
	return "e " . cwd
endfunc

func! DeleteTillSlash()
	let g:cmd = getcmdline()
	if g:OS == "unix" || g:OS == 'mac'
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	endif

	if g:cmd == g:cmd_edited
		if g:OS == "unix" || g:OS == 'mac'
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		endif
 	endif

 	return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
 	return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Smart mappings on the command line
"cno $h e ~/
"cno $d e ~/Desktop/
"cno $$ e ./

"cno $q <C-\>eDeleteTillSlash()<CR>

"cno $c e <C-\>eCurrentFileDir("e")<CR>

"cno $tc <C-\>eCurrentFileDir("tabnew")<CR>
"cno $th tabnew ~/
"cno $td tabnew ~/Desktop/

" Bash like
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
cnoremap <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup on
"set backup

if g:OS == "windows"
	" Where to put backup file
	set backupdir=$VIM/vimfiles/backup
	" Directory for temp file
	set directory=$VIM/vimfiles/temp
else
	" Where to put backup file
	set backupdir=~/.vim/backup
	" Directory for temp file
	set directory=~/.vim/temp
endif

set nowb
set noswapfile
set noar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding, I find it very useful
set foldenable
set fdl=0
"set foldmethod=indent

" Easily open and close folds
nnoremap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set smarttab
set lbr
set tw=500

	""""""""""""""""""""""""""""""
	" Indent
	""""""""""""""""""""""""""""""
	" Auto indent
	set ai

	" Smart indent
	set si

	" C-style indenting
	set cindent

	"Wrap lines
	set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en

hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

map <LEADER>sn ]s
map <LEADER>sp [s
map <LEADER>sa zg
map <LEADER>s? z=
map <F6> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

nnoremap <leader>q :QFix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""""""""""""""""""""""""""""""
	" Taglist
	""""""""""""""""""""""""""""""
    if g:OS == 'unix'
        let Tlist_Ctags_Cmd="/usr/local/bin/exctags"
    elseif g:OS == 'mac'
        let Tlist_Ctags_Cmd="/usr/bin/ctags"
    else
        let Tlist_Ctags_Cmd="C:/ctags.exe"
    endif

    " 自動更新目前的 tag 列表
    let Tlist_Auto_Update=1

    let Tlist_Enable_Fold_Column=1

    " 顯示的 tag 排序方式：name/order
    let Tlist_Sort_Type="name"

    " Tlist 視窗的寬度
    let Tlist_WinWidth=20

    " 是否只顯示目前文件的 tag
    let Tlist_Show_One_File=0

    " 關閉文件的同時，也關閉taglist視窗
    let Tlist_Exit_OnlyWindow=1

    let Tlist_Use_SingleClick=1

    let Tlist_Use_Right_Window=1

    " hot key
    nnoremap <F4> :TlistToggle<CR>

	""""""""""""""""""""""""""""""
	" Slippery Snippet
	""""""""""""""""""""""""""""""
	"set runtimepath+=~/.vim/textmateOnly
	"set runtimepath+=~/.vim/textmateOnly/after

    " 調整 start & end tag，這樣可以通用在所有的語言中，不會導致 snippet 的符號和程式碼衝突
    "let g:snip_start_tag = "«"
    "let g:snip_end_tag = "»"

	""""""""""""""""""""""""""""""
	" Nerd Tree
	""""""""""""""""""""""""""""""
    " How to use?
    "
    " o       Open selected file, or expand selected dir
    " go      Open selected file, but leave cursor in the NERDTree
    " t       Open selected node in a new tab
    " T       Same as 't' but keep the focus on the current tab
    " <tab>   Open selected file in a split window
    " g<tab>  Same as <tab>, but leave the cursor on the NERDTree
    " !       Execute the current file
    " O       Recursively open the selected directory
    " x       Close the current nodes parent
    " X       Recursively close all children of the current node
    " e       Open a netrw for the current dir

    nnoremap <F3> :NERDTreeToggle<CR>
    let NERDTreeWinSize=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M
noremap <LEADER>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Remove indenting on empty lines
map <F2> :%s/\s*$//g<CR>:noh<CR>''

" Super paste
"inoremap <C-V> <ESC>:set paste<CR>mui<C-R>+<ESC>mv'uV'v=:set nopaste<CR>

hi LineNr ctermfg=white ctermbg=black
set makeprg=gcc\ -o\ %<\ %

"set Tlist_Ctags_Cmd="/opt/local/bin/ctags"
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'


set foldcolumn=3
