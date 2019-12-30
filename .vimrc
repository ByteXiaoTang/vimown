"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Tmz <994052070@qq.com>
" Repository: https://github.com/chxuan/vimplus "TODO"
" Create Date: 2019-12-26
" License: MIT

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","      " 定义<leader>键

set nocompatible         " 设置不兼容原始vi模式
" filetype on              " 设置开启文件类型侦测
" filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
"syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符

"tmz
"set smarttab             " 在行和段开始处使用制表符
"set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
"tmz 2019/12/26
"set nofoldenable         " 禁用折叠代码
set foldenable
set foldmethod=syntax
set foldlevel=100
set foldcolumn=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"tmz
autocmd InsertLeave *set nocul
autocmd InsertEnter *se cul
set mouse=a
"?禁止光标闪烁
set gcr=a:block-blinkon0
set history=100

"空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
nnoremap <leader><space> :%s/\s*$//g <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 11      " 设置字体
    endif
    "set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    " set showtabline=0           " 隐藏Tab栏
    "set guicursor=n-v-c:ver5    " 设置光标为竖线
    set guicursor=n-v-c:block-Cursor/lCursor,i-ci-r-cr:ver25-Cursor/lCursor,a:blinkon0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"tmz 2019/12/25"
"Plug 'chxuan/vim-edit'
"Plug 'chxuan/change-colorscheme'
"Plug 'easymotion/vim-easymotion'
"Plug 'haya14busa/incsearch.vim'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/vim-slash'
Plug 'tpope/vim-fugitive'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-indent'
"Plug 'kana/vim-textobj-syntax'
"Plug 'kana/vim-textobj-function'
"Plug 'sgur/vim-textobj-parameter'
"Plug 'Shougo/echodoc.vim'
"Plug 'rhysd/clever-f.vim'
"Plug 'mileszs/ack.vim'
"让翻页更加流畅
Plug 'terryma/vim-smooth-scroll'
"Plug 'chxuan/cpp-mode'
Plug 'chxuan/vim-buffer'
"Plug 'chxuan/prepare-code'
"Plug 'chxuan/vimplus-startify'
Plug 'mhinz/vim-startify'

Plug 'chxuan/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'
Plug 'Yggdroot/LeaderF'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'scrooloose/nerdcommenter'
"高亮C++的部分关键字和标准库
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'docunext/closetag.vim'
""tmz 2019/12/26"
Plug 'universal-ctags/ctags'
Plug 'ervandew/supertab'
Plug 'itfootman/bufexplorer'
"Plug 'a.vim'
Plug 'easlee/vim-visualmark'


Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'

" 加载自定义插件
if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
    source $HOME/.vimrc.custom.plugins
endif

""tmz 2019/12/26"
set tags=./.tags;,.tags

if version >= 800
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'

    " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    "add bt myself 0503
    "let g:gutentags_exclude_project_root = [expand('~/.vim')]

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

    " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 如果使用 universal ctags 需要增加下面一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁用 gutentags 自动加载 gtags 数据库的行为
    " 避免多个项目数据库相互干扰
    " 使用plus插件解决问题
    let g:gutentags_auto_add_gtags_cscope = 0

    let $GTAGSLABEL = 'native-pygments'
   "let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

    "预览 quickfix 窗口 ctrl-w z 关闭
    Plug 'skywind3000/vim-preview'
    "P 预览 大p关闭
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    " noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
    " noremap <leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口
endif

call plug#end()

" load vim default plugin
runtime macros/matchit.vim

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>ge :edit /usr/share/vim/gvimrc<cr>

nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

" 查看vimplus的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>gs :source /usr/share/vim/gvimrc<cr>

" 安装、更新、删除插件
" tmz 2019/12/26
"nnoremap <leader><leader>i :PlugInstall<cr>
"nnoremap <leader><leader>u :PlugUpdate<cr>
"nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""快速切换窗口"
nnoremap <leader>\ :vs<CR>
nnoremap <leader>- :sp<CR>

""tmz 2019/12/26"
"" 复制当前选中到系统剪切板
"vmap <leader><leader>y "+y
"
"" 将系统剪切板内容粘贴到vim
"nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

"""""""""""""""""[6]airline""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'


" 是否打开tabline
"打开后，tabline和tmuxline都可以得到增强
"let g:airline#extensions#tabline#enabled = 1
let g:airline#enabled = 1

" " airline
" let g:airline_theme="onedark"
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

"""""""""""""""""""""""""""""""""""""""""
""""""tmz 2019/12/26""""""""""""""""""""
" cpp-mode
"nnoremap <leader>y :CopyCode<cr>
"nnoremap <leader>p :PasteCode<cr>
"nnoremap <leader>U :GoToFunImpl<cr>
" nnoremap <silent> <leader>a :Switch<cr>
" nnoremap <leader><leader>fp :FormatFunParam<cr>
"nnoremap <leader><leader>if :FormatIf<cr>

