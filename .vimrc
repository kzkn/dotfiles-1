filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    "Plugin
    Plugin 'gmarik/Vundle.vim'

    "File/Buffer
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'ctrlp.vim'
    Plugin 'rking/ag.vim'
    Plugin 'jeetsukumaran/vim-buffergator'

    "Git
    Plugin 'tpope/vim-fugitive'
    "Plugin 'airblade/vim-gitgutter'
    Plugin 'mhinz/vim-signify'
    Plugin 'sjl/gundo.vim'

    "Javascript
    "Plugin 'node.js'
    "Plugin 'othree/yajs.vim'
    "Plugin 'Enhanced-Javascript-syntax'
    "Plugin 'pangloss/vim-javascript'
    "Plugin 'gavocanov/vim-js-indent'
    Plugin 'heavenshell/vim-jsdoc'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'javascript-libraries-syntax'

    "C
    Plugin 'c.vim'

    "C#
    Plugin 'OmniSharp/omnisharp-vim'
    "dependency for omnisharp-vim
    Plugin 'tpope/vim-obsession'

    "markdown"
    Plugin 'jtratner/vim-flavored-markdown'

    "Lint/Autocomplete
    Plugin 'scrooloose/syntastic'
    Plugin 'Valloric/YouCompleteMe'

    "Colorthemes
    Plugin 'cocopon/iceberg.vim'
    Plugin 'nanotech/jellybeans.vim'
    Plugin 'chriskempson/base16-vim'

    "Editing
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'

    "Navigate
    Plugin 'EasyMotion'
    Plugin 'Shougo/unite-outline'

    "ETC
    Plugin 'bling/vim-airline'
    Plugin 'Shougo/unite.vim'
    Plugin 'rizzatti/dash.vim'
    Plugin 'vim-xkbswitch'
    Plugin 'tpope/vim-dispatch'
call vundle#end()            " required

"=========================== PLUGIN SETTING ==========================
"-- NERDTree
let NERDTreeQuitOnOpen=1

"-- vim-jsdoc
let g:jsdoc_default_mapping = 0
let g:jsdoc_underscore_private = 1

"-- ternjs
let tern_show_argument_hint='on_move'
let tern_show_signature_in_pum=1
"let g:tern_map_keys=1

"-- syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=["eslint"]
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

"-- YouCompleteMe
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_auto_trigger = 1

"-- base16-vim
let base16colorspace=256

"-- javascript-libraries-synatx
let g:used_javascript_libs = 'jquery,underscore,jasmine,requirejs'

"-- vim-flavored-markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"-- CTRLP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|lib\|report\|build'

"-- Omnisharp
augroup omnisharp_commands
    autocmd!
    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>

    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END
"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"-- Airline
set laststatus=2
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

"-- vim-xbkswitch
let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchNLayout = 'us'

"========================= Configuration ==================================
filetype plugin indent on    " required

"문법 하이라이트"
syntax on
syntax sync fromstart

set t_Co=256
set lazyredraw
set ttyfast

"검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라집니다.)
set background=dark
colorscheme base16-default

"Show line number.
set number

"C style indent
set cindent
set autoindent
set smartindent
set copyindent

"shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set shiftwidth=4
"tab을 4칸으로
set tabstop=4
"tab 대신 띄어쓰기로
set expandtab

"검색시 대소문자 구별하지않음
"set ignorecase
"검색시 하이라이트(색상 강조)
set hlsearch
set incsearch

"방향키로 이동가능
set nocompatible
"파일인코딩 형식 지정
set fileencodings=utf-8,euc-kr
"backspace 키 사용 가능
set bs=indent,eol,start
"명령어에 대한 히스토리를 1000개까지
set history=1000
set undolevels=1000
"상태표시줄에 커서의 위치 표시
set ruler
"제목을 표시
set title
"매칭되는 괄호를 보여줌
set showmatch
"자동 줄바꿈 하지 않음
set nowrap
"tab 자동완성시 가능한 목록을 보여줌
set wildmenu
set clipboard=unnamed
set foldmethod=indent
set nofoldenable
set showcmd
set smarttab

set mouse=a

set cursorline

set notimeout

set hidden
set nobackup
set noswapfile

set autoread

"공백문자들
set list
set listchars=tab:≈.,trail:·,extends:ø,nbsp:·

"========================= KEYMAP ==================================
"basic
let mapleader="\<Space>"
imap jj <ESC>
imap ㅓㅓ <ESC>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>

"paste & delete without yanking
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>p "0p

"Toggl Paste"
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

"save
nnoremap <Leader>s :w<CR>

map <C-S-n> :NERDTreeToggle<CR>

"buffer move
nmap <silent> <leader>h :BuffergatorMruCyclePrev<cr>
nmap <silent> <leader>l :BuffergatorMruCycleNext<CR>
nmap <silent> <leader>q :bp <bar> bd #<CR>
nmap <silent> <leader>f :b
nmap <silent> <leader>e :CtrlPBuffer<cr>

"ternjs
nmap <silent> <leader>td :TernDef<CR>
nmap <silent> <leader>tp :TernDefPreview<CR>

"Dash
nmap <silent> <leader>d <Plug>DashGlobalSearch

"Unite
nmap <silent> <leader>u :Unite<CR>

"Unite-outline
nmap <silent> <leader>o :Unite outline<CR>

"TrimWhiteSpace
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

"========================= ETC ==================================
"저장시 필요없는 스페이스 지우기
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileType * autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileType * autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FileType * autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd FileType * autocmd BufWritePre     * :call TrimWhiteSpace()


"=========================== MACVIM =========================="
"remove scrollbars"
set guioptions-=r
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guifont=Bitstream\ Vera\ Sans\ Mono:h12

"change shell cause zsh problem"
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif
