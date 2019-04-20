"" ======= VIMCONFIG ============

"" Pathogen
execute pathogen#infect()

"" General
syntax on
set hidden
set relativenumber	" Show line numbers
set wrap	" Wrap lines
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch   " Move cursor to matching word
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set softtabstop=2	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"" Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"" Color-scheme
set background=dark
" colorscheme solarized

"" Leader key
let mapleader = ","

"" Completion
filetype plugin on
set omnifunc=syntaxcomplete"Complete
set completeopt=longest,menuone " Improve menu behavior

" autoclose parenthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Search whole project
let g:ackprg = 'ag --nogroup --nocolor --column' " Using Ag as ack search tool

" Status line
set laststatus=2
set statusline+=<
set statusline+=%{b:gitbranch}
set statusline+=>
set statusline+= 
set statusline+=%F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
    endif
  endif
endfunction
    
augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END



"" ======= PLUGIN CONFIG ============
"" NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

"" CtrlP
let g:ctrlp_map = '<c-p>'
set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc

"" Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:prettier#config#tab_width = 2
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#jsx_bracket_same_line = 'false'

" Buffers line
nnoremap <Right> :bnext<CR>
nnoremap <Left> :bprev<CR>

" Auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" indentLine
let g:indentLine_char = '┆'
let g:indentLine_setColors = 239
