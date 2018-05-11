"Plugin manager:[https://github.com/junegunn/vim-plug] "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Content
"
"   0. General Options
"   1. Mouse and clipboard settings
"   2. Movement keys
"   3. Formatting options
"   4. Search options
"   5. Statusline modifications
"   6. Plugins
"   7. Functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"0. General options                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"If loop prevents mutliple calls to syntax on (can mess up highlighting)
if !exists("g:syntax_on")
    syntax enable
endif

"Detect filetype
filetype on

"Quick acces to vimrc
nnoremap <F5> :e $MYVIMRC<CR>
"Reload vimrc
nnoremap <F6> :so $MYVIMRC<CR>

"Exit insert mode from homerow
inoremap jk <Esc>

"Require certain number of lines to be shown below/above cursor
set scrolloff=4
"Do not redraw screen whilst executing macros
set lazyredraw
"Dictate location of new windows after splits
set splitright
set splitbelow

"Enable simple copy/pasting from visual mode (when using vim GUI)
set guioptions+=Autoselect

"Folding method based on indent of code
set foldmethod=indent
set foldlevel=99

"Do not require save before switching buffers
set hidden

"Enable persistent undo (within each reboot)
"First create a tmp undo directory
let s:undoDir = "/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
	call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile

"Use dracula color theme
syntax on
color dracula


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1. Mouse and clipboard settings                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable mouse usage
set mouse=a


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"2. Movement keys                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Allow single j and k movements to treat wrapped lines separately.
""Strict linewise movement resumed when preceeded with a count.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"Remap H and L to SOF and EOL
nnoremap H ^
nnoremap L $

"------- Prevent use of arrow keys  --------
""Normal mode arrow keys
"nnoremap <Left> :echo "No left for you!"<CR>
"nnoremap <Right> :echo "No right for you!"<CR>
"nnoremap <Up> :echo "No up for you!"<CR>
"nnoremap <Down> :echo "No down for you!"<CR>

"Visual mode arrow keys
"vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"vnoremap <Right> :<C-u>echo "No right for you!"<CR>
"vnoremap <Up> :<C-u>echo "No up for you!"<CR>
"vnoremap <Down> :<C-u>echo "No down for you!"<CR>

""Insert mode arrow keys (doesn't work..?)
"inoremap <Left> <nop>
"inoremap <Right> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>

"Shortcuts to switch through buffers with ctrl
noremap <C-J> :bnext<CR>
noremap <C-K> :bprev<CR>

"Shortcuts to switch through errors (displayed by Syntastic)
nnoremap <C-PageDown> :lnext<CR>
nnoremap <C-PageUp> :lprev<CR>

""Switch between open windows
noremap <C-h> <C-W><C-h>
noremap <C-l> <C-W><C-l>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"3. Formatting options                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Number current line, and use relative number lines elsewhere
set nu
set rnu
"Show existing tab with 2 spaces width
set tabstop=4
"When indenting with '>', use 2 spaces width
set shiftwidth=4
"How many spaces are used in insert mode
set softtabstop=4
"Maintain indent from current line to next line
set autoindent
"Wrapped lines follow indentation
set breakindent
"Show lnewrapping by indicating \\ for wrapped line
set showbreak=\\\\\
set textwidth =80
set fileformat=unix
"Underline the current line
"set cursorline
"Dsiable comment autowrapping, auto insertion of comment leader
autocmd FileType * set formatoptions -=cro


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"4. Search options                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set ignore case
set ic

"Highlight all matches when searching
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"Search as characters are entered
set incsearch
"Enable autocompletion
"longest inserts the longest common text
"menu ensures a menu still pops up, even if only one selection is shown
set completeopt=longest,menuone
"Enables possible files to be listed when using tab completion with :e <filename-partial><<TAB>>
set wildmenu
set wildmode=full
"Allow fuzzy searching down through folders
set path+=**

"Recursively search for ctags file up to root folder until one is found
set tags+=./tags,tags;

"Easy acces to Explore and Sexplore
noremap <leader>e :Explore<cr>
noremap <leader>s :Lexplore<cr>
"Netrw options
"Restrict window size
let g:netrw_winsize = -28
"Remove netrw banner
let g:netrw_banner = 0
"Use tree style listing for files
let g:netrw_liststyle = 3
"Directories on top and files below
let g:netrw_sort_sequence = '[\/]$,*'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"5. Statusline modifications                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 "Always show statusline (deafault: only shown when files open > 1)
set statusline=
set statusline+=%7*\[%n]
set statusline+=%#PmenuSel#
set statusline+=\%F
set statusline+=\%{fugitive#statusline()}
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%y
set statusline+=\%{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\%p%%
set statusline+=\%l:%c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"6. Plugins                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged/')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'Valloric/YouCompleteMe' "needs to be compiled!
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'shime/vim-livedown'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
call plug#end()

""" rainbow
let g:rainbow_active = 1

""" GitGutter
"Decrease time between updates (done for GitGutter) (default 4000, i.e. 4 seconds)
set updatetime=1000
"let g:gitgutter_highlight_lines=1

""" Livedown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1 
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use
let g:livedown_browser = "firefox"

""" EasyMotion
let g:EasyMotion_do_mapping = 0
map <SPACE>w <Plug>(easymotion-w)
map <SPACE>b <Plug>(easymotion-b)
map <SPACE>s <Plug>(easymotion-s2)
map <SPACE>j <Plug>(easymotion-j)
map <SPACE>k <Plug>(easymotion-k)

""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"7. Functions                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Function to remove trailing whitespaces
function! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfunction

command! TrimWhitespace call TrimWhitespace()
