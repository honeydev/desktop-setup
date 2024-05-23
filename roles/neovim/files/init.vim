language en_US

call plug#begin('~/.local/share/nvim/plugged')
"Common debug plugs, DAP
"https://github.com/mfussenegger/nvim-dap
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
"https://github.com/rcarriga/nvim-dap-ui
Plug 'rcarriga/nvim-dap-ui'
"Color scheme
"https://github.com/shaunsingh/nord.nvim
Plug 'arcticicestudio/nord-vim'
"https://github.com/Rigellute/shades-of-purple.vim
Plug 'Rigellute/shades-of-purple.vim'
"https://github.com/catppuccin/nvim
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
"scala plugins 
Plug 'scalameta/nvim-metals'
"Autocompletes
"https://github.com/ms-jpq/coq_nvim
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"https://github.com/ray-x/lsp_signature.nvim
Plug 'ray-x/lsp_signature.nvim'
"search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdtree'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'junegunn/fzf'
Plug 'elmcast/elm-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'puremourning/vimspector'
"Conf for use local project config
Plug 'folke/neoconf.nvim'

call plug#end()

"viminspector conf
let g:vimspector_enable_mappings='HUMAN'

set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set number

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

autocmd VimEnter * NERDTree
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
    \ }

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2


nmap ~ :NERDTreeToggle<CR> “ open/close nerdtree window
nmap <leader>r :NERDTreeFind<cr> “ this is the key to jump to the nerdtree window from any other window
nmap ] :NERDTreeFind<CR> “ pressing this inside any open file in vim will jump to the nerdtree and highlight where that file is -> very useful when you have multiple files open at once
autocmd BufWinEnter * NERDTreeFind

nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1


nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

colorscheme catppuccin-frappe

let g:shades_of_purple_airline = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
"-----------------------------------------------------------------------------
" nvim-lsp Mappings
"-----------------------------------------------------------------------------
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
nnoremap <silent> <space>d    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>
nnoremap <silent> <leader>rd  <cmd>lua vim.lsp.codelens.run()<CR>
nnoremap <silent> <leader>dr  <cmd>lua require("dap").repl.toggle()<CR>
nnoremap <silent> <leader>dc  <cmd>lua require("dap").continue()<CR>
nnoremap <silent> <leader>dK  <cmd>lua require("dap.ui.widgets").hover()<CR>
nnoremap <silent> <leader>dt  <cmd>lua require("dap").toggle_breakpoint()<CR>
nnoremap <silent> <leader>dso <cmd>lua require("dap").step_over()<CR>
nnoremap <silent> <leader>dsi <cmd>lua require("dap").step_info()<CR>
nnoremap <silent> <leader>dl  <cmd>lua require("dap").run_last()<CR>
nnoremap <silent> <leader>se  <cmd>lua vim.diagnostic.open_float()<CR>

:lua require('lsp')


"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"-----------------------------------------------------------------------------
" Helpful general settings
"-----------------------------------------------------------------------------
" Needed for compltions _only_ if you aren't using completion-nvim
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


set completeopt-=preview

:lua << EOF
require("telescope").setup{  defaults = { file_ignore_patterns = { "node_modules", "venv" }} }
EOF

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
  augroup end
endif

