" plug-ins{{{1

let g:loaded_matchparen = 1

" run separate bundles vimrc
if filereadable(expand("~/dotfiles/vimrc.bundles"))
  source ~/dotfiles/vimrc.bundles
endif

filetype plugin indent on

" use matchit plug-in for jumping to HTML/XML tags with %
runtime! macros/matchit.vim

" turn on colors
set t_Co=256

" different color schemes to choose from
set background=dark
" let s:color = 'badwolf'
" let s:color = 'hybrid'
" let s:color = 'jellybeans'
" let s:color = 'molokai'
" let s:color = 'zenburn'
" let s:color = 'skittles_berry'
let s:color = 'solarized'

execute 'colorscheme '.s:color

" options{{{2
" Neocomplete options
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" allow for neocomplete and eclim/tmuxcomplete to work
let g:tmuxcomplete#trigger  = 'omnifunc'

" Neosnippet options
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" change netrw style to a tree
let g:netrw_liststyle = 3
" man netrw show numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['red', 'darkred', 'brown'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \   '*': {},
  \   'markdown': {
  \     'parentheses_options': 'containedin=markdownCode contained',
  \   },
  \   'lisp': {
  \     'ctermfgs': ['darkred', 'darkmagenta', 'darkcyan', 'darkgreen', 'darkblue', 'magenta'],
  \   },
  \   'tisp': {
  \     'ctermfgs': ['darkred', 'darkmagenta', 'brown', 'darkgreen', 'darkblue', 'magenta'],
  \   },
  \   'vim': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \   },
  \ }
  \}
let g:rainbow_active = 1

" catium.vim options
let g:catium#trail = 0
let g:catium#body  = 0
let g:catium#face  = 0
let g:catium#space = 0

" syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_c_compiler_options="--std=gnu99 -DVERSION"

" gitgutter options
let g:gitgutter_max_signs = 1000

" commentary extra languages
autocmd FileType matlab setlocal commentstring=%\ %s

" mappings{{{2
" turn on Tagbar plug-in
nmap <silent> <F3> :TagbarToggle<CR>

" GoldenView stuff
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-O>     <Plug>GoldenViewSplit
nmap <silent> <leader>o <Plug>GoldenViewSwitchMain

" Neocomplete tab to select
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

" tmux-navigator plug-in mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>

nnoremap <leader>a :AS<CR>

nnoremap <silent> <leader>s :SyntasticToggleMode<CR>

nmap <leader>f :DmenuFile "e"<CR>
nmap <leader>b :DmenuBuf  "e"<CR>
nmap <leader>t :DmenuTag<CR>

map <Leader>l <Plug>TaskList

" useful mapping for Vundle
au BufRead,BufNewFile *vimrc* nmap gb :w<CR>:source %<CR>:VundleInstall<CR>
au BufRead,BufNewFile *vimrc* nmap gB :w<CR>:source %<CR>:VundleClean<CR>

vmap <C-A> <Plug>VisualIncrement
vmap <C-X> <Plug>VisualDecrement

"}}}
" basic{{{1
syntax on
set autoindent                  " I hope you know what this does
set autowrite                   " automatically write before running commands that need it to be written
set nohlsearch                  " turn off highlighting of searches
set ignorecase                  " make search non case sensitive
set incsearch                   " show the search result before you finish typing
set noshowmode                  " turn off '--INSERT--' at bottom of screen
set nowrap                      " do not wrap text to newline when it gets to the end of the screen
set shiftround                  " make indents always be at a multiple of the tab width
set showcmd                     " show normal mode commands that you are typing
set showmatch                   " when a bracket is inserted, briefly highlight the matching one.
set smartcase                   " allow you to search with more charters
set hidden                      " keep buffers loaded when not visible
set splitbelow                  " create new splits under current window
set splitright                  " create new vertical splits to the right
set timeout                     " set timeout for mappings
set notitle                     " stop Vim from setting the terminal's title
set ttyfast                     " makes Vim faster
set novisualbell                " disable screen flashes for error
set backspace=2                 " turn on backspace
set completeopt-=preview        " disable pop-up when using Neocomplete
set cryptmethod=blowfish        " change the way Vim encrypts files to blowfish from zip
set formatoptions+=w            " when text get over the number set by `set textwidth`, wrap it to next line
set foldmethod=marker           " set the folding method to use three { to start and three } to end
set laststatus=2                " always turn on status line
set modelines=5                 " number of lines down Vim checks for set commands
set mouse=a                     " turn on the mouse
set nrformats=octal,hex,alpha   " allow you to ctrl-a/ctrl-x to increase/decrease letters and numbers
set scrolloff=7                 " make Vim have 7 lines below cursor when moving down
set t_ut=                       " needed if using Vim inside of tmux
set textwidth=98                " wrap lines which exceed 100 charters long
set ttimeoutlen=50              " change wait time for `timeout`
set spell spelllang=en_us       " set language for spell check to United States
set clipboard=unnamedplus       " Vim yanks go to OS's clipboard as well
                                " remove 'plus' if not on Linux

" set up menu stuff
set wildmenu
set wildmode=list,longest,full

" make line numbers go 1,2,3,4...
set number
" make the line your cursor is on 0
" set relativenumber

" extra chars like the end of line one and when text raps to next line
set list
set listchars=tab:\|\ ,eol:¬,extends:❯,precedes:❮

" make Vim's clipboard the same as OS's clipboard
let g:clipbrdDefaultReg = '+'

