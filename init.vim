" Plugins
call plug#begin('~/.vim/bundle')
" Editor features
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'
Plug 'mattn/emmet-vim'
" Tooling
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'https://tpope.io/vim/surround'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
" LSP and Linting support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-lsp-ale'
" Lang suppport
Plug 'sheerun/vim-polyglot'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'noahfrederick/vim-laravel'
Plug 'noahfrederick/vim-composer'
Plug 'pantharshit00/vim-prisma'
" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
" Other
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'jiangmiao/auto-pairs'
Plug 'wakatime/vim-wakatime'
Plug 'terryma/vim-multiple-cursors'
" Plug 'zsh-users/zsh-autosuggestions'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'rhysd/vim-textobj-ruby'
Plug 'kana/vim-textobj-user'
" Plug 'ap/vim-buftabline'
Plug 'junegunn/gv.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
call plug#end()

" Vim settings
" be iMproved, required
set nocompatible
" No ghost files
set noswapfile
" Read the file as soon it changes
set autoread
" Always in UTF-8
set encoding=utf8
" Disable sounds
set vb t_vb="
set noerrorbells
set visualbell

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Enable indentation and syntax
filetype plugin indent on
syntax on
" Theme settings: Default onedark
let g:onedark_termcolors=256
colorscheme onedark
" colorscheme dracula

" Set a timeout to less than a second
set timeout timeoutlen=500
" Enable numbering
set number relativenumber
set wrap
" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
" Line guide
set cursorline
set showmatch
" Hide mouse when using vim
set mousehide
" Show command
set showcmd
" Show these char for hiden chars
set list
set list lcs=trail:·,space:·,tab:»·,eol:¬

" Lightline settings
set noshowmode
set laststatus=2
" Use backspaceto delete
set backspace=2
" Menu settings
set wildignore+=*/tmp/*,*/vendor/*,*/node_modules/*,*/.git/*,*/log/*,*.so,*.swp,*.zip
set wildmenu
" Case Insensitivity Pattern Matching
set ignorecase
" Overrides ignorecase in pattern
set smartcase
" Highlight search matches
set hlsearch
set incsearch
" Show count of selected lines or chars
set sc
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Disable concealing in all languages, eg: md and tex
set conceallevel=0
"Make splits default to below...
set splitbelow
"And to the right. This feels more natural.
set splitright
" When running in gvim
if has("gui_running")
  set guioptions-=e  " remove gui tabs
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=R
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=l
  if has("gui_gtk")
    " Font for gVim
    set guifont=Fira\ Mono\ 14
  elseif has("gui_macvim")
    " Font for Macvim
    set guifont=Fira\ Mono:h16
  endif
endif
set t_Co=256

" Enable yanking to the clipboard
if has("macunix")
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Tags for navigations
set tags+=./tags " use local tags in project
" Set leader key as Space
let mapleader="\<Space>"
" Shortcuts
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Open and close NERDTree
map <Leader>op :NERDTreeToggle<CR>
" Re-indent all lines
nnoremap <Leader>fa mlgg=G`l
" WakaTimeToday
nnoremap <Leader>wtt :WakaTimeToday<CR>
" Clean open buffers and delete them from unlisted
nnoremap <Leader>bd :Bwipeout<CR>
nnoremap <Leader>bK :bufdo :Bwipeout<CR>:Startify<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>
" Open Vim source file
nmap <Leader>fvs :tabe ~/.vimrc<cr>
"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Mardown stuff
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_no_extensions_in_markdown = 1
" Tex/Latex
let g:tex_conceal = ""
let c_space_errors = 1
let java_space_errors = 1
let python_space_errors = 1
let ruby_space_errors = 1
" PHP stuff
let php_sql_query = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
let g:fugitive_summary_format = '[%an] %s - %d (%cr)'
" GVim
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_fileTypeExclude = [ 'startify' ]
" let g:indentLine_char = '┊'
let g:indentLine_char = '|'
" config de lightline, muestra el nombre del branch igual
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Delete trailing spaces before save
autocmd BufWritePre * %s/\s\+$//e
" Copy filename to clipboard
command CopyFilePath silent! let @+ = expand("%:p")
nnoremap <Leader>yp :CopyFilePath<CR>

let g:user_emmet_install_global = 0
autocmd FileType html,liquid,haml,erb EmmetInstall
let g:snipMate = { 'snippet_version' : 1 }
