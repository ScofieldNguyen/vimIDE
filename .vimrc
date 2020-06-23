"" ======= VIMCONFIG ============
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thosakwe/vim-flutter'
call plug#end()

"" Pathogen
execute pathogen#infect()

set nocompatible
filetype plugin on
runtime macros/matchit.vim

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
set smartindent " Smartindent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set softtabstop=2	" Number of spaces per Tab
set ic
set guicursor= " Turn off cursor shaping

" ====== COC-Config ============
set hidden " if hidden is not set, TextEdit might fail.

" Some servers have issues with backup files, see #649 (coc)
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn call CocAction('document.renameCurrentWord')

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ===============================
 
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
" colorscheme solarized
colorscheme onedark
" colorscheme slate
hi Normal guibg=NONE ctermbg=NONE

"" Leader key
let mapleader = ","

"" Save when losing focus
au FocusLost * :wa

"" user mouse
set mouse=a

"" Resize split when window is resized
au VimResized * exe "normal! \<C-W>="

"" No swap file
set noswapfile

"" Window resizing
nnoremap <C-9> 5<C-w>>
nnoremap <C-0> 5<C-w><

" autoclose parenthesis

" Search whole project
let g:ackprg = 'ag --nogroup --nocolor --column' " Using Ag as ack search tool

" Status line
" set laststatus=2
" set statusline+=<
" " set statusline+=%{b:gitbranch}
" set statusline+=>
" set statusline+= 
" set statusline+=%F
" set statusline+=%=
" set statusline+=%l
" set statusline+=/
" set statusline+=%L

" function! StatuslineGitBranch()
"   let b:gitbranch=""
"   if &modifiable
"     lcd %:p:h
"     let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
"     lcd -
"     if l:gitrevparse!~"fatal: not a git repository"
"       let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
"     endif
"   endif
" endfunction
    
" augroup GetGitBranch
"   autocmd!
"   autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
" augroup END

" Close buffer
nmap ,d :b#<bar>bd#<CR>

" Close all buffer except this one
map ,D :BufOnly<CR>

"" ======= PLUGIN CONFIG ============
"" NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

"" CtrlP
let g:ctrlp_map = '<c-p>'
set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"" Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['.prettierc.js', '.prettierc.json']

" Buffers line
nnoremap <Right> :bnext<CR>
nnoremap <Left> :bprev<CR>

" Auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" Auto close bracklet
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" indentLine
let g:indentLine_char = '┆'
let g:indentLine_setColors = 239

" Tagbar (outline)
nmap <c-t> :TagbarToggle<CR>

" Ack.vim

" Using ag if possible
let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

" <C-r> to run NPM commands
map <leader>r yi":!npm run <C-r>"<CR>

" Flutter IDE
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

" Enable Flutter menu
call FlutterMenu()
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Floaterm shorcuts
let g:floaterm_keymap_new    = '<F8>'
let g:floaterm_keymap_prev   = '<F7>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
