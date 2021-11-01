nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F4> :set invnumber<CR>

" 打开文件时，恢复到上次关闭时的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 禁止兼容 vi 模式"
set nocompatible
" 编码设置
set encoding=utf-8
" 删除键
set backspace=2

" --- 显示相关 ---
autocmd vimenter * ++nested colorscheme onedark

" 行号
set number
" 显示从当前行数的前后行数
"set relativenumber
" 高亮显示当前行
set cursorline
" 智能对齐
set smartindent
" 自动对齐
set autoindent
" 打开状态栏标尺
set ruler
" 设定 tab 长度为 4
set tabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
" 使得按退格键时可以一次删掉 4 个空格
"set softtabstop=4
" 上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5

" --- 搜索相关 ---
" 高亮显示搜索
set hlsearch
" 动态高亮搜索
set incsearch
"搜索时忽略大小写 
set ignorecase
" 但在有一个或以上大写字母时仍保持对大小写敏感  
set smartcase

" Vim-Plug
call plug#begin()
" 文件管理器(git、文件类型图标)
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
" 代码补全提示
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 属性及函数的map
Plug 'preservim/tagbar'
" 主题
Plug 'joshdick/onedark.vim'
call plug#end()

" NERDTree
let g:NERDTreeWinPos='left'
" 如果 NERDTree 是唯一选项卡中剩余的唯一窗口，则退出 Vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 如果 NERDTree 是剩余的唯一窗口，则关闭选项卡
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 如果另一个缓冲区试图替换 NERDTree，将其放在另一个窗口中，并显示 NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
