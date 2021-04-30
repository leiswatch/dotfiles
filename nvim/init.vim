set nocompatible
set colorcolumn=100
set syntax=on
set splitbelow
filetype off
filetype plugin on
"set cursorline
let mapleader = ","

" let base16colorspace=256
set textwidth=100

set ttyfast
set scrolloff=5
set backspace=indent,eol,start
set laststatus=2
set showmode
set showcmd

set matchpairs+=<:>

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set number
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase

set viminfo='100,<9999,s100

set hidden
set nobackup
set nowritebackup
set encoding=utf-8
set cmdheight=2
set updatetime=300

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" COC SETTINGS
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

inoremap jj <esc>
inoremap kj <esc>
inoremap JJ <esc>
inoremap KJ <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>xx <cmd>LspTroubleToggle<cr>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.pp set filetype=puppet

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'jparise/vim-graphql'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thaerkh/vim-indentguides'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-rooter'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'cespare/vim-toml'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native'
Plug 'tomasiser/vim-code-dark'
Plug 'tjdevries/colorbuddy.vim'
Plug 'bkegley/gloombuddy'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'nvim-lua/completion-nvim'
Plug 'sheerun/vim-polyglot'
" Plug 'frazrepo/vim-rainbow'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'luochen1990/rainbow'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'ctrlpvim/ctrlp.vim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-html', 'coc-eslint', 'coc-css', 'coc-rls', 'coc-pairs', 'coc-snippets', 'coc-emmet', 'coc-highlight', 'coc-go', 'coc-toml', 'coc-prettier', 'coc-stylelint', 'coc-python', 'coc-cssmodules', 'coc-xml', 'coc-webpack', 'coc-deno', 'coc-yaml', 'coc-sql', 'coc-docker', 'coc-styled-components', 'coc-scssmodules']

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" colorscheme gloombuddy
" let g:airline_theme='oceanicnext'

if (has("termguicolors"))
  set termguicolors
endif

if exists('+termguicolors')
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif" set termguicolors

let g:gruvbox_italic=1
" let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_transparent_bg=1
let g:gruvbox_guisp_fallback='bg'
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

" colorscheme codedark
" let g:airline_theme = 'codedark'

colorscheme gruvbox
let g:airline_theme = 'gruvbox'
" let g:airline_theme='base16-tomorrow-night-eighties'
" colorscheme base16-tomorrow-night-eighties

lua << EOF
  require'lspinstall'.setup() -- important

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
EOF

lua << EOF
  require("trouble").setup {}
EOF

lua << EOF
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = {"node_modules", "package-lock.json", "yarn.lock", ".git", ".next"},
      prompt_prefix = "🔍 ",
      vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--hidden',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
      },
    }
  }
EOF

lua <<EOF
  require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  }
EOF

