call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 't9md/vim-quickhl'
Plug 'ulwlu/elly.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sharkdp/bat'

call plug#end()
