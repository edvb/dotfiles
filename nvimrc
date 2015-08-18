syntax on
set autoindent                  " I hope you know what this does
set autowrite                   " automatically write before running commands that need it to be written
set hlsearch                    " turn on highlighting of searches
set ignorecase                  " make search non case sensitive
set incsearch                   " show the search result before you finish typing
set noshowmode                  " turn off "--INSERT--" at bottom of screen
set nowrap                      " change what happens when you get to edge of screen.
set shiftround                  " make indents always be at a multiple of the tab width
set showcmd                     " show commands that you are typing
set showmatch                   " when a bracket is inserted, briefly jump to the matching one.
set smartcase                   " allow you to search with more charters
set timeout                     " set timeout for mappings
set notitle                     " turn off the Vim title at the top of the window
set ttyfast                     " makes Vim faster
set visualbell                  " use visual bell instead of beeping
set backspace=2                 " turn on backspace
set completeopt-=preview        " disable pop-up when using Neocomplete
set formatoptions+=w            " when text get over the number set by `set textwidth`, wrap it to next line
set foldmethod=marker           " set the folding method to use three { to start and three } to end
set laststatus=2                " always turn on status line
set modelines=5                 " number of lines down Vim checks for set commands
set mouse=a                     " turn on the mouse
set nrformats=octal,hex,alpha   " allow you to ctrl-a/ctrl-x to increase/decrease letters and numbers
set scrolloff=7                 " make Vim have 7 lines below cursor when moving down
set t_ut=                       " needed if using Vim inside of tmux
set textwidth=79                " set what line to wrap charters at.
set ttimeoutlen=50              " change wait time for `timeout`
set clipboard=unnamedplus       " Vim yanks go to OS's clipboard as well
"                                 remove "plus" if not on Linux

" set up menu stuff
set wildmenu
set wildmode=list,longest,full

" make line numbers go 1,2,3,4...
set number
" make the line your cursor is on 0
set relativenumber

" extra chars like the end of line one and when text raps to next line
set list
set listchars=tab:\|\ ,eol:¬,extends:❯,precedes:❮

" make Vim's clipboard the same as OS's clipboard
let g:clipbrdDefaultReg = '+'

" make Vim save every time it leaves insert mode
au InsertLeave * if &mod && expand('%')!=''|write|endif

" save line number line when reopening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make jj typed quickly while in insert mode switch to normal mode :D
inoremap jj <Esc>

" ZZ is save and quit and ZQ is just quit, so...
" make ZS to save without closing
nnoremap ZS :w<CR>
" make ZA save and quit all windows
nnoremap ZA :wqall<CR>

" easily change buffers
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>

" improve up and down shortcuts
nnoremap <C-J> <C-D>
nnoremap <C-K> <C-U>