if has("autocmd")
  " make Vim save every time it leaves insert mode
  autocmd InsertLeave * if &mod && expand('%')!=''|write|endif

  " save line number line when reopening file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " don't for git commit file
  autocmd FileType gitcommit normal gg

  " remove trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e
endif

" turn on alt key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" highlighting{{{1
" highlight the 100th column so you know when your line is to long
call matchadd('Error', '\%100v', 100)

au BufRead,BufNewFile *.md  set filetype=markdown
au BufRead,BufNewFile *bash_profile* set filetype=sh
au BufRead,BufNewFile *tmux.conf*    set filetype=sh
au BufRead,BufNewFile *conkyrc*      set filetype=sh
au BufRead,BufNewFile *gitconfig*    set filetype=gitconfig
au BufRead,BufNewFile TODO           set filetype=markdown

" spell check
hi SpellBad ctermfg=red cterm=underline
if version >= 700
  set spl=en spell
  set nospell
endif

" better highlighting for solarized
if s:color == 'solarized'
  hi CursorLine   ctermbg=23
  hi CursorColumn ctermbg=23
  hi Normal       ctermbg=none
  hi SignColumn   ctermbg=0
  hi Folded       cterm=bold
  hi VertSplit    ctermbg=0
  hi TabLine      term=none cterm=none
  hi TabLineFill  term=none cterm=none
  hi TabLineSel   term=none cterm=none
endif

" better highlighting for molokai
if s:color == 'molokai'
  hi NonText ctermbg=none
  hi Folded  ctermbg=none ctermfg=59
endif

" fix highlighting of special symbols
function! C_Syntax()
  syntax match _Operator "[-+&|<>=!\*~.,:%&^?]"
  syntax match _Operator "/ \|/="
  syntax match _Semicolon "[;]"
  hi link _Operator Operator
  hi _Semicolon ctermfg=red
  set sw=8
  set ts=8
  set noexpandtab
endfunction
autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,hpp,} call C_Syntax()

" status line{{{1
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=4   ctermbg=15
    hi SLgreen    ctermfg=0 ctermbg=4
    hi SLblue     ctermfg=0 ctermbg=4
    hi SLcyan     ctermfg=0 ctermbg=4
  elseif a:mode == 'r'
    hi statusline ctermfg=9 ctermbg=15
    hi SLgreen    ctermfg=0 ctermbg=9
    hi SLblue     ctermfg=0 ctermbg=9
    hi SLcyan     ctermfg=0 ctermbg=9
  else
    hi statusline ctermfg=0 ctermbg=15
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=0 ctermbg=15
au InsertLeave * hi SLgreen    ctermfg=2 ctermbg=0
au InsertLeave * hi SLblue     ctermfg=4 ctermbg=0
au InsertLeave * hi SLcyan     ctermfg=6 ctermbg=0

hi statusline ctermfg=0 ctermbg=15
hi SLgreen    ctermfg=2 ctermbg=0
hi SLblue     ctermfg=4 ctermbg=0
hi SLcyan     ctermfg=6 ctermbg=0

set statusline=%#SLblue#%f       " file name
set statusline+=%#SLgreen#\ %Y   " filetype
set statusline+=%#SLcyan#\ %M    " modified flag
set statusline+=\ %{g:Catium()}

set statusline+=\ %=             " move to right side

set statusline+=%#SLcyan#%p%%    " percent of file
set statusline+=%#SLgreen#\ %v   " column
set statusline+=%#SLblue#\ %l/%L " current line/total lines
set statusline+=%#ErrorMsg#%{SyntasticStatuslineFlag()} " Syntastic Error

" mapping{{{1
" make jj typed quickly while in insert mode switch to normal mode :D
inoremap jj <Esc>

" make ctrl+c completely like ESC
inoremap <C-c> <Esc><Esc>

" extend ESC to also clear search highlight
nnoremap <silent> <ESC> :noh<CR>
nnoremap <ESC>[ <ESC>[

" ZZ is save and quit and ZQ is just quit, so...
" make ZS to save without closing
nnoremap ZS :w<CR>
" make ZA save and quit all windows
nnoremap ZA :wqall<CR>

" C changes until end of line and D deletes until end of line, so why not Y?
noremap Y y$

" repeat colon commands
nnoremap Q :<Up><CR>

" keep selected area when indenting
vnoremap > >gv
vnoremap < <gv

" easily change buffers
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>

" improve up and down shortcuts
nnoremap <C-J> <C-D>
nnoremap <C-K> <C-U>

nnoremap <silent> <leader>m :silent! make<CR>
nnoremap <silent> <leader>c :!ctags -R .<CR>

" pair completion{{{2
inoremap {        {}<Left>
inoremap {<CR>    {<CR>}<Esc>O
inoremap {<Space> {<Space><Space>}<Left><Left>
inoremap {{       {
inoremap {}       {}

inoremap (        ()<Left>
inoremap (<CR>    (<CR>)<Esc>O
inoremap (<Space> (<Space><Space>)<Left><Left>
inoremap ((       (
inoremap ()       ()

inoremap [        []<Left>
inoremap [<CR>    [<CR>]<Esc>O
inoremap [<Space> [<Space><Space>]<Left><Left>
inoremap [[       [
inoremap []       []

inoremap <>       <><Left>
inoremap ""       ""<Left>
inoremap ''       ''<Left>
inoremap ``       ``<Left>
inoremap `<CR>    ```<CR>```<Esc>O
inoremap $$       $$<Left>
inoremap %%       %%<Left>

inoremap /*       /*  */<Left><Left><Left>
