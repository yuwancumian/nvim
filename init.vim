" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Install plugins
call plug#begin()
" Looks
Plug 'nikitavoloboev/vim-monokai-night'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim' " Light and configurable statusline/tabline plugin.
Plug 'joshdick/onedark.vim'

" Utility
Plug 'romainl/vim-cool' " Stop matching after search is done.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'w0rp/ale' " Asynchronous Lint Engine.
Plug 'honza/vim-snippets' " Snippet files for various programming languages.
Plug 'sbdchd/neoformat' " Format code.
Plug 'rizzatti/dash.vim' " Search Dash app.
Plug 'jremmen/vim-ripgrep' " Use RipGrep in Vim and display results in a quickfix list.
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
"Plug 'docunext/closetag.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Prettier support
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'scrooloose/nerdcommenter' " Quick comments.
Plug 'unblevable/quick-scope' " Highlight f, F jumps.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution.
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps.
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
"Plug 'junegunn/vim-easy-align' " Simple, easy-to-use alignment.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fzf search. 
Plug 'junegunn/fzf.vim' " Fzf search.
"Plug 'wakatime/vim-wakatime' " Automatic time tracking.
Plug 'haya14busa/incsearch.vim' " Improved incremental searching.
Plug 'easymotion/vim-easymotion' " Vim motions on speed.
Plug 'thinca/vim-quickrun' " Run commands quickly.

" Git
Plug 'tpope/vim-fugitive' " Git wrapper.
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.

" Deoplete
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Asynchronous completion framework.
"Plug 'zchee/deoplete-jedi' " Deoplete source for jedi.

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' } " Vim source for neocomplete/deoplete.

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' } " Vim configuration files for Nix.

" Front
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'justinj/vim-react-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" Options
set mouse=a " Copy selected text with mouse to system clipboard
set undofile " Save undos after file closes
set wildmode=longest:list,full " Complete longest common string, then each full match
set updatetime=250 " If this many milliseconds nothing is typed the swap file will be written to disk
set visualbell " Turn off the audio bell
set clipboard^=unnamed  " Copy text to system clipboard
set gdefault " Always do global substitutions
set title " Set terminal title
set whichwrap+=<,>,[,]
set completeopt-=preview " No annoying scratch preview above
set expandtab " Spaces on tabs
set shiftwidth=2
set softtabstop=2
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message
set fileencoding=utf-8 " Encoding when written to file
set fileformat=unix " Line endings
set timeout timeoutlen=1000 ttimeoutlen=10 " TODO: ?
set autowrite " Automatically save before :next, :make etc
set ignorecase " Search case insensitive:
set smartcase " .. but not when search pattern contains upper case characters
"set nocursorcolumn
"set nocursorline
set number
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup " Don't create annoying backup files
set path=+** " Search down into subfolders

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
"set foldmethod=syntax
set foldignore=""
set nofoldenable

" Buffers
set hidden

" Searching
set wrapscan
set ignorecase
set smartcase
set gdefault

" Usable 'Tab'
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
autocmd BufNewFile,BufRead *.js set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2 expandtab 
autocmd BufNewFile,BufRead *.vue set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2 expandtab 
autocmd BufNewFile,BufRead *.less set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.html set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4


" UI
"set cursorline  " Highlight current line
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support
let python_highlight_all = 1

set completeopt+=menu,menuone " Completion

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True color
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul! " Notify on mode change visually

"set grepprg=rg\ --vimgrep
"set grepformat^=%f:%l:%c:%m

let b:ale_linters = ['eslint']
"let g:ale_sign_warning = '--'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

set viewoptions=cursor,slash,unix

" Plugins
let g:deoplete#enable_at_startup = 1 " Activate deoplete
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys
let g:incsearch#auto_nohlsearch = 1 " TODO

" Theme
"colorscheme monokai-night
colorscheme onedark
syntax on
"color dracula

" python
let g:python_host_prog = '/Users/kuankuan/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/kuankuan/.pyenv/versions/neovim3/bin/python'

"Emmet
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_expandabbr_key='<C-y>,'

let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"

" Bufferline
let g:bufferline_echo = 0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists('g:deoplete#disable_auto_complete')
        let g:deoplete#disable_auto_complete = 1
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists('g:deoplete#disable_auto_complete')
        let g:deoplete#disable_auto_complete = 0
    endif
endfunction

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<F8>'
au filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'} " Don't autocomplete in vim

" Vim session
let g:session_autosave="no"
let g:session_autoload="no"

