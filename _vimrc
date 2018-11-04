let mapleader=';'
" 打开vimrc编辑，保存立即生效
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

noremap <Leader>e :q<CR>  " quit current window
noremap <Leader>E :qa!<CR> "quit all windows
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
nmap <Leader>M %
" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ==============vim基本配置==============
set guifont=Andale_Mono:h12,Menlo:h12,Consolas:h12,Courier_New:h12
set number             " 显示行号
syntax enable
syntax on
colorscheme desert

set autowrite   " 自动保存
" 禁止折行
set nowrap
set foldmethod=syntax
set nofoldenable
set textwidth=80
set formatoptions+=t
set cindent
set smartindent
set noerrorbells
set showmatch
set nobackup 
set noswapfile
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set listchars=tab:>-,trail:-
set list
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
set incsearch
set ignorecase
set smartcase
"set encoding=utf-8
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" disable 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" remap control + arrow key to select windows
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l







set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline' | Plugin 'vim-airline/vim-airline-themes' " Status line"
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" ===========undotree=============
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1


" ===========vim-airline=============
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
let g:airline_theme='molokai'
" ========airline状态栏=========  
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_y = ''


"======= nerdtree=========
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let NERDTreeWinSize=20
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeWinPos='right'
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>ntf :NERDTreeFind<CR>

"======= nerdcommenter=========
let g:NERDCommenterAltDelims = { 'c': { 'left': '//','right': '' } }


" ===========gutentags=============
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.gitignore']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = 'D:\software\vim\glo662wb\share\gtags\gtags.conf'
" 将自动生成的 ctags/gtags 文件全部放入 tags 目录中，避免污染工程目录
let s:vim_tags = expand('D:\vimtags\tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
  "silent! call mkdir(s:vim_tags, 'p')
endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 添加ctags额外参数，会让tags文件变大
" let g:gutentags_ctags_extra_args = ['--fields=+niazlS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--fields=+lS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"======= gutentags_plus=========
" 0 or s: Find this symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
" 9 or a: Find places where this symbol is assigned a value
"disable the default keymaps
let g:gutentags_plus_nomap = 1
"Find symbol (reference) under cursor
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"Find symbol definition under cursor
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"Functions called by this function
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"Functions calling this function
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"Find text string under cursor
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"Find egrep pattern under cursor
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"Find file name under cursor
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"Find files #including the file name under cursor
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"Find places where current symbol is assigned
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>






"======= vim-indent-guides=========
" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"turn of default mapping (<Leader>ig)
let g:indent_guides_default_mapping = 0


"======= vim-fswitch=========
" *.cpp 和 *.h 间切换,右侧开窗口查看
nmap <silent> <Leader>sw :FSSplitRight<cr>


"======= tagbar=========
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


"======= ctrlsf=========
"let g:ctrlsf_ackprg = 'D:\software\vim\ag'