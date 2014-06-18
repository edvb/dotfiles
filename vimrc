set nocompatible " make Vim not vi (see bottom for why)
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
" colorscheme badwolf
" colorscheme hybrid
" colorscheme jellybeans
" colorscheme molokai
" colorscheme skittles_berry
colorscheme solarized

" options{{{2
" airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Neocomplete options
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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

"set yankring file
let g:yankring_history_file = '.yankring_history'

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

" mappings{{{2
" allow for F3 ro turn on Tagbar plug-in
nmap <silent> <F3> :TagbarToggle<CR>

" run eclim
nmap <silent> <F5> :Java<CR>

" set gm to launch Crunch plug-in
" allows you to do math inside of Vim
map gm :Crunch<CR>

" GoldenView stuff
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-o>  <Plug>GoldenViewSplit
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" Tabular short cuts
nmap gA= :Tab /=<CR>
vmap gA= :Tab /=<CR>
nmap gA: :Tab /:\zs<CR>
vmap gA: :Tab /:\zs<CR>

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

" multiple-cursor plug-in mappings
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-h>'

" tmux-navigator plug-in mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>

" mapping for FZF plug-in
nnoremap <silent> <C-I> :FZF!<CR>

"}}}
" rainbow parentheses stuff{{{2
function! Config_Rainbow()
    call rainbow_parentheses#load(0)
    call rainbow_parentheses#load(1)
    call rainbow_parentheses#load(2)
    autocmd! TastetheRainbow VimEnter * call Load_Rainbow()
endfunction

function! Load_Rainbow()
    call rainbow_parentheses#activate()
endfunction

augroup TastetheRainbow
    autocmd!
    autocmd Syntax * call Config_Rainbow()
    autocmd VimEnter * call Load_Rainbow()
augroup END

" rainbow parentheses toggle
nnoremap <Leader>r :call rainbow_parentheses#toggle()<CR>

" change color of rainbow
let g:rbpt_max = 15
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
set nowrap                      " change what happens when there is no more space on screen
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
" set iskeyword+=.                " better python auto complete for . names
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
set nu
" make the line your cursor is on 0
set relativenumber

"extra chars like the end of line one and when text raps to next line
set list
set listchars=tab:\┃\ ,eol:¬,extends:❯,precedes:❮

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

" spell check
hi SpellBad ctermfg=red cterm=underline
if version >= 700
    set spl=en spell
    set nospell
endif

" better highlighting for solarized
hi CursorLine ctermbg=23
hi CursorColumn ctermbg=23
hi Normal ctermbg=0
hi SignColumn ctermbg=0
hi Visual ctermfg=10 ctermbg=7

" mapping{{{1
" make ZS save without closing
" ZZ is save and quit and ZQ is just quit
nnoremap ZS :w<return>

" make jj typed fast while in insert mode switch to normal mode :D
inoremap jj <Esc>

" make 0 go to beginning of line but first non-white space
" but make ^ go to the very first column of line
nnoremap 0 ^
nnoremap ^ 0

" make Q go to next search and run last command
nnoremap Q @='n.'<CR>

" C changes until end of line and D deletes until end of line, so why not Y?
nmap Y y$

" put : or ; at end of line
nnoremap g; A;<ESC>
nnoremap g: A:<ESC>

" turn off highlighted search with g-enter
nnoremap <silent> g<CR> :noh<CR>

" @: was not working :(
nnoremap @: :<Up><CR>

" make space toggle folds or insert them
nnoremap <space> za
vnoremap <space> zf

" turn off ctrl-z and make it lower number cursor is on
" nnoremap <C-z> <C-x>

" indent using the arrow keys
nnoremap <Right> >>
nnoremap <Left>  <<
vnoremap <Right> >gv
vnoremap <Left>  <gv

inoremap <C-D> <C-k>

" useful for Neocomplete
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" folding{{{1
set foldmethod=marker
set foldcolumn=2

function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

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

" why nocompatible{{{1
" There is a lot of controversy over to use "set nocompatible" or not in the
" Vim world. This is because if Vim sees a .vimrc file in the home directory
" then it auto-magically sets it. But however if you load a .vimrc using
" "vim -u .new_vimrc" or ":so .new_vimrc" then it will load Vim being
" compatible with vi. It is also a case of better safe than sorry.

"}}}
