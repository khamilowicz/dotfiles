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
set laststatus=2
set tabstop=2
set shiftwidth=2
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Search
Plugin 'VundleVim/Vundle.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'eiginn/netrw'
Plugin 'tpope/vim-vinegar'
"Edit
Plugin 'vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim', { 'for': ['html', 'erb', 'eelixir', 'javascript'] }
Plugin 'tpope/vim-commentary'
Plugin 'kovisoft/paredit', { 'for': 'clojure' }
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
"Move
Plugin 'vim-scripts/camelcasemotion'
Plugin 'ludovicchabant/vim-gutentags'
"Utilities
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-fugitive'
"Languages
Plugin 'Guns/vim-clojure-static', { 'for': 'clojure' }
Plugin 'tpope/vim-fireplace', { 'for': 'clojure' }
Plugin 'pangloss/vim-javascript', { 'for': 'javascript' }
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails', { 'for': 'ruby' }
Plugin 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plugin 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plugin 'vim-ruby/vim-ruby', { 'for': 'ruby' }
"Visual
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-monokai'

call vundle#end() 

colorscheme monokai
" colorscheme default

autocmd BufRead,BufNewFile *.org set filetype=org
autocmd BufRead,BufNewFile *.org set syntax=org
autocmd FileType git set foldlevel=0
autocmd FileType org let maplocalleader=','
autocmd FileType org set ts=2
autocmd FileType org set sts=2
autocmd FileType org set foldlevel=0
autocmd FileType org,help,orgagenda,git nnoremap <buffer> q :bd<cr>
autocmd FileType org map <buffer> <leader>ca kmtjdar/Archive<cr>p>>A archived:[<c-r>=strftime("%Y-%m-%d %a")<cr>]<esc>`t

autocmd BufRead,BufNewFile *.slim set ft=slim
autocmd BufRead,BufNewFile *.hbs set ft=handlebars

autocmd FileType gitcommit set tw=72

autocmd BufRead,BufNewFile *.exs set filetype=elixir
autocmd BufRead,BufNewFile *.ex set filetype=elixir
autocmd BufRead,BufNewFile *.html.eex set filetype=eelixir

autocmd FileType elixir inoremap >> \|>

autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

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
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}%*

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

autocmd FileType gitcommit setlocal spell

let g:ruby_indent_access_modifier_style = 'normal'
let ruby_spellcheck_strings = 1
let g:rubycomplete_load_gemfile = 1

let g:org_agenda_files=['~/org/**/**/*.org', '~/org/**/*.org', '~/org/*.org']
let g:org_todo_keywords=['TODO', 'DOING', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'DELEGATED', 'ABANDONED']
let g:org_aggressive_conceal=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_elixir_checker = 1

let g:gutentags_exclude = ['bundle']

let g:rspec_command = ":execute 'Dispatch rspec {spec}'"

let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git\|tmp\|bundle\|doc\|deps\|_build'

let mapleader=","
let g:ag_prg="ag --column"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

ab rpy pry
ab slef self
ab Casher Cashier

noremap Q q
noremap q <NOP>
nmap k gk
nmap j gj
nmap D "_d
nmap ,r :Rename <C-R>=expand("%:t")<cr>

vnoremap . :norm.<CR>

noremap ]q :cnext<cr>zz
noremap [q :cprevious<cr>zz

noremap ]l :lnext<cr>
noremap [l :lprevious<cr>

noremap ]e :.m+1<cr>
noremap [e :.m-2<cr>

noremap ]n /<<<<<cr>
noremap [n ?<<<<<cr>

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

nnoremap <space>n :Rake notes<cr>
nnoremap <space>N :OrgAgendaTodo<cr>

highlight clear SignColumn 

set wildignore+=*/tmp\//*,*.so,*.swp,*.zip,tags

let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

let g:syntastic_ruby_checkers = ['mri']

nnoremap <space><space> :noh<cr>:%s/\s\+$//e<cr>mxgg=G`x:RemoveFancyCharacters<cr> 
cnoremap %% <C-R>=expand('%:h').'/'<cr>

highlight Folded term=reverse cterm=bold ctermbg=gray ctermfg=black 

highlight Folded ctermfg=black cterm=bold term=reverse

let g:ackprg = 'ag --nogroup --column' 

noremap <space>f :CtrlSF<space>
noremap <space>F :CtrlSFOpen<cr>

command! CalendarH <nop>  " :Calendar -view=month -height=10 -position=below <cr>

function! ToggleNotes()
  let l:notesnr = bufnr("org/index.org")
  let l:visible =  buflisted(l:notesnr)
  if(l:visible == 0)
    :65vsp ~/org/index.org
    :set filetype=org
    :set nowrap
    :foldopen!
    :wincmd p
  else
    exec l:notesnr.'bd'
  endif
endfunction

"Org

language time en_US
noremap <C-j> :call ToggleNotes()<cr>
nnoremap <space>ni 0d$:sp ~/org/index.org<cr>/Inbox<cr>o<c-h>** TODO [<c-r>=strftime("%Y-%m-%d %a")<cr>] <c-r>"<esc>:bd<cr>
xnoremap <space>ni d:sp ~/org/index.org<cr>/Inbox<cr>o<c-h>** TODO [<c-r>=strftime("%Y-%m-%d %a")<cr>] <c-r>"<esc>:bd<cr>
nnoremap <space>nI 0d$:sp ~/org/index.org<cr>/Inbox<cr>o<c-h>** TODO <<c-r>=strftime("%Y-%m-%d %a")<cr>> <c-r>"<esc>:bd<cr>
xnoremap <space>nI d:sp ~/org/index.org<cr>/Inbox<cr>o<c-h>** TODO <<c-r>=strftime("%Y-%m-%d %a")<cr>> <c-r>"<esc>:bd<cr>
nnoremap <space>nt :OrgAgendaTodo<cr>
nnoremap <space>na :OrgAgendaWeek<cr> 

noremap <space>t :tabnew<cr> 
noremap <space>s :w<cr>

vmap <Enter> <Plug>(EasyAlign)

map <C-l> <Plug>CamelCaseMotion_w
map <C-h> <Plug>CamelCaseMotion_b

"Fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
xnoremap <space>gb :Gblame<CR>
" nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gvdiff<CR>
nnoremap <space>gdd :Git diff<CR>
nnoremap <space>gD :Git diff --cached<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gL :Glog<CR>
nnoremap <space>gh :Glog --<CR>
xnoremap <space>gl :Glog<CR><CR>zz
nnoremap <space>gl :tabnew %<cr>:Git! log<CR>
nnoremap <space>glg :Git log --stat --color<CR>
nnoremap <space>glgg :Git log --graph --color --oneline<CR>
" nnoremap <space>gC :Git checkout<space>
nnoremap <space>gc :Git checkout<space>
nnoremap <space>gp :Git add -p<CR>
nnoremap <space>gr :Gtabedit HEAD^{}<cr>
nnoremap <space>go :OpenChangedFiles<CR> 

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

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

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

if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

if !&diff
  " autocmd VimEnter * :call ToggleNotes() 
endif

if &diff
  let g:loaded_gutentags = 1
endif
