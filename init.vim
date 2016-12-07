set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set scrolloff=3
set cursorline
set noswapfile
syntax on
set undofile
set lazyredraw
set et
set autoread
set nowrap
set list listchars=tab:\ \ ,trail:·
set wildmenu
set wildmode=list:longest,full
set noesckeys
set laststatus=2
set tabstop=2
set shiftwidth=2
set tw=0
set softtabstop=2
set grepprg=ag
set ignorecase
set smartcase
set undodir=~/.vim/undo
set virtualedit=block
set diffopt+=iwhite,vertical
set formatoptions+=n
set formatoptions+=t 
set incsearch
set foldmethod=indent
set foldlevelstart=20 
set wim=list:longest,full
" set cb=unnamed
" set number
" set relativenumber

"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

"Search
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-vinegar'
"Edit
Plug 'vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'pbrisbin/vim-mkdir'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'eelixir', 'javascript.jsx'] }
Plug 'tpope/vim-commentary'
Plug 'kovisoft/paredit', { 'for': ['clojure', 'elixir'] }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
"Move
Plug 'vim-scripts/camelcasemotion'
Plug 'ludovicchabant/vim-gutentags'
"Utilities
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-dispatch'
Plug 'chrisbra/vim-diff-enhanced'
" Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'greyblake/vim-preview'
"Languages 
Plug 'Guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/vim-coffee-script'
Plug 'handlebars', { 'for': 'javascript' }
"Visual
" Plug 'scrooloose/syntastic'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'sickill/vim-monokai'
Plug 'takac/vim-hardtime'
Plug 'sheerun/vim-polyglot'

call plug#end() 
vnoremap . :norm.<CR>

colorscheme monokai

autocmd! BufEnter,BufWritePost * Neomake

autocmd BufRead,BufNewFile *.slim set ft=slim
autocmd BufRead,BufNewFile *.hbs set ft=handlebars

autocmd FileType gitcommit set tw=72

autocmd BufRead,BufNewFile *.exs set filetype=elixir
autocmd BufRead,BufNewFile *.ex set filetype=elixir
autocmd BufRead,BufNewFile *.html.eex set filetype=eelixir

autocmd FileType elixir inoremap >> \|><Space>
autocmd FileType elixir inoremap >I \|><space>IO.inspect<Space>

nmap <leader>t ATODO:<space><esc>gccA

autocmd FileType org,help,orgagenda,git nnoremap <buffer> q :bd<cr>

set statusline =%#identifier#
set statusline+=[%t]%* "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%* 

set statusline+=%h%y      "filetype help file flag

"read only flag
set statusline+=%#identifier#
set statusline+=%r%* 

"modified flag
set statusline+=%#identifier#
set statusline+=%m%* 

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%#warningmsg#

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}%*
set statusline+=%{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=\ %P\     "percent through file
set statusline+=%c\|     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}%*

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

autocmd FileType gitcommit setlocal spell

let g:ruby_indent_access_modifier_style = 'indent'
let ruby_spellcheck_strings = 1
let g:rubycomplete_load_gemfile = 1
" let g:syntastic_always_populate_loc_list = 1

let g:gutentags_exclude = ['bundle']

let g:rspec_command = ":execute 'Dispatch rspec {spec}' | :cw"

let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git\|tmp\|bundle\|doc\|deps\|_build'

" noremap <C-p> :find *

let mapleader=","
let g:ag_prg="ag --column"
let g:ackprg = 'ag --nogroup --column' 
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"

ab rpy pry
ab slef self

