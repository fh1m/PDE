" Hide Line numbers for writing
nmap <silent><F4> :set invnumber<CR>

" New Tab
nnoremap <silent><M-t> :tabedit<CR>

" Undo Stuff in insert mode
inoremap <C-z> <Esc>ui

" Replace All matches
nnoremap R :%s///gI<Left><Left><Left><Left>

" Move Between Splits
tnoremap ~ <C-\><C-n><C-w><C-w>
nnoremap ~ <C-w><C-w>

" Create Splits
nnoremap <C-w>\ <C-w>v
nnoremap <C-w>- <C-w>s

" Call Custom Fuctions
nnoremap <silent>Q :call QuickfixToggle()<cr>
nnoremap <silent><leader>c :call CompileRun()<CR>
nnoremap <silent><leader>r :call Run()<CR>

" Copy Full File
nnoremap <silent><M-a> <esc>:%y+<cr>

" Telescope Pickers
nnoremap <silent><leader>lg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>gs <cmd>Telescope grep_string<cr>
nnoremap <silent><leader>lr <cmd>Telescope lsp_references<cr>
nnoremap <silent><leader>gc <cmd>Telescope git_commits<cr>
nnoremap <silent><leader>gb <cmd>Telescope git_branches<cr>
nnoremap <silent><leader>s <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent><leader>S <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <silent><leader><space> <cmd>Telescope resume<cr>
nnoremap <silent>"" <cmd>Telescope registers<cr>
nnoremap <silent><leader>h <cmd>Telescope frecency<cr>
nnoremap <silent><leader>H <cmd>Telescope frecency workspace=CWD<cr>
nnoremap <silent><leader>p <cmd>Telescope projects<cr>
nnoremap <silent>; :Telescope file_browser display_stat=false grouped=true<CR>
nnoremap <silent><leader>bf :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent>q: :Telescope command_history<CR>
nnoremap <silent><leader>a :CodeActionMenu<CR>

" Move between Buffers
nnoremap <silent><M-.> :BufferLineCycleNext<CR>
nnoremap <silent><M-,> :BufferLineCyclePrev<CR>

" File-Tree
nnoremap <silent><leader>f :NvimTreeToggle<CR>
nnoremap <silent><leader>F :NvimTreeFindFile<CR>

" Find Highlight group Under Cursor
nnoremap <silent><F3> :TSHighlightCapturesUnderCursor<CR>

" Show Problem With code
nnoremap <silent> <leader>d :TroubleToggle<CR>
nnoremap <silent> <leader>L :TroubleToggle lsp_references<CR>

" copy easily
vmap <cr> y

" move through broken lines
nnoremap <down>  gj
nnoremap <up>    gk

" mapping filetype wise
autocmd filetype markdown nnoremap <leader>m :!echo % \| entr -n pandoc % -o %:r.pdf & <cr>
autocmd filetype tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
autocmd filetype markdown inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Paste Images Quickly in Markdown
autocmd filetype markdown nnoremap <silent><leader>s :Telescope spell_suggest<CR>

" Custom Commands
command! Q qa!
command! W wa!

" LSP Mappings
nnoremap <silent> gd :Telescope lsp_definitions<CR>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <space>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <space>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <space>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <space>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <F2> :LspRename<CR>
nnoremap <silent> <space>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>e :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> d[ :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> d] :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <space>q :lua vim.diagnostic.setloclist()<CR>

" Format Stuff
" nnoremap <silent> <space>f :Neoformat<CR>
nnoremap <silent> <space>F :lua vim.lsp.buf.format({ bufnr = bufnr })<CR>


" Builtin Terminal
tnoremap <C-x> <C-\><C-n>

" Select All
nnoremap <C-M-a> ggVG

" goto preview
nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gI <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gR <cmd>lua require('goto-preview').goto_preview_references()<CR>

" Resize Window
nnoremap <silent><space><right> :vertical resize +2<CR>
nnoremap <silent><space><left> :vertical resize -2<CR>
nnoremap <silent><space><up> :resize +2<CR>
nnoremap <silent><space><down> :resize -2<CR>

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Map keys
nmap <silent> n :lua require("highlight_current_n").n()<CR>
nmap <silent> N :lua require("highlight_current_n").N()<CR>
nmap * *N

" Snippets
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

" Move splits
nnoremap <silent> <C-M-up> <C-w><up>
nnoremap <silent> <C-M-down> <C-w><down>
nnoremap <silent> <C-M-left> <C-w><left>
nnoremap <silent> <C-M-right> <C-w><right>

" Kinda like monecle
nnoremap <silent> <space><space> :ZoomWinTabToggle<CR>

" Nice Search
nnoremap <leader>\ <cmd>SearchBoxIncSearch clear_matches=true<CR>
nnoremap <leader>R <cmd>SearchBoxReplace clear_matches=true confirm=menu<CR>
vnoremap <leader>vs <cmd>SearchBoxIncSearch visual_mode=true<CR>

" increment or decrement
imap <silent> <C-a> <Plug>(increment-activator-increment)
imap <silent> <C-x> <Plug>(increment-activator-decrement)
nmap <silent> <C-a> <Plug>(increment-activator-increment)
nmap <silent> <C-x> <Plug>(increment-activator-decrement)

" Change case
nnoremap <silent> <C-u> vu<esc>
nnoremap <silent> <C-S-u> vU<esc>

" Harpoon
nnoremap <silent> <space>h :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <space>m :lua require("harpoon.ui").toggle_quick_menu()<CR>

" Memento
nnoremap <leader>m <cmd>lua require('memento').toggle()<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Change Perssion
nnoremap <silent> <leader>x :Chmod +x<CR>
nnoremap <silent> <leader>X :SudoWrite<CR>

" Switch Buffer
nnoremap <silent> <F1> :JABSOpen<CR>

" Hop keybindings
nnoremap <silent> 1 :HopChar1<CR>
nnoremap <silent> 2 :HopChar2<CR>
nnoremap <silent> f :HopChar1CurrentLine<CR>
nnoremap <silent> F :HopWord<CR>
nnoremap <silent> <leader>/ :HopPattern<CR>

" Delete Current Buffers
nnoremap <silent><space>x :Bdelete<CR>

" Snippes
imap <expr> <C-n> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <C-p> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <C-n> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <C-p> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <C-n> <Plug>(snippy-cut-text)

" visual_mode
xnoremap > >gv
xnoremap < <gv

" Minimap
nnoremap <silent> <leader>ww :lua require('codewindow').open_minimap()<CR>
nnoremap <silent> <leader>wf :lua require('codewindow').toggle_focus()<CR>
