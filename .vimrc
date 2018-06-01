set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
set scrolloff=3
" set cursorline
set noswapfile
syntax on
set undofile
set lazyredraw
set et
set vb
set autoread
set nowrap
set list listchars=tab:\ \ ,trail:·
set exrc
set wildmenu
set wildmode=list:longest,full
set laststatus=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set grepprg=ag
set ignorecase
set infercase
set smartcase
set undodir=~/.vim/undo
set virtualedit=block
set diffopt+=iwhite,vertical
set formatoptions+=n
set formatoptions+=t 
set incsearch
set foldmethod=indent
set foldlevelstart=20
set mouse=a
set breakindent
if exists('+macmeta')
  set macmeta
endif
set showbreak=\\\\\
set re=1
set t_Co=256
set background=dark
let base16colorspace=256

set guioptions=

set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/usr/local/opt/fzf
call vundle#begin()

"Search
Plugin 'VundleVim/Vundle.vim'
" Plugin 'kana/vim-textobj-user'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'eiginn/netrw'
Plugin 'tpope/vim-vinegar'
"Edit
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'junegunn/fzf.vim'
Plugin 'vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'mattn/emmet-vim', { 'for': ['html', 'erb', 'eelixir', 'javascript'] }
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
"Move
Plugin 'vim-scripts/camelcasemotion'
Plugin 'ludovicchabant/vim-gutentags'
"Utilities
Plugin 'tpope/vim-fugitive'
Plugin 'idanarye/vim-merginal'
Plugin 'salomvary/vim-eslint-compiler'
Plugin 'milkypostman/vim-togglelist'
"Languages
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plugin 'mxw/vim-jsx', { 'for': ['javascript', 'jsx']}
Plugin 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
"Visual
Plugin 'sickill/vim-monokai'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'skywind3000/asyncrun.vim'

call vundle#end()

colorscheme monokai
"
nnoremap <space><space> :noh<cr>:%s/\s\+$//e<cr>mxgg=G`x:RemoveFancyCharacters<cr> 

augroup git
  autocmd!
  autocmd FileType git set foldlevel=0

  autocmd FileType gitcommit set tw=72
  autocmd FileType gitcommit setlocal spell
augroup END

augroup js
  autocmd!
  autocmd BufRead,BufNewFile *.js set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.vue set filetype=vue
  " autocmd FileType javascript compiler eslint
  autocmd FileType javascript noremap cl :norm Iconsole.log(<esc>A);<esc>
  autocmd FileType javascript inoremap <buffer> >> => {<cr>}<C-o>O
augroup END

augroup elixir
  autocmd!
  autocmd BufRead,BufNewFile *.exs set filetype=elixir
  autocmd BufRead,BufNewFile *.ex set filetype=elixir
  autocmd BufRead,BufNewFile *.html.eex set filetype=eelixir
  autocmd BufRead,BufNewFile *.text.eex set filetype=eelixir

  autocmd FileType elixir iab <buffer> >> \|>
  autocmd FileType elixir inoremap <buffer> f> fn() -> end<C-o>b
  autocmd FileType elixir compiler exunit
  autocmd FileType elixir set makeprg=mix\ test\ --color

  autocmd FileType elixir map <silent> <buffer> <space><space> :! mix format %<cr>

  autocmd FileType eelixir iab <buffer> << <%
  autocmd FileType eelixir iab <buffer> >> %>
augroup END


autocmd bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd bufwritepost * unlet! b:statusline_tab_warning

autocmd VimResized * wincmd =

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
" set statusline+=%{StatuslineTabWarning()}%*
" set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%#warningmsg#

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}%*
set statusline+=%{fugitive#statusline()}
set statusline+=%=      "left/right separator
set statusline+=\ %P\     "percent through file
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=%#warningmsg#

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" let ruby_spellcheck_strings = 1
" let g:ruby_indent_access_modifier_style = 'normal'
" let g:rubycomplete_load_gemfile = 1

let g:gutentags_ctags_exclude = ['bundle/', 'deps', 'node_modules', "_build", "priv", "web/static", "ios" ]

" let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_current_file = 1

" let g:fzf_buffers_jump = 1
" let g:fzf_tags_command = 'ctags -R'


" nmap <C-p> :GFiles<cr>
 
"test
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git\|tmp\|bundle\|doc\|deps\|_build'

let mapleader=","
let g:ag_prg="ag --column"
let g:ackprg = 'ag --nogroup --column' 

let g:toggle_list_no_mappings=1
let g:toggle_list_copen_command="topleft 30 copen"

ab rpy pry
ab slef self
ab lable label
ab insepct inspect
ab Chagneset Changeset
ab getext gettext

noremap Q q
noremap q <NOP>
nmap k gk
nmap j gj
nmap <c-j> i<cr><esc>

nmap D "_d
nmap ,r :Rename <C-R>=expand("%:t")<cr>

vnoremap . :norm.<CR>

noremap ]q :cnext<cr>zz
noremap [q :cprevious<cr>zz

noremap ]l :lnext<cr>
noremap [l :lprevious<cr>

noremap ]e :.m+1<cr>
noremap [e :.m-2<cr>

noremap ]c /<<<<<<<<cr>
noremap [c ?<<<<<<<<cr>

noremap <C-w>t :tabe %<cr>
noremap <C-w><C-e> :e!<cr>
noremap <C-w>e :e!<cr>

noremap <C-w><C-q><C-q> :q!<cr>

nnoremap ,a :call SaveAsync("")<cr>
nnoremap ,t :call SaveAsync("file")<cr>
nnoremap ,s :call SaveAsync("line")<cr>
nnoremap ,l :call AsyncLastCommand()<cr>

nnoremap <space>c :call ToggleQuickfixList()<cr>

nnoremap <space>p :tj<space>
" nnoremap <C-p> :GFiles<cr>

" testing
nnoremap <space>f :Ggrep<space>
" nnoremap <space>f :Ag<cr>

" for vim
" noremap <space>t :tabnew<cr>
" for mvim
noremap <space>t :term<cr>
" noremap <space>s :w<cr>

vmap <Enter> <Plug>(EasyAlign)

map <C-l> <Plug>CamelCaseMotion_w
map <C-h> <Plug>CamelCaseMotion_b

"elixir

nnoremap <space>egm :term mix ecto.gen.migration<space>
nnoremap <space>emm :term mix ecto.migrate<cr>
nnoremap <space>emr :term mix ecto.rollback<cr>

nnoremap <space>E :term iex -S mix<cr>

nnoremap <C-d><C-d> o@doc """<cr>"""<esc>O
inoremap <C-d><C-d> <cr>@doc """<cr>"""<esc>O

nmap <C-d><C-e> o<space><space>iex><space>
imap <C-d><C-e> <cr><space><space>iex><space>

"Fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
xnoremap <space>gb :Gblame<CR>
nnoremap <space>gd :Gvdiff<CR>
nnoremap <space>gD :Git diff --cached<CR>
nnoremap <space>gDD :Git diff<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gL :Glog<CR>
nnoremap <space>gh :Glog --<CR>
xnoremap <space>gl :Glog<CR><CR>zz
nnoremap <space>glg :Git log --stat --color<CR>
nnoremap <space>glgg :Git log --graph --color --oneline<CR>
nnoremap <space>gc :Merginal<cr>
nnoremap <space>gP :Git add -p<CR>
nnoremap <space>gp :Gpull<CR>
nnoremap <space>gr :Gtabedit HEAD^{}<cr>

nnoremap <silent> <expr> <space>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

com! JSONFormat %!python -m json.tool

runtime macros/matchit.vim

filetype plugin indent on

map <space>a :A<CR>
map <space>A :AV<CR>

set wildignore+=*/tmp\//*,*.so,*.swp,*.zip,tags


highlight clear SignColumn
highlight Folded term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight Folded ctermfg=black cterm=bold term=reverse

function! SaveAsync(test_command)
  if a:test_command == "line"
    let l:test_command = expand("%").":".line(".")
  elseif a:test_command == "file"
    let l:test_command = expand("%")
  else
    let l:test_command = a:test_command
  endif
  " let s:last_test_command = "AsyncRun -program=make -post=botright\\ cw " . l:test_command
  let s:last_test_command = "AsyncRun -program=make -post=topleft\\ cw " . l:test_command
  exec s:last_test_command
endfunction

function! AsyncLastCommand()
  if exists("s:last_test_command")
    exec s:last_test_command
  endif
endfunction

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

function! g:AnsiEscOnFun()
  if &concealcursor == ""
    AnsiEsc
  else
    AnsiEsc!
  endif
endfunction

if &diff
  let g:loaded_gutentags = 1
endif

if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

augroup quickfix
  autocmd!
  autocmd  FileType qf silent! call AnsiEscOnFun()
augroup END
