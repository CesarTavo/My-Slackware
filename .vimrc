"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"

" Some basics stuff: 

set mouse=a
syntax on
set ignorecase
set smartcase
set nocompatible
set encoding=utf-8
set number
set relativenumber
set backspace=indent,eol,start 
set termguicolors
colorscheme codedark

" Set Cursors
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" Command Line Autocompletition
set wildmode=longest,list,full

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --no-bash --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Autopairs
" call AutoPairsToggle() -to disable
" Plug 'jiangmiao/auto-pairs'

" Ranbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" Vim-sorrund
Plug 'tpope/vim-surround'

" Vim-Colorized Colorized hex in css
Plug 'chrisbra/Colorizer'

" Multiplecursors
Plug 'terryma/vim-multiple-cursors'
function! Multiple_cursors_before()
	call AutoPairsToggle()
endfun
function! Multiple_cursors_after()
	call AutoPairsToggle()
endfun

" Initialize plugin system
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Highlight the 80-Column 
highlight ColorColumn ctermbg=darkmagenta
set colorcolumn=80

" Automatic wrap line at 80 characters in markdown and LaTeX and SpellCheck es
au BufRead,BufNewFile *.md,*.tex 
			\ setlocal textwidth=80 spell spelllang=es
" au FileType *.md,*.tex setlocal textwidth=80

" let g:go_version_warning = 0

"Filetype
filetype plugin on
nmap <F2> :SCCompile<CR>
nmap <F4> :SCCompileRun<CR>
nnoremap <F3> :w <CR> :!gcc -o %< % && ./%< <CR>

" Map << to <ESC>
:imap ;; <Esc>
:nmap <Return> o
:nmap <Space> i
:imap jj <Esc>
" Map SpellCheck command
" z= change word
" zg add word
:map <C-x> z=
:map <C-a> zg

" Rainbow parentheses customization
" Activation based on file type
augroup rainbow_lisp
  autocmd!
    autocmd FileType java,lisp,clojure,scheme RainbowParentheses
augroup END

let g:rainbow#max_level = 25
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

" ColorHighlight group
" Activation based on file type
augroup color_highlight
  autocmd!
    autocmd FileType css,html,yaml,bash,zsh ColorHighlight
augroup END
