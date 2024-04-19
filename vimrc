call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'dylanaraps/wal.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'vim-airline/vim-airline'
  
  Plug 'LnL7/vim-nix', { 'for': 'nix' }
  Plug 'elkowar/yuck.vim', { 'for': 'yuck' }
call plug#end()

filetype indent on
syntax on

colorscheme wal
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:airline_powerline_fonts = 1
