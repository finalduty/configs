""" andy.dustin@gmail.com [rev: a28b899]
colorscheme koehler
syntax on
filetype indent plugin on

set tabstop=4       
set shiftwidth=4    
set expandtab       
set smarttab        

set foldmethod=manual
au BufWinLeave * mkview
au BufWinEnter * silent loadview

set showmatch       
set ignorecase      
set smartcase       
set backspace=2     
set smartindent
set copyindent

set formatoptions=c,q,r,t 
set ruler           
set wildmenu
