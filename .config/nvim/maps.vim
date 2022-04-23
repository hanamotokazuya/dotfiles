
noremap <C-a> ggVG
noremap j gj
noremap k gk
inoremap <Esc> <Esc>lh
" ターミナルモードの設定
" 現在のウィンドウの下に開くようにする．
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" 常にインサートモードでterminalを開く．
autocmd TermOpen * startinsert
" ターミナル挿入モードからターミナルモードへ移行
tnoremap <Esc> <c-\><c-n>

" NERDTree KEYMAPPINGS "
" ------------------------------------------------------------------
nmap <c-f> :NERDTreeToggle<CR>

" Airline KEYMAPPINGS "
" ------------------------------------------------------------------
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" coc.nvim KEYMAPPINGS "
" ------------------------------------------------------------------
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
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr :<C-u>CocCommand fzf-preview.CocReferences<cr>
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
" Formatting code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)
" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>a  :<C-u>CocCommand fzf-preview.CocDiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocCommand fzf-preview.CocOutline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>g  :<C-u>CocList grep<cr>
nnoremap <silent><nowait> <space>g  :<C-u>CocCommand fzf-preview.ProjectGrep<space>
" nnoremap <silent><nowait> <space>f  :<C-u>CocList files<cr>
nnoremap <silent><nowait> <space>f  :<C-u>CocCommand fzf-preview.ProjectFiles<cr>

" coc-fzf-preview SETTINGS "
" ------------------------------------------------------------------

" vim-quichl KEYMAPPINGS "
" ------------------------------------------------------------------
nmap <space>m <plug>(quickhl-manual-this)
xmap <space>m <plug>(quickhl-manual-this)
nmap <space>M <plug>(quickhl-manual-reset)
xmap <space>M <plug>(quickhl-manual-reset)


" vim-quichl KEYMAPPINGS "
" ------------------------------------------------------------------
nmap mdr :<C-u>PreviewMarkdown right<cr>