tnoremap <C-[><C-[>  <C-\><C-n>
noremap Q q
noremap q <NOP>
nmap k gk
nmap j gj
nmap D "_d
nmap ,r :Rename <C-R>=expand("%:t")<cr>

nmap <C-w><C-e> :e!<cr>
nmap <C-w>e :e!<cr>
nmap <C-w><C-q> :q!<cr>

vnoremap . :norm.<CR>

noremap ]q :cnext<cr>zz
noremap [q :cprevious<cr>zz

noremap ]l :lnext<cr>
noremap [l :lprevious<cr>

noremap ]e :.m+1<cr>
noremap [e :.m-2<cr>

noremap <C-w>t :tabe %<cr>

vmap <C-c><C-d> <Plug>SendSelectionToTmux
nmap <C-c><C-d> <Plug>NormalModeSendToTmux
nmap <C-d>r <Plug>SetTmuxVars
nmap <C-c><C-d> vip<C-c><C-d>

runtime macros/matchit.vim

filetype plugin indent on


""" SPEC

map <space>a :A<CR>
map <space>A :AV<CR>
map <space>r :R<CR>
map <space>R :RV<CR>

map <space>" :reg<cr>

highlight clear SignColumn 
highlight Folded term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight Folded ctermfg=black cterm=bold term=reverse
" highlight! link DiffText MatchParen
hi Search cterm=NONE ctermfg=black ctermbg=lightcyan

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" let g:syntastic_javascript_checkers = ['jshint']
let g:neomake_javascript_enabled_makers = ['eslint']

nnoremap <space><space> :noh<cr>:%s/\s\+$//e<cr>mxgg=G`x:RemoveFancyCharacters<cr> 
cnoremap %% <C-R>=expand('%:h').'/'<cr>

noremap <space>f :CtrlSF<space>
noremap <space>F :CtrlSFOpen<cr>

noremap <space>t :tabnew<cr> 
noremap <space>s :w<cr>
noremap <space>q :q<cr>

vmap <Enter> <Plug>(EasyAlign)

map <C-l> <Plug>CamelCaseMotion_w
map <bs> <Plug>CamelCaseMotion_b

"Fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
xnoremap <space>gb :Gblame<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gvdiff<CR>
nnoremap <space>gdd :Git diff<CR>
nnoremap <space>gD :Git diff --cached<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gL :Glog<CR>
xnoremap <space>gl :Glog<CR><CR>zz
nnoremap <space>gl :tabnew %<cr>:Git! log<CR>
nnoremap <space>glg :Git log --stat --color<CR>
nnoremap <space>glgg :Git log --graph --color --oneline<CR>
nnoremap <space>gC :Git checkout<space>
nnoremap <space>gp :Git add -p<CR>
nnoremap <space>gr :Gtabedit HEAD^{}<cr>
nnoremap <space>go :OpenChangedFiles<CR> 

nnoremap <space>d :diffthis<CR>
nnoremap <silent> <expr> <space>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

" OpenChangedFiles (<Leader>O)---------------------- {{{
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")

  if len(filenames) < 1
    let status = system('git show --pretty="format:" --name-only')
    let filenames = split(status, "\n")
  endif

  exec "edit " . filenames[0]

  for filename in filenames[1:]
    if len(filenames) > 4
      exec "tabedit " . filename
    else
      exec "sp " . filename
    endif
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

function! RemoveFancyCharacters()
  if &modifiable
    let typo = {}
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/gce'
  endif
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()


if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Don't close command line after execute
autocmd CmdwinEnter * map <buffer> <F5> <CR>Q:

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")

    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let b:statusline_tab_warning = ''

    if !&modifiable
      return b:statusline_tab_warning
    endif

    let tabs = search('^\t', 'nw') != 0

    "find spaces that arent used as alignment in the first indent column
    let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    endif
  endif
  return b:statusline_tab_warning
endfunction

com! JSONFormat %!python -m json.tool

if &diff 
  let g:loaded_gutentags = 1
endif

command! -nargs=* T bo 30split  | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

let g:neomake_elixir_mix_maker = {
      \ 'exe' : 'mix',
      \ 'args': ['compile', '--warnings-as-errors'],
      \ 'cwd': getcwd(),
      \ 'errorformat':
        \ '** %s %f:%l: %m,' .
        \ '%f:%l: warning: %m'
      \ }

let g:neomake_elixir_enabled_makers = ['mix']
