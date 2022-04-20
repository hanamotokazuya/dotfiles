" Fundamentals "
" ------------------------------------------------------------------

" init.vimを保存したら自動反映
autocmd BufWritePost ~/.config/nvim/init.vim so ~/.config/nvim/init.vim
let g:ruby_hst_prog = '/home/kah/.rbenv/versions/3.1.1/bin/neovim-ruby-host'
let g:python_host_prog = $PYENV_ROOT.'/versions/py2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/py3/bin/python'

" エンコーディング
set encoding=utf-8
scriptencoding utf-8
" help日本語化
set helplang=ja
set nobackup
set nowritebackup
set noswapfile
set number
set cmdheight=2
set list
set ruler
set wildmenu
set laststatus=2
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set ignorecase
set smartcase
set background=dark
syntax enable
set cursorline
set updatetime=300

" 棒状カーソル
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SI = "\<Esc>]50;CursorShape=0\x7"
" ヤンクするとクリップボードに保存される
set clipboard+=unnamed,unnamedplus
" インサートモード・コマンドラインを抜ける時にIMEをオフにする．
autocmd InsertLeave * :call system('zenhan 0')
autocmd CmdlineLeave * :call system('zenhan 0')


" Imports "
" ------------------------------------------------------------------
runtime ./plug.vim

runtime ./maps.vim


" colorscheme "
" ------------------------------------------------------------------
let g:elly_termmode="cterm"
colorscheme elly
let g:lightline = { 'colorscheme': 'elly', }
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight LineNr ctermfg=240


" Airline SETTINGS ------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" coc.nvim SETTINGS "
" ------------------------------------------------------------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" fzf-preview SETTINGS "
" ------------------------------------------------------------------
" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9

" Commands used for fzf preview.
let g:fzf_preview_command = 'bat --color=always --style=header,grid --line-range :100 {}' " Installed bat

" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 0

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" treesitter -----------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "vue", "ruby" },
  },
}
EOF

