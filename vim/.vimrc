set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加


" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/tagbar'

Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'altercation/vim-colors-solarized'

" Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Plug 'christoomey/vim-tmux-navigator'

Plug 'kshenoy/vim-signature'
Plug 'dhruvasagar/vim-table-mode'

Plug 'nelstrom/vim-visual-star-search'

" Plug 'skywind3000/asyncrun.vim', {
" 'for': 
" }<++>
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'termhn/i3-vim-nav'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 代码缩进
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on
set expandtab
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 配色方案
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:solarized_termcolors=256
" syntax enable
set background=light
colorscheme solarized
" colorscheme phd
" colorscheme molokai

" let g:molokai_original = 1

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <silent> <C-l> :<C-u>nohlsearch \| redraw!<CR>
nmap <Leader>m :wa<CR>:make<CR><CR><CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 增强匹配%(VIM自带)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin on
runtime macros/matchit.vim


" n       普通模式
" v       可视模式
" i       插入模式
" c       命令行模式
" h       在帮助文件里，以上所有的模式
" a       以上所有的模式
" r       跳过 |hit-enter| 提示
" A       在可视模式下自动选择
set ttymouse=xterm2
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 代码高亮
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" C++支持拓展
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
" let g:cpp_experimental_simple_template_highlight=1
let g:cpp_concepts_highlight=1
let g:cpp_no_function_highlight=1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" 代码缩进可视
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 代码折叠
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set foldmethod=syntax
" set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Latex 增加新命令lx--表示以xelatex编译
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
let g:tex_flavor='latex'
function CompileWithLaTex()
    let oldRule = g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
    call Tex_RunLaTeX()
    let g:Tex_compileRule_pdf = oldRule
endfunction

nnoremap <Leader>lx :<C-U>call CompileWithLaTex()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 光标设置
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set cursorline
"set cursorcolumn
"

autocmd FileType h nnoremap <Leader>c :e %:r.cc<CR>
autocmd FileType c,cc,cpp nnoremap <Leader>h :e %:r.h<CR>
autocmd FileType md,markdown nnoremap <Leader>m :e temp.1234 \| bd \| e<CR>
autocmd FileType html nnoremap <Leader>c :!firefox %<Tab> &<CR>
autocmd FileType txt nmap <Leader>j :!echo --==<C-R><C-w>==-- ;/usr/bin/ici <C-R><C-W><CR>

nnoremap ge :!eog <C-R><C-A><CR>
nnoremap [d :bd <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 更改注释颜色
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi Comment ctermfg=6
" hi Normal ctermfg=0
" 更改注释样式
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" 如果文件没有后缀名，变成txt文件"
autocmd FileType text setlocal ft=txt
" autocmd BufEnter * if &filetype == "text" | setlocal ft=txt | endif

nnoremap <F4> :set ft=txt<CR>

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 括号自动补上
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 这样会导致复合使用出错，(())
" inoremap ( ()<++><C-O>4h
inoremap ( ()<++><C-O>F)
inoremap [ []<++><C-O>F]
inoremap " ""<++><C-O>F"
inoremap ' ''<++><C-O>F'
inoremap { {<CR>}<++><ESC>O

inoremap （ ()<++><C-O>F)

imap <C-J> <Esc>/<++><CR>:nohlsearch<CR>c4l
nmap <C-J> <Esc>/<++><CR>:nohlsearch<CR>c4l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 插件配置
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2  "lightline 自动启动
" autocmd vimenter * NERDTree  "NERDTree 自动启动

" 
" lightline.vim
"
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'readonly', 'relativepath', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" let g:vim_markdown_math = 1  "markdown Latex
" let g:instant_markdown_browser = "firefox --new-window"
let g:mkdp_auto_start = 1

let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40
nmap <F9> :TagbarToggle<CR>
nmap <F1> :NERDTreeToggle<CR><C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 其他配置
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :au BufAdd,BufNewFile * nested tab sball  "打开文件自动有tab
" set hidden  "编辑保存后的文件只是放到后台，否则之后在转到这个文件就无法undo
" command! -nargs=0 Cud :set undoreload=0 | edit  "有的时候不想在回退到历史版本，Cud
" set title titlestring=MyTitle

" Persistent undo
set undofile
set undodir=$HOME/.vimcache/undo
set undolevels=1000
set undoreload=10000

" 缩写，日后可能用到，先留着
" :iabbrev @@    steve@stevelosh.com
" :iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.
"
" map --- 任何模式
" nmap, imap, vmap --- 对应相应的模式
" nnoremap, inoremap, vnoremap --- 防止递归，建议多使用
"
" 如果想强制自己改掉快键键习惯
" 映射为 <nop>
"
" <buffer>表示只在当前缓冲区执行
" :nnoremap <buffer> <leader>x dd

" autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) .  \ ' | xclip -selection clipboard')
" 以前VIM退出的时候总是会不能保存系统剪切板内容，现在改善这一情况
" https://stackoverflow.com/questions/6453595/prevent-vim-from-clearing-the-clipboard-on-exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" 打开文件返回上一次光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 配置窗口
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
" nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
" nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
" nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
"
"
"
map <F5> :call CompileRun()<CR>
func! CompileRun() 
    exec "w" 
    if &filetype == 'c' 
        silent exec "!g++ % -o %<" 
        :term ./%<
        :res -8
    elseif &filetype == 'cpp' 
        "TODO: silent可以将外部命令的please enter...去掉
        silent exec "!g++ % -o %<" 
        :term ./%<
        :res -8
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<" 
    elseif &filetype == 'sh' 
        :!time bash %
    elseif &filetype == 'python' 
        exec "!time python3 %" 
    elseif &filetype == 'html' 
        exec "!firefox % &"
    elseif &filetype == 'go' 
        exec "!go build %<" 
        exec "!time go run %" 
    endif
endfunction

map <F4> :call Compile()<CR>
func! Compile() 
    exec "w" 
    if &filetype == 'c' 
        :term g++ % -o %<
        :res -4
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 我自己的配置
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"

" 开启文件类型检测，根据不同类型加载不同插件
filetype on
filetype plugin on

" 系统剪切板
map <Leader>y "+y
map <Leader>p o<Esc>"+p
" map <C-A> ggVG
" vmap <C-c> "+y

" 打开和关闭每次太烦
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" 让配置立刻生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

set incsearch
set hlsearch
set ignorecase
set smartcase
set number
set wildmenu
set cursorline
set cursorcolumn
set scrolloff=5
set nomodeline

map te :tabe<CR>
map tl :tabnext<CR>
map th :tabprev<CR>

" nnoremap <silent> <A-l> :call Focus('right', 'l')<CR>
" nnoremap <silent> <A-h> :call Focus('left', 'h')<CR>
" nnoremap <silent> <A-k> :call Focus('up', 'k')<CR>
" nnoremap <silent> <A-j> :call Focus('down', 'j')<CR>
