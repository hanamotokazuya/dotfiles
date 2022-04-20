" init.vimを保存したら自動反映
autocmd BufWritePost ~/.config/nvim/init.vim so ~/.config/nvim/init.vim
let g:ruby_hst_prog = '/home/kah/.rbenv/versions/3.1.1/bin/neovim-ruby-host'
let g:python_host_prog = $PYENV_ROOT.'/versions/py2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/py3/bin/python'
" initファイル群を読み込む
" runtime! userautoload/init/*.vim

" エンコーディング
set encoding=utf-8
scriptencoding utf-8
" help日本語化
set helplang=ja

" バックアップファイルを作らない
set nobackup
set nowritebackup
" スワップファイルを作らない
set noswapfile
" 行番号を表示
set number
" Give more space for displaying messages.
set cmdheight=2
 " インデント可視化
set list
" 棒状カーソル
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>lh
" ヤンクするとクリップボードに保存される
set clipboard+=unnamed,unnamedplus

set ruler
set wildmenu
" ステータスを常に表示
set laststatus=2
" 自動インデントを有効化
set autoindent
set smartindent
" タブをスペースに変え，タブ幅を２にする．
set expandtab
set tabstop=2
set shiftwidth=2
" 前回の検索パターンが存在するとき，それにマッチするテキストを全て強調表示する．
set hlsearch
" 検索パターンで大文字と小文字を区別しない．
set ignorecase
set smartcase
" 構文ハイライトを有効にする
syntax on

noremap j gj
noremap k gk
" インサートモード・コマンドラインを抜ける時にIMEをオフにする．
autocmd InsertLeave * :call system('zenhan 0')
autocmd CmdlineLeave * :call system('zenhan 0')

set background=dark
" ターミナルモードの設定
" 現在のウィンドウの下に開くようにする．
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" 常にインサートモードでterminalを開く．
autocmd TermOpen * startinsert
" ターミナル挿入モードからターミナルモードへ移行
tnoremap <Esc> <c-\><c-n>
" PLUGIN SETTINGS
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

" Plug 'Shougo/ddc.vim'
" Plug 'vim-denops/denops.vim'
" Plug 'Shougo/pum.vim'
" Plug 'Shougo/ddc-around'
" Plug 'Shougo/ddc-matcher_head'
" Plug 'Shougo/ddc-sorter_rank'
" Plug 'Shougo/ddc-converter_remove_overlap'
" Plug 'LumaKernel/ddc-file'

" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'mattn/vim-lsp-icons'

" Plug 'alvan/vim-closetag'
call plug#end()

set updatetime=300
" colorscheme ----------------------------------------------
" colorscheme molokai

let g:elly_termmode="cterm"
colorscheme elly
let g:lightline = { 'colorscheme': 'elly', }
" let g:airline_theme='elley'
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" NERDTree SETTINGS ---------------------------------------
"
nmap <c-f> :NERDTreeToggle<CR>

" Airline SETTINGS ------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab


" coc.nvim ----------------------------------------------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 括弧をいい感じにしてくれる．
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Definition
nmap <silent> gd <Plug>(coc-definition)
" TypeDefinition
nmap <silent> gy <Plug>(coc-type-definition)
" Implementation
nmap <silent> gi <Plug>(coc-Implementation)
" References
nmap <silent> gr <Plug>(coc-references)
" スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)
" Diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>g  :<C-u>CocList grep<cr>
nnoremap <silent><nowait> <space>f  :<C-u>CocList files<cr>

" treesitter -----------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "vue", "ruby" },
  },
}
EOF

" vim-quickhl -----------------------------------------------------
nmap <space>m <plug>(quickhl-manual-this)
xmap <space>m <plug>(quickhl-manual-this)
nmap <space>M <plug>(quickhl-manual-reset)
xmap <space>M <plug>(quickhl-manual-reset)


"" ddc -------------------------------------------------------------
"call ddc#custom#patch_global('completionMenu', 'pum.vim')
"" 使いたいsourceを指定する
"call ddc#custom#patch_global('sources', [
"      \ 'around',
"      \ 'vim-lsp',
"      \ 'file'
"      \])
"" sourceOptionsのmatchersにfilter指定することで，候補の一覧を制御できる．
"call ddc#custom#patch_global('sourceOptions', {
"      \ '_': {
"      \   'matchers': ['matcher_head'],
"      \   'sorters': ['sorter_rank'],
"      \   'converters': ['converter_remove_overlap'],
"      \ },
"      \   'around': {'mark': 'Around'},
"      \   'vim-lsp': {
"      \     'mark': 'LSP',
"      \     'matchers': ['matcher_head'],
"      \     'forceCompletionPattern': '\.|:|->|"\w+/*'
"      \ },
"      \ 'file': {
"      \   'mark': 'file',
"      \   'isVolatile': v:true,
"      \   'forceCompletionPattern': '\S/\S*'
"      \ }})
"" ddc.vimの機能を有効にする
"call ddc#enable()
"inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
"inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>


"" vim-lsp
"if empty(globpath(&rtp, 'autoload/lsp.vim'))
"  finish
"endif

"function! s:on_lsp_buffer_enabled() abort
"  setlocal omnifunc=lsp#complete
"  setlocal signcolumn=yes
"  nmap <buffer> gd <plug>(lsp-definition)
"  nmap <buffer> gs <plug>(lsp-document-symbol-search)
"  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"  nmap <buffer> gr <plug>(lsp-references)
"  nmap <buffer> gi <plug>(lsp-implementation)
"  nmap <buffer> gt <plug>(lsp-type-definition)
"  nmap <buffer> <leader>rn <plug>(lsp-rename)
"  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"  nmap <buffer> gh <plug>(lsp-hover)
"endfunction

"augroup lsp_install
"  au!
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
"command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

"let g:lsp_diagnostics_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
"let g:asyncomplete_popup_delay = 200
"let g:lsp_text_edit_enabled = 1

"" vim-closetag ------------------------------------------------------------
"" filenames like *.xml, *.html, *.xhtml, ...
"" These are the file extensions where this plugin is enabled.
""
"let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.erb,*tsx'

"" integer value [0|1]
"" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
""
"let g:closetag_emptyTags_caseSensitive = 1

"" dict
"" Disables auto-close if not in a "valid" region (based on filetype)
""
"let g:closetag_regions = {
"    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"    \ 'javascript.jsx': 'jsxRegion',
"    \ }

"" Shortcut for closing tags, default is '>'
""
"let g:closetag_shortcut = '>'

"" Add > at current position without closing the current tag, default is ''
""
"let g:closetag_close_shortcut = '<leader>>'
