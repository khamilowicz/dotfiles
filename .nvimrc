set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set scrolloff=9993
set cursorline
set noswapfile
set undofile
set lazyredraw
set et
set autoread
set list listchars=tab:\ \ ,trail:·

set undodir=~/.vim/undo

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Search
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rvm'
Plugin 'ag.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'eiginn/netrw'
"Plugin 'FelikZ/ctrlp-py-matcher'
"Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'tpope/vim-vinegar'
Plugin 'incsearch.vim'
Plugin 'utl.vim'
"Edit
Plugin 'honza/vim-snipmate'
Plugin 'visual-increment'
"Plugin 'chrisbra/NrrwRgn'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'simnalamburt/vim-mundo'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kovisoft/paredit'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-endwise'
"Move
Plugin 'vim-scripts/camelcasemotion'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'Lokaltog/vim-easymotion'
"Utilities
Plugin 'tpope/vim-rsi'
Plugin 'vim-scripts/TailMinusF'
Plugin 'tpope/vim-speeddating'
Plugin 'slim-template/vim-slim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'itchyny/calendar.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'vim-addon-mw-utils'
Plugin 'tpope/vim-dispatch'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-fugitive'
Plugin 'cohama/agit.vim'
"Languages
Plugin 'Guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-javascript'
Plugin 'tpope/vim-leiningen'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
"Visual
Plugin 'edkolev/tmuxline.vim'
Plugin 'sickill/vim-monokai'
Plugin 'ap/vim-css-color'
Plugin 'vim-airline'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-classpath'

call vundle#end()

autocmd FileType org let maplocalleader=','
autocmd FileType org set ts=2
autocmd FileType org set sts=2

let g:utl_cfg_hdl_scm_http = ":Start open '%u'"
let g:utl_cfg_hdl_mt_application_pdf = ":Start open '%p'"
let g:utl_cfg_hdl_mt_text_directory='VIM'
set encoding=utf-8

imap jk <Esc>
imap Jk <Esc>
let mapleader=","
tnoremap jk  <C-\><C-n>

noremap Q q
noremap q <NOP>

nmap k gk
nmap j gj

nmap D "_d

vmap <C-c><C-d> <Plug>SendSelectionToTmux
nmap <C-c><C-d> <Plug>NormalModeSendToTmux
nmap <C-d>r <Plug>SetTmuxVars
nmap <C-c><C-d> vip<C-c><C-d>

nmap <leader>bi :!bundle install<cr>

"nmap <C-c><C-d> yap<C-w><C-w>p<C-w><C-w>
"vmap <C-c><C-d> y<C-w><C-w>p<C-w><C-w>

set wildmenu
set wildmode=list:longest,full

syntax on

runtime macros/matchit.vim

set laststatus=2
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set grepprg=ag

set relativenumber
set number
"" Use a blinking upright bar cursor in Insert mode, a blinking block in normal

set shell=bash

nmap <C-w>n :vnew<cr>
nmap <C-w><C-n> :vnew<cr>

""" SPEC

autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

map <space>rr :R<CR>
map <space>rg :Rgenerate
xnoremap <space>re :Rextract
map <space>a :A<CR>

nmap cqr vap:Eval<CR>

""let g:rspec_command = 'call Tmux("rspec {spec}\n")'
let g:rspec_command = ":execute 'Dispatch rspec {spec}' | :cw"

let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 0
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git\|tmp\|bundle\|doc'

""" TABS
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

set t_Co=256
color monokai
""color monokai

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme="zenburn"

"let g:GeeknoteExplorerWidth=40

highlight clear SignColumn
nnoremap <c-j> i<CR><Esc>

""not suitable for working with foreign repos
""autocmd FileType c,cpp,java,php,ruby,eruby autocmd BufWritePre <buffer> :%s/\s\+$//e


"let g:table_mode_corner='+'
"let g:table_mode_fillchar='-'

set tabstop=2 shiftwidth=2 expandtab
""set hlsearch

