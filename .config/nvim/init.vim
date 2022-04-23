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
set autoindent
set background=dark
set cmdheight=2
set cursorline
set expandtab
set helplang=ja
set hlsearch
set ignorecase
set laststatus=2
set list
set nobackup
set noswapfile
set nowritebackup
set number
set ruler
set shiftwidth=2
set smartindent
set smartcase
set tabstop=2
set updatetime=300
set wildmenu
syntax enable

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
" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" true color
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
let g:neosolarized_termtrans=1
runtime ./colors/NeoSolarized.vim
colorscheme NeoSolarized


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
let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat

" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 0

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 5000
" treesitter -----------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "vue", "ruby" },
  },
}
EOF


" Preview-Markdown SETTINGS "
" ------------------------------------------------------------------
" skanehira/preview-markdown.vim用の設定値
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
