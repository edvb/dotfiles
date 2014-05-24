set nocompatible " make vim not vi (see bottom for why)
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
colorscheme molokai
" colorscheme skittles_berry
" colorscheme solarized

" options{{{2
" airline stuff
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" turn off default GoldenView mappings
let g:goldenview__enable_default_mapping = 0

" Supertab plug-in option
let g:SuperTabDefaultCompletionType = "context"

" just some UltiSnips options
" let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<S-Right>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Left>"

" more UltiSnips optoins
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=DarkGrey

" Indent Guides options
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_default_mapping = 0
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size  = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

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

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1

let g:vimfiler_as_default_explorer = 1

" mappings{{{2
" allow for F3 ro turn on Tagbar plug-in
nmap <silent> <F3> :TagbarToggle<CR>

" set ctrl-m to launch Crunch plug-in
" allows you to do math inside of vim
map gm :Crunch<CR>

" Impaired plug-in stlyed toggle syntax highlighting
nmap [of :syntax on<CR>
nmap ]of :syntax off<CR>
syntax on

" Impaired plug-in styled IndentGuides options
nmap cog <Plug>IndentGuidesToggle
nmap [og <Plug>IndentGuidesEnable
nmap ]og <Plug>IndentGuidesDisable

" Unite plug-in mapping
nmap <silent> <C-p> :Unite -start-insert file<cr>

" GoldenView stuff
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

let g:yankring_replace_n_pkey = '<c-l>'
let g:yankring_replace_n_nkey = '<c-h>'

" turn on VimFiler plug-in
map <silent> <C-i> :VimFiler<CR>

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
set autoindent                  " I hope you know what this does
set autowrite                   " automatically write before running commands that need it to be written
set hidden                      " hide buffers when they are abandoned
set nojoinspaces                " turn off putting a space after join command
set noshowmode                  " turn off "--INSERT--" at bottom of screen
set nowrap                      " change what happens when there is no more space on screen
set shiftround                  " make indents always be at a multiple of the tab width
set showcmd                     " show commands that you are typing
set title                       " turn on the vim title at the top of the window
set ttyfast                     " makes vim faster
set visualbell                  " use visual bell instead of beeping
set backspace=2                 " turn on backspace
set completeopt-=preview        " disable pop-up when using Neocomplete
set cryptmethod=blowfish        " change the way vim encrypts files to blowfish from zip
set iskeyword+=.                " better python auto complete for . names
set modelines=5                 " number of lines down vim checks for set commands
set mouse=a                     " turn on the mouse
set nrformats=octal,hex,alpha   " allow you to ctrl-a/ctrl-x to increase/decrease letters and numbers
set scrolloff=7                 " make vim have 7 lines below cursor when moving down
set spell spelllang=en_us       " set language for spell check to United States
"                                 Great Britain = gb, Canada = ca, Australia = au, New Zealand = nz
set clipboard=unnamedplus       " vim yanks go to OS's clipboard as well
"                                 remove "plus" if not on Linux(you should use Linux)

" TODO: not working
" set wildignore+=*.swp,*.zip,*.pyc

" set up menu stuff
set wildmenu
set wildmode=list,longest,full

" make line numbers go 1,2,3,4...
set nu
" make the line your cursor is on 0
" set relativenumber
" NOTE: only have one of the above uncommented!

"extra chars like the end of line one and when text raps to next line
set list
set listchars=tab:\┃\ ,eol:¬,extends:❯,precedes:❮

" filetype on
" filetype plugin on

" NOTE: my info, you need to change!
let g:snips_author="ED"
let g:snips_email="edvb54@gmail.com"
let g:snips_github="edvb54"

" make Vim save every time it leaves insert mode
" au InsertLeave * if &mod && expand('%')!=''|write|endif

" search{{{2
set ignorecase  " make search non case sensitive
set smartcase   " allow you to search with more charters
set incsearch   " show the next match while entering a search
set showmatch
set hlsearch
set gdefault

" highlighting{{{1
" highlight the 81st column so you know when your line is to long
call matchadd('Error', '\%81v', 100)

" make spell check underline instead of highlight
hi clear SpellBad
hi SpellBad ctermfg=red cterm=underline

" turn on highlighting of line
set cursorline
set cursorcolumn

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" turn off the background for the end of line signs and make faster
hi clear NonText

hi SignColumn ctermbg=16

" better folding color
hi Folded ctermfg=241 ctermbg=233

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
nnoremap Y y$

" put : or ; at end of line
nnoremap y; A;<ESC>
nnoremap y: A:<ESC>

" insert space in front of cursor
nnoremap y<space> i<space><esc>

" sort selected area alphabetically
vnoremap <silent> gs :sort<Cr>

" add fold markers
nnoremap g{ A{{<Esc>i{<Esc>hi
nnoremap g} o}}<Esc>i}<Esc>hi

" turn off highlighted search with g-enter
nnoremap <silent> g<CR> :noh<CR>

" @: was not working :(
nnoremap @: :<Up><CR>

" make space toggle folds or insert them
nnoremap <space> za
vnoremap <space> zf

" turn off ctrl-z and make it lower number cursor is on
nnoremap <C-z> <C-x>

" indent using the arrow keys
nnoremap <Right> >>
nnoremap <Left>  <<
vnoremap <Right> >gv
vnoremap <Left>  <gv

" insert and remove lines above and below cursor
nnoremap <Up>     O<Esc>j
nnoremap <Down>   o<Esc>k
nnoremap <S-Up>   jddk
nnoremap <S-Down> kdd
nnoremap <C-Down> J
vnoremap <C-Down> J

" move file up and down
nnoremap J <c-Y>
nnoremap K <c-E>
nnoremap <C-K> 15<c-u>
nnoremap <C-J> 15<c-d>

inoremap <C-D> <C-k>

" useful for Neocomplete
inoremap <C-J> <C-n>
inoremap <C-K> <C-p>

" window movements{{{2
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
" functions{{{1
" save line number line when reopening file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" spell check
if version >= 700
    set spl=en spell
    set nospell
endif

" folding{{{2
set foldmethod=marker
setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
set foldcolumn=3

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

" Linux stuff{{{2
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
" vim world. This is because if vim sees a .vimrc file in the home directory
" then it auto-magically sets it. But however if you load a .vimrc using
" "vim -u .new_vimrc" or ":so .new_vimrc" then it will load vim being
" compatible with vi. It is also a case of better safe than sorry.

"}}}