set smartcase

let g:go_disable_autoinstall = 1

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

highlight! link DiffText MatchParen

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:vimfiler_as_default_explorer=1
let g:ag_prg="ag --column"

ab rpy pry
ab slef self

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
nmap <C-q> :noh<CR>
"map n  <Plug>(incsearch-n)
"map N  <Plug>(incsearch-N)
"map *  <Plug>(incsearch-*)
"map #  <Plug>(incsearch-#)
"map g* <Plug>(incsearch-g*)
"map g# <Plug>(incsearch-g#)

"" Press Space to turn off highlighting and clear any message already
"" displayed.
hi Search cterm=NONE ctermfg=black ctermbg=lightcyan

let g:over_enable_cmd_window = 1
let g:over#command_line#search#enable_incsearch = 1
let g:ruby_indent_access_modifier_style = 'indent'
let ruby_spellcheck_strings = 1
let g:rubycomplete_load_gemfile = 1

command! -bar -nargs=1 OpenURL :!open -a '/Applications/Google Chrome.app' <args>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

noremap <space>s :w<cr>

noremap <space>f :CtrlSF<space>
noremap <space>F :CtrlSFOpen<cr>
noremap <space>* :CtrlSF <C-r><C-w><cr>

let g:org_agenda_files=['~/org/**/*.org']
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

noremap <space>C :Calendar -view=week <cr>
noremap <space>c :Calendar -view=day -position=topright -width=40<cr>

noremap <space>n :65vsp ~/org/index.org<cr>
autocmd VimEnter * :65vsp ~/org/index.org
let g:netrw_winsize=20

inoremap <C-l> <C-R>=ListRegisters() <cr>

func! SearchTag()
  let tag = input("Enter tag: ")
  execute ":Ag :" . tag . ": ~/org"
endfunc

noremap <space>fn :call SearchTag()<cr>

func! ListRegisters()
  let lis=[]
  for reg in split('" 0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m', ' ')
    call add(lis, getreg(reg))
  endfor
  call complete(col('.'), lis)
  return ''
endfunc

let g:mustache_abbreviations = 1

noremap H <Plug>Howdoi

"noremap <space>r :reg<cr>
noremap <space>R :RV<cr>

noremap <space>t :tabnew<cr>
noremap <space>T :tabclose<cr>

noremap <space>q jk:bd<CR>
noremap <space>w jk:w<bar>bd<CR>

"noremap <space>e :Geeknote<CR>

noremap <space>h :r ! howdoi
noremap <space>H :vs<cr>:enew<cr>:r ! howdoi -a

noremap ,r :! rake test<cr>

let g:gutentags_exclude = ['bundle']

vmap <Enter> <Plug>(EasyAlign)

map <C-l> <Plug>CamelCaseMotion_w
map <C-j> <Plug>CamelCaseMotion_b

nnoremap <space>u :GundoToggle<CR>

"Fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
xnoremap <space>gb :Gblame<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gl :AgitFile<CR>
xnoremap <space>gl :Glog<CR><CR>
nnoremap <space>gL :Git log<CR>
nnoremap <space>gm :Agit<CR>
nnoremap <space>gf :AgitFile<CR>
nnoremap <space>gC :Git checkout
nnoremap <space>gp :Git add -p<CR>

nnoremap <space>d :diffthis<CR>

if filereadable(glob(".vimrc.local"))
    "source '.vimrc.local'
endif

:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

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
noremap<space>o :OpenChangedFiles <CR>

function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

autocmd BufWritePre *_spec.rb call RunAllSpecs()
autocmd BufWinEnter *.rb :%s/\s\+$//e
autocmd BufWinEnter *.{rb,html,erb,slim,js} call RemoveFancyCharacters()
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

augroup Terminal
  au!
  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! -range REPLSendLine call REPLSend(getline(<line1>, <line2>)) 

nmap <C-d><C-t> vap:REPLSendLine<cr>
vmap <C-d><C-t> :REPLSendLine<cr>