" Autocomplete with tab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Activate leader for easymotion
map <Leader> <Plug>(easymotion-prefix)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" _Insert mappings
inoremap      jk  <Esc>
inoremap      kj  <Esc>
inoremap      (;   ();<Esc>o
inoremap      ()   ()

"Command mappings
cabbrev rp Rp

" CTRL mappings
nnoremap <C-L> :Files<CR>

" Space mappings
nnoremap <SPACE> <Nop>
"let mapleader="\<Space>"
let mapleader="\<Space>"
let maplocalleader = "\<Space>"
nnoremap <leader>= yypVr=

" Space z
nmap <Leader>ze   :enew <CR>
nmap <Leader>zt   :tabnew<CR>

" Space p
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" Space w
" Save
nmap <Leader>w :w<CR>

" Space e
"nmap <Leader>e <Plug>(Prettier) :w<CR>

" Space e
" nmap <Leader>e.   :e .<CR>
" Search files inside current dir
" nnoremap <Leader>e :Files<CR>

" Space d
nmap <Leader>d :bd<CR>

" Space a
nnoremap <Leader>a :wq<CR>

" Space v
" Write all changed buffers and exit vim
nnoremap <Leader>vq :wqall<CR>
nnoremap <Leader>vQ :qa<CR>
nnoremap <Leader>vm :make<CR>

" Space o
" Move 10 lines down (for karabiner sticky keys)
nnoremap <Leader>o 29jzz

" Space i
nnoremap <Leader>ii :PlugInstall<CR>
" Update plugins
nnoremap <Leader>iu :PlugUpdate<CR>
" Check vim health
nnoremap <Leader>ih :CheckHealth<CR>

" Space c
" Switch dir for fzf searching to current dir
map <Leader>cd :lcd %:p:h<CR>

" Space l
" Yank xml block to next line
nnoremap <Leader>l vat:t'><CR>'[<Esc><CR>

" Space t
nmap <Leader>to   :e %:p:h<CR>
" Yank function block
nnoremap <Leader>tgt :exe search('^function','cb')';/}/y'<CR>
" Dash doc lookup
nnoremap <Leader>ttt :Dash<CR>
" Write all changed buffers
nnoremap <Leader>tttt :wa<CR>
" Run commands in new splits
nnoremap <Leader>tt :tabedit <Bar> term.
nnoremap <Leader>ts :split <Bar> term.
nnoremap <Leader>tv :vsplit <Bar> term.

" Space s
" Buffer control
nmap <Leader>s    :bprevious<CR>
" Source vimrc
nnoremap <Leader>ss :source ~/.dotfiles/nvim/init.vim<CR>

" Space n
nmap <Leader>n    :bnext<CR>
" Search lines with fzf
nnoremap <silent> <Leader>n :Lines<CR>

" Space q
nmap <Leader>q    :q<CR>

" Space y
" Yank whole file
nnoremap <Leader>y :%y<CR>

" Space f
nmap <Leader>fw   :Autoformat<CR>
nmap <Leader>ff :FZF <CR>
nmap <Leader>fb   :Buffers <CR>
nmap <Leader>fl   :BLines <CR>
nmap <Leader>fL   :Lines <CR>
nmap <Leader>fh   :History<CR>
nmap <Leader>f;   :History:<CR>
nmap <Leader>f:   :Commands<CR>
nmap <Leader>ft   :BTags<CR>
nmap <Leader>fT   :Tags<CR>
nmap <Leader>fm   :Marks<CR>
nmap <Leader>fw   :Windows<CR>
nmap <Leader>fs   :Snippets<CR>
nmap <Leader>fg   :BCommits<CR>
nmap <Leader>fG   :Commits<CR>

" Space o
nmap <Leader>o    :Files %:p:h<CR>
nmap <Leader>O    :GFiles <CR>

" Mapping selecting mappings
nnoremap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" For conceal markers
"if has('conceal')
"    set conceallevel=2 concealcursor=nc
"endif

" Auto commands
au FileType dirvish call fugitive#detect(@%)
au FocusLost * :wa " Auto save everything

" Remaps
" Search and replace
xnoremap gs y:%s/<C-r>"//g<Left><Left>

" Yank a line with Y.
nnoremap Y y$

" Functions

" Other
"set guicursor=n-v-c:hor20,i-ci:hor20 " Make cursor block in insert mode and underline in normal mode
:hi Cursor guifg=white guibg=white
:hi Cursor2 guifg=#FDD9D0 guibg=#FDD9D0
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:block-Cursor2/lCursor2,r-cr:hor20,o:hor50
autocmd VimLeave * set guicursor=a:ver25-blinkon25 " Make cursor block when leaving to shell

" Testing
set signcolumn=yes
nnoremap <C-q> :q<cr>:q<cr>
set foldcolumn=0 " Remove sidebar column

"setup nerdtree
let NERDTreeWinPos = 'left'
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
set guioptions-=L
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$','node_modules','dist','design']
"let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}" "

set langmenu=en_US
let $LANG = 'en_US'

set splitbelow
set splitright

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