"a.vim

" change-colorscheme
" nnoremap <silent> <F9> :PreviousColorScheme<cr>
" inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
" nnoremap <silent> <F10> :NextColorScheme<cr>
" inoremap <silent> <F10> <esc> :NextColorScheme<cr>
" nnoremap <silent> <F11> :RandomColorScheme<cr>
" inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
" nnoremap <silent> <F12> :ShowColorScheme<cr>
" inoremap <silent> <F12> <esc> :ShowColorScheme<cr>

" prepare-code
"let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")
"
"

nmap <F6> ms:call TitleDet() <cr>'s
"在文件中按F6调用
function AddTitle()
    call append (0,"/*********************************************************************")
    call append (1," * Author           : tmz")
    call append (2," * Email            : 994052070@qq.com")
    call append (3," * Last modified    : ".strftime("%Y-%m-%d %H:%M"))
    call append (4," * Filename         : ".expand("%:t"))
    call append (5," * Description      : ")
    call append (6," * ******************************************************************/")
    echohl WarningMsg | echo "Adding coryright Successfully !!" | echohl None
endfunction
"在上面代码中添加自己的版权信息
function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Updating coryright Successfully !!" | echohl None
endfunction
function TitleDet()
    let n=1
    while n<7
        let line = getline(n)
        if line =~ '^\s*\*\s*Last\smodified\s*:\s*\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n+1
    endwhile
    call AddTitle()
endfunction



" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
" nnoremap <silent> <leader>d :CloseBuffer<cr>
" nnoremap <silent> <leader>D :BufOnly<cr>

" vim-edit
" nnoremap Y :CopyText<cr>
" nnoremap D :DeleteText<cr>
" nnoremap C :ChangeText<cr>
" nnoremap <leader>r :ReplaceTo<space>

"""""""tmz 2019/12/26"""""""
 " nerdtree
" nnoremap <silent> <leader>n :NERDTreeToggle<cr>
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeHighlightFolders = 1
" let g:NERDTreeHighlightFoldersFullName = 1
" let g:NERDTreeDirArrowExpandable='▷'
" let g:NERDTreeDirArrowCollapsible='▼'

"""""""""""""""""[4]NERDTree""""""""""""""""""""""""""""
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"只剩 NERDTree时自动关闭
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.git']

map <silent><F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>

""""""""""""""""""""""""0503 youcompleteme"""""""""""""""
"寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vimplus/.ycm_extra_conf.py'

set completeopt=menu,menuone "关闭自动弹出的窗口
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第 2 个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"定义快捷健补全
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', '::', 're![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', '::', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::', 're![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1

" " YCM "TODO"
" " 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" " let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_error_symbol = '✗'
" let g:ycm_warning_symbol = '✹'
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_semantic_triggers =  {
"             \   'c' : ['->', '.','re![_a-zA-z0-9]'],
"             \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"             \             're!\[.*\]\s'],
"             \   'ocaml' : ['.', '#'],
"             \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
"             \   'perl' : ['->'],
"             \   'php' : ['->', '::'],
"             \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"             \   'ruby' : ['.', '::'],
"             \   'lua' : ['.', ':'],
"             \   'erlang' : [':'],
"             \ }
" nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" " 已经使用cpp-mode插件提供的转到函数实现的功能
" " nnoremap <leader>i :YcmCompleter GoToDefinition<cr>
" nnoremap <leader>o :YcmCompleter GoToInclude<cr>
" nnoremap <leader>ff :YcmCompleter FixIt<cr>
" nmap <F5> :YcmDiags<cr>

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

"tmz 2019/12/26
" incsearch.vim
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" tmz 2019/12/26
" vim-easymotion
"let g:EasyMotion_smartcase = 1
"map <leader>w <Plug>(easymotion-bd-w)
"nmap <leader>w <Plug>(easymotion-overwin-w)

" " nerdtree-git-plugin
" let g:NERDTreeIndicatorMapCustom = {
"             \ "Modified"  : "✹",
"             \ "Staged"    : "✚",
"             \ "Untracked" : "✭",
"             \ "Renamed"   : "➜",
"             \ "Unmerged"  : "═",
"             \ "Deleted"   : "✖",
"             \ "Dirty"     : "✗",
"             \ "Clean"     : "✔︎",
"             \ 'Ignored'   : '☒',
"             \ "Unknown"   : "?"
"             \ }

"LeaderF
nnoremap <leader>f :LeaderfFile ~<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git', 'root', '.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

"tmz 2019/12/26
" ack
"nnoremap <leader>F :Ack!<space>

"""tmz 2109/12/26"""
" echodoc.vim
"let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" tmz 2019/12/26
" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"
"""""""""""""""""[8]supertab""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:SuperTabRetainCompletionType=2

" gv
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" 加载自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif






