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
set hidden
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

set guioptions=A

set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/usr/local/opt/fzf
let g:netrw_fastbrowse=0

call vundle#begin()

"Search
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'eiginn/netrw'
Plugin 'tpope/vim-vinegar'
"Edit
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
Plugin 'tpope/vim-git'
" Plugin 'w0rp/ale'
Plugin 'idanarye/vim-merginal'
Plugin 'milkypostman/vim-togglelist'
Plugin 'tpope/vim-rsi'
Plugin 'chrisbra/csv.vim'
"Languages
" Plugin 'slashmili/alchemist.vim'
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plugin 'mxw/vim-jsx', { 'for': ['javascript', 'jsx']}
Plugin 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plugin 'tmcw/vim-eslint-compiler', { 'for': ['javascript', 'jsx']}
Plugin 'tpope/vim-rails', { 'for': ['ruby'] }
Plugin 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
" Plugin 'janko-m/vim-test'
"Visual
Plugin 'sickill/vim-monokai'
Plugin 'summerfruit256.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'rizzatti/dash.vim'

call vundle#end()
" let g:ale_completion_enabled = 1

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
  autocmd FileType javascript compiler eslint
  autocmd FileType javascript noremap cl :norm Iconsole.log(<esc>A);<esc>
  autocmd FileType javascript inoremap <buffer> >> => {<cr>}<C-o>O
  autocmd FileType javascript map <silent> <buffer> <space><space> :make %<cr>
  autocmd FileType javascript.jsx map <silent> <buffer> <space><space> :make %<cr>
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

  autocmd FileType elixir map <silent> <buffer> <space><space> :! mix format <cr>
  set formatprg=mix\ format\ -

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
set statusline+=%l\|     "cursor column
set statusline+=%c\|%L   "cursor line/total lines
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
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10'
let g:netrw_fastbrowse = 2

" let g:alchemist_tag_disable = 1

" let g:fzf_buffers_jump = 1
" let g:fzf_tags_command = 'ctags -R'


" nmap <C-p> :GFiles<cr>

"test
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git\|tmp\|bundle\|doc\|deps\|_build'

let mapleader=","
let g:ag_prg="ag --column"
let g:ackprg = 'ag --nogroup --column'

" let g:ale_fix_on_save = 1
" let g:ale_elixir_elixir_ls_release = '/Users/piotrszeremeta/Projects/elixir-ls/rel/'
" let g:ale_linters = {}
" let g:ale_linters.elixir = ['elixir-ls', 'credo']
" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
" let g:ale_fixers.elixir = ['mix_format']

let g:toggle_list_no_mappings=1
let g:toggle_list_copen_command="topleft 30 copen"

let g:slime_target = "vimterminal"

ab rpy pry
ab slef self
ab lable label
ab insepct inspect
ab inpsect inspect
ab Chagneset Changeset
ab getext gettext

nmap <C-w><C-q> :bp <BAR> bd #<CR>
noremap Q q
noremap q <NOP>
nmap k gk
nmap j gj
nmap <c-j> i<cr><esc>

nmap D "_d
nmap ,r :Rename <C-R>=expand("%:t")<cr>

vnoremap . :norm.<CR>

noremap <D-]> :bnext<cr>
noremap <D-[> :bprevious<cr>

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
nnoremap ,T :AsyncStop<cr>

nnoremap <space>c :call ToggleQuickfixList()<cr>

nnoremap <space>p :tj<space>
" nnoremap <C-p> :GFiles<cr>

nnoremap <space>f :silent Ggrep<space>
" nnoremap <space>f :silent Ggrep<space>

" nnoremap <space>f :Ag<cr>

" for vim
" noremap <space>t :tabnew<cr>
" for mvim
noremap <space>t :term<cr>
noremap <space>T :term<cr>
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
nnoremap <space>gl :silent Glog<CR>
nnoremap <space>F :silent Glog -S
xnoremap <space>gl :Glog <Home>silent <End><CR>
nnoremap <space>gh :silent Glog -- %<CR>
nnoremap <space>gH :silent Glog HEAD~10.. --<CR>
nnoremap <space>gHH :silent Glog --<CR>
nnoremap <space>glg :silent Git log --stat --color<CR>
nnoremap <space>glgg :silent Git log --graph --color --oneline<CR>
nnoremap <space>gc :Merginal<cr>
nnoremap <space>gP :Git add -p<CR>
nnoremap <space>gp :silent Gpull<CR>
nnoremap <space>gpu :Gpush<CR>
nnoremap <space>gr :Gtabedit HEAD^{}<cr>

nnoremap <silent> <expr> <space>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

com! JSONFormat %!python -m json.tool

runtime macros/matchit.vim

filetype plugin indent on

map <space>a :A<CR>
map <space>A :AV<CR>

set wildignore+=*/tmp\//*,*.so,*.swp,*.zip,tags

menu MacVim.Update\ Plugins :PluginUpdate<cr>

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

function! g:ElixirBreak(server)
  let mfa = ExtractMFA()
  execute "term iex --sname debug --remsh " . a:server
  call term_sendkeys(bufnr("%"), "break! " . l:mfa)
endfunction

function! g:ElixirCallers()
  let mfa = ExtractMFA()
  let mfa = substitute(l:mfa, "\(\.\\+", "", "")
  set errorformat+=%f:%l:\ %m
  execute "AsyncRun! mix xref callers " . l:mfa
  copen
endfunction

function! g:ExtractMFA()
  let @m = ""
  let @f = ""
  execute "normal! ml"
  execute "normal! $?def\<cr>"
  execute "normal! w\"fy/,\\? do:\\?\<cr>"
  execute "normal! [z"
  execute "normal! [["
  execute "normal! w\"myaW"
  execute "normal! 'l"
  let @m = trim(@m, " ")
  let @f = substitute(@f, "\n", " ", "g")
  let @f = substitute(@f, "  ", "", "g")
  let @f = substitute(@f, "\\\\.\\{-}\\ze,", "", "g")
  return @m . "." . @f
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
