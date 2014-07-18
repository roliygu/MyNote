set nocp            "禁用系统设置
set go=             "关闭菜单栏
set nu!             "显示行号
set vbt_vb=         "关闭错误提示音
"set autochdir       "自动设置目录为当前修改文件的目录
set ts=4            "Tab键宽度
set sw=4            "自动缩进宽度
set smarttab
set et
set ambiwidth=double

" Format related
set tw=78
set lbr
set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive


"普通模式下按键映射
nmap <C-e> :e C:\Users\Roliy\_vimrc<CR>
nmap <C-s> :wa<cr>

"插入模式时，也使用hjkl移动光标
"括号补全
imap ( ()<Left>
imap { {}<Left>
imap ' ''<Left>
imap " ""<Left>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-s> <Esc>:wa<CR>i<Right>

"命令模式模式，也使用hl移动光标
cmap <C-h> <Left>
cmap <C-l> <Right>
cmap <C-r> G:\RoliyGit\



" Misc
set wildmenu
set spell

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
filetype plugin indent on

" Display related
set ru
set sm
set hls
if (has("gui_running"))
    set guioptions+=b
    colo torte
    set nowrap
else
    colo ron
    set wrap
endif
syntax on

"=============================================================================
" Platform dependent settings
"=============================================================================

if (has("win32"))

    "-------------------------------------------------------------------------
    " Win32
    "-------------------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
        set guifontwide=NSimSun:h9:cGB2312
    endif

else

    if (has("gui_running"))
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

endif
