set nocompatible " make Vim not vi (see README for why)
" plug-ins{{{1

" run separate bundles vimrc
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

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
let g:EclimCompletionMethod = 'omnifunc'
let g:tmuxcomplete#trigger  = 'omnifunc'

" Neosnippet options
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" vim-pencil plug-in options
let g:pencil#wrapModeDefault = 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
  autocmd FileType textile call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

let g:startify_custom_header = [
      \ '██╗   ██╗██╗███╗   ███╗',
      \ '██║   ██║██║████╗ ████║',
      \ '██║   ██║██║██╔████╔██║',
      \ '╚██╗ ██╔╝██║██║╚██╔╝██║',
      \ ' ╚████╔╝ ██║██║ ╚═╝ ██║',
      \ '  ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \ '',
      \ '',
      \ ]

let g:startify_bookmarks = [
  \ '~/dotfiles/bashrc',
  \ '~/dotfiles/bash_profile',
  \ '~/dotfiles/tmux.conf',
  \ '~/dotfiles/vimrc',
  \ '~/dotfiles/vimrc.bundles',
  \ ]

let g:startify_session_dir = '~/.vim-session'

let g:netrw_liststyle = 3

" change color of rainbow
let g:rbpt_max = 15

" load rainbow_parentheses plug-in
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesLoadChevrons

" mappings{{{2
" allow for F3 ro turn on Tagbar plug-in
nmap <silent> <F3> :TagbarToggle<CR>

" run eclim
nmap <silent> <F5> :Java<CR>

" GoldenView stuff
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-o>  <Plug>GoldenViewSplit
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" Neocomplete tab to select
" inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

" Neosnippet mappings
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" tmux-navigator plug-in mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>

" mapping for FZF plug-in
nnoremap <silent> <C-I> :FZF!<CR>

" Easy Align mappings
vmap <Enter> <Plug>(EasyAlign)
nmap gA      <Plug>(EasyAlign)

" useful mapping for Vundle
au BufRead,BufNewFile *vimrc* nmap gb :w<CR>:source %<CR>:VundleInstall<CR>
au BufRead,BufNewFile *vimrc* nmap gB :w<CR>:source %<CR>:VundleClean<CR>

"}}}
" basic{{{1
syntax on
set autoindent                  " I hope you know what this does
set autowrite                   " automatically write before running commands that need it to be written
set gdefault                    " make global the default for the :s command
set hidden                      " hide buffers when they are abandoned
set hlsearch                    " highlight previous search pattern
set ignorecase                  " make search non case sensitive
set incsearch                   " show the next match while entering a search
set nojoinspaces                " turn off putting a space after join command
set noshowmode                  " turn off "--INSERT--" at bottom of screen
set nowrap                      " change what happens when you get to edge of screen.
set shiftround                  " make indents always be at a multiple of the tab width
set showcmd                     " show commands that you are typing
set showmatch                   " when a bracket is inserted, briefly jump to the matching one.
set smartcase                   " allow you to search with more charters
set title                       " turn on the Vim title at the top of the window
set ttyfast                     " makes Vim faster
set visualbell                  " use visual bell instead of beeping
set backspace=2                 " turn on backspace
set completeopt-=preview        " disable pop-up when using Neocomplete
set cryptmethod=blowfish        " change the way Vim encrypts files to blowfish from zip
set foldmethod=marker           " set the folding method to use three { to start and three } to end
set laststatus=2                " always turn on status line
set modelines=5                 " number of lines down Vim checks for set commands
set mouse=a                     " turn on the mouse
set nrformats=octal,hex,alpha   " allow you to ctrl-a/ctrl-x to increase/decrease letters and numbers
set scrolloff=7                 " make Vim have 7 lines below cursor when moving down
set t_ut=                       " needed if using Vim inside of tmux
set spell spelllang=en_us       " set language for spell check to United States
"                                 Great Britain = gb, Canada = ca, Australia = au, New Zealand = nz
set clipboard=unnamedplus       " Vim yanks go to OS's clipboard as well
"                                 remove "plus" if not on Linux(you should use Linux)

" set up menu stuff
set wildmenu
set wildmode=list,longest,full

" make line numbers go 1,2,3,4...
set number
" make the line your cursor is on 0
" set relativenumber

"extra chars like the end of line one and when text raps to next line
set list
" set listchars=tab:\┃\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:\|\ ,eol:¬,extends:❯,precedes:❮

" make Vim save every time it leaves insert mode
au InsertLeave * if &mod && expand('%')!=''|write|endif

" save line number line when reopening file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" NOTE: my info, you need to change!
let g:snips_author="ED"
let g:snips_email="edvb54@gmail.com"
let g:snips_github="edvb54"

" highlighting{{{1
" highlight the 81st column so you know when your line is to long
call matchadd('Error', '\%81v', 100)

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
au BufRead,BufNewFile *.md  set filetype=markdown

au BufRead,BufNewFile *bash_profile set filetype=sh
au BufRead,BufNewFile *tmux.conf    set filetype=sh

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
endif

" better highlighting for molokai
if s:color == 'molokai'
  hi NonText ctermbg=none
  hi Folded  ctermbg=none ctermfg=59
endif

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
au InsertLeave * hi SLgreen    ctermfg=2   ctermbg=0
au InsertLeave * hi SLblue     ctermfg=4   ctermbg=0
au InsertLeave * hi SLcyan     ctermfg=6   ctermbg=0

hi statusline ctermfg=0 ctermbg=15
hi SLgreen    ctermfg=2   ctermbg=0
hi SLblue     ctermfg=4   ctermbg=0
hi SLcyan     ctermfg=6   ctermbg=0

set statusline=%#SLblue#%f        " file name
set statusline+=%#SLgreen#\ %Y    " filetype
set statusline+=%#SLcyan#\ %M     " modified flag

set statusline+=\ %=              " align left
set statusline+=%#SLcyan#%c       " column
set statusline+=%#SLgreen#\ %p%%  " percent of file
set statusline+=%#SLblue#\ %l/%L  " line/total lines
set statusline+=%#ErrorMsg#%{SyntasticStatuslineFlag()} " Syntastic Error

" mapping{{{1
" make ZS save without closing
" ZZ is save and quit and ZQ is just quit
nnoremap ZS :w<CR>

" make jj typed fast while in insert mode switch to normal mode :D
inoremap jj <Esc>

" make ctrl+c completely like ESC
inoremap <C-c> <Esc>

" C changes until end of line and D deletes until end of line, so why not Y?
noremap Y y$

" make Q go to next search and run last command
nnoremap Q @='n.'<CR>

" @: was not working :(
nnoremap @: :<Up><CR>

" better indenting for visual mode
vnoremap > >gv
vnoremap < <gv

" pair completion{{{2
inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{    {
inoremap {}    {}

inoremap (     ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap ((    (
inoremap ()    ()

inoremap [     []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[    [
inoremap []    []

inoremap <     <><Left>
inoremap <<    <
inoremap <>    <>

inoremap ""    ""<Left>
inoremap ''    ''<Left>
inoremap ``    ``<Left>

" Linux stuff{{{1
let g:clipbrdDefaultReg = '+'

" turn on alt key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

