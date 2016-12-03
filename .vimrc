" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Load NeoBundle
" <<<
if has('vim_starting')
  set nocompatible                " Recommend
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let neobundle manage neobundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Use neobundle standard recipes.
NeoBundle 'Shougo/neobundle-vim-recipes'

NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'linux' : 'make' }, }
NeoBundle 'Shougo/unite.vim'

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'beloglazov/vim-textobj-quotes'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mhinz/vim-signify'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'paranoida/vim-airlineish'

NeoBundle 'vim-scripts/sudo.vim'
" NeoBundle 'vim-scripts/vimCU'

NeoBundle 'guns/xterm-color-table.vim'

NeoBundle 'spolu/dwm.vim'
NeoBundle 'terryma/vim-expand-region'

" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'zenorocha/dracula-theme'
" NeoBundle 'alem0lars/vim-colorscheme-darcula'
" NeoBundle 'vim-scripts/midnight2.vim'
" NeoBundle 'twerth/ir_black'
" NeoBundle 'zeis/vim-kolor'
" NeoBundle 'vim-scripts/256-grayvim'
" NeoBundle 'vim-scripts/wombat256.vim'
" NeoBundle 'vim-scripts/xterm16.vim'
" NeoBundle 'KabbAmine/yowish.vim'
" NeoBundle 'vim-scripts/guicolorscheme.vim'
" NeoBundle 'tpope/vim-vividchalk'
" NeoBundle 'twerth/ir_black'
" NeoBundle 'noahfrederick/vim-hemisu'
" NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'ywjno/vim-tomorrow-theme'
" NeoBundle 'zaki/zazen'

" Example of extra settings to NeoBundle
" NeoBundle 'https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/matrix.vim', {'script_type' : 'colors'}

NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'godlygeek/tabular'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'sukima/xmledit'

NeoBundle 'scrooloose/syntastic'
if has('python')
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'Valloric/ListToggle'
    NeoBundle 'Valloric/YouCompleteMe', {
                \ 'build' : {
                \     'unix' : 'git submodule update --init --recursive && ./install.py --clang-completer --system-libclang --system-boost'
                \    },
                \ }
endif

NeoBundle 'vim-scripts/DirDiff.vim'

NeoBundle 'KabbAmine/zeavim.vim'

NeoBundle 'airblade/vim-rooter'

NeoBundle 'StanAngeloff/php.vim'

NeoBundle 'ekalinin/Dockerfile.vim'

NeoBundle 'ap/vim-css-color'

NeoBundleCheck

syntax on

call neobundle#end()

filetype plugin indent on       " Required!

" Installation check.
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
" >>>

if &modifiable
    set ff=unix
endif
set nocompatible
set modeline
set lazyredraw
set novisualbell
set noerrorbells
set noerrorbells visualbell t_vb=
au GUIEnter * set vb t_vb=

" don't automagically write on :next"
set noautowrite

" Enable the use of the mouse in terminal
set mouse=nvh

" show matching bracket for 0.1 seconds
set showmatch
set matchtime=1

"case insensitive search
set ignorecase
"smart case - makes search case sensitive only if there is mixed case in search string
set smartcase
set incsearch
set nohlsearch
set scrolloff=5
set sidescrolloff=5

" Relative line numbers (hybrid)
set number
set relativenumber

set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start
set nowrap

set textwidth=0

autocmd Filetype yaml     setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html     setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype json     setlocal tabstop=2 softtabstop=2 shiftwidth=2
" autocmd Filetype markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " \ expandtab wrap linebreak nolist textwidth=0

set encoding=utf-8
set ttyfast
" Set 256 colour mode
" set t_Co=256

" Toggle spell checking on and off with `\s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
set spellfile=~/.vim/spell.add

" To spell check all git commit messages
autocmd FileType markdown setlocal spell
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" Toggle highlight search on and off with `\h`
nmap <silent> <leader>h :set hls!<CR>

set suffixesadd=.java,.php,.cpp,.hpp,.h,.c,.lua,.js

set laststatus=2

" screen related fixes
" map ^[[1~ <Home>
" map ^[[4~ <End>
" imap ^[[1~ <Home>
" imap ^[[4~ <End>

" spacebar to scroll down
nnoremap <Space> <C-d>

if $USER == "dkorah"
    set backup " make backup file
    set backupdir=$HOME/.vim/backup " where to put backup file
    set directory=$HOME/.vim/tmp " directory is the directory for temp file
else
    set backup " make backup file
endif

set makeef=error.err " When using make, where should it dump the file

set wildignore=*.o,*.obj,*.bak,*.exe,*.d

"ensure every file does syntax highlighting (full)
autocmd BufEnter * :syntax sync fromstart

map <C-d> <Esc><Esc>yyp
nmap <silent> <F12> :set wrap!<CR>

" right margin marker at 120 and set it grey
set colorcolumn=-1

" beyond textwidth, make the line appear as error
" if (&wrap)
"     au BufWinEnter * highlight ColorColumn ctermbg=DarkGrey guibg=#222222
"     au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>'.&textwidth.'v.\+', -1)
" else
"     au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
" endif

" more visible vertical window split
" <<<
set fillchars+=vert:┃
au WinEnter * highlight VertSplit ctermfg=53 ctermbg=NONE
" >>>

" gvim specific settings
" <<<
if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=m
    set showtabline=1
    set guioptions-=L
    set lines=55 columns=150

    set guifont=PragmataPro\ 9
    "set guifont=Sudo\ 13
    " set guifont=Fantasque\ Sans\ Mono\ Italic\ 12
    " set guifont=CamingoCode\ Italic\ 10
endif
" >>>

"augroup CursorLine
"    au!
"    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"    au WinLeave * setlocal nocursorline
"augroup END

nnoremap <C-t>     :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>

" Ctrl + \ to toggle previous tab
let g:lasttab = 1
nmap <C-\> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

source ~/.vim/myfiletypes.vim
source ~/.vim/like_vcpp.vim

" XTerm mouse behaviour
" Left mouse click    position the cursor
" Left mouse drag     select text in Visual mode
" Middle mouse click  paste text from the clipboard
" Right mouse click   extend the selected text until the mouse pointer
behave xterm

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
"set viminfo='100,f1,\"500
set viminfo='100,\"100,:20,%,n~/.vim/viminfo

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufReadPost * redraw
au QuickfixCmdPost grep :copen
au QuickfixCmdPost make :copen

" Search selected (visual)
" <<<
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" >>>

" Remove annoying 'Thanks for flying...'
" <<<
set title
set titleold=""
set titlestring=VIM:\ %F
" >>>

" Open help in new tab
" <<<
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('tab help'):('h'))
cnoreabbrev <expr> help ((getcmdtype() is# ':' && getcmdline() is# 'help')?('tab help'):('h'))
" >>>

" "Folding of (gnu)make output
au BufReadPost quickfix setlocal foldmethod=marker
au BufReadPost quickfix setlocal foldmarker=Entering\ directory,Leaving\ directory
au BufReadPost quickfix map <buffer> <silent> zq zM:g/error:/normal zv<cr>
au BufReadPost quickfix map <buffer> <silent> zw zq:g/warning:/normal zv<cr>
au BufReadPost quickfix normal zq
" Source: http://vim.wikia.com/wiki/Folding
" In normal mode, press Space to toggle the current fold open/closed. However,
" if the cursor is not in a fold, move to the right (the default behavior). In
" addition, with the manual fold method, you can create a fold by visually
" selecting some lines, then pressing Space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <silent> <Space> zf

" Fold all second level objects; nested once
" set foldlevel=1
set foldnestmax=1

" Ctrl + F11 to toggle paste mode
set pastetoggle=<C-F11>

"Use one of the following to define the camel characters.
"Include '.' for class member, ',' for separator, ';' end-statement, and <[< bracket starts and "'` quotes.
let g:camelchar = "A-Z0-9.,;:{([`'\"_"

nnoremap <silent>[1;5D :<C-u>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent>[1;5C :<C-u>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent>[1;5D <C-o>:cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent>[1;5C <C-o>:cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
"vnoremap <silent>[1;5C <Esc>`>:<C-U>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o
"vnoremap <silent>[1;5D :<C-U>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o

" Toggle syntax highlighting
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction
nmap <silent>  <leader>x  :call ToggleSyntax()<CR>

"NOTES:
"#hide whitespace diffs in vimdiff
if &diff
    " diff mode
    set diffopt+=iwhite
    " set lines=85 columns=300

    " set guifont=Ubuntu\ Mono\ 6
    set guifont=PragmataPro\ 9
    " set guifont=Sudo\ 9
endif

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf(" vim: set tabstop=%d shiftwidth=%d %s :",
                \ &tabstop, &shiftwidth, &expandtab? "expandtab": "noexpandtab" )
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <leader>ml :call AppendModeline()<CR>

" Load ycm_confirm_extra_conf automatically
let g:ycm_confirm_extra_conf = 0

" au BufRead,BufNewFile *.conf set filetype=cfg
au BufRead,BufNewFile Makefile* set filetype=make
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

" Syntastic PHP config
" <<<
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
" >>>

" YouCompleteMe settings
" <<<
set conceallevel=2
set concealcursor=vin
let g:clang_use_library=1
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine = 'ultisnips'
let g:UltiSnipsExpandTrigger="<c-t>"
let g:ycm_auto_trigger = 1

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20
" >>>

" TagBar toggle
nmap <F8> :TagbarToggle<CR>

au FileType xml let b:loaded_delimitMate = 1

" Set perldoc / pman as <K> over function name..
au FileType php set keywordprg=pman
au BufNewFile,BufRead *.php set keywordprg=pman

au BufNewFile,BufRead *.pl,*.pm set keywordprg=perldoc\ -f

" Use the same symbols as TextMate for tabstops and EOLs
" Shortcut to rapidly toggle `set list`
nmap <leader>. :set list!<CR>
set listchars=tab:‹—,eol:¶,trail:…,nbsp:¤


" Colour Schemes etc.
" <<<
if has("gui_running") && &diff
    colorscheme github
else
    " Select the color scheme
    " let color_scheme = 'dracula'
    " let color_scheme = 'solarized'
    " let color_scheme = 'kolor'
    " let color_scheme = 'yowish'
    " let color_scheme = 'hemisu'
    " let color_scheme = 'distinguished'
    " let color_scheme = 'vividchalk'
    " let color_scheme = '256_adaryn'  "    <------- ex-fav -------
    " let color_scheme = 'freya'       "    <------- another fav --
    " let color_scheme = 'Tomorrow-Night-Blue'
    let color_scheme = 'Tomorrow-Night-Bright'
    " let color_scheme = 'Tomorrow-Night-Eighties'
    " let color_scheme = 'Tomorrow-Night'
    " let color_scheme = 'Tomorrow'
    " let color_scheme = 'zazen'

    " Pre colorscheme loading
    if ( $USER == "dkorah" || $USER == "dino.korah" )
        if ( color_scheme == "solarized" )
            "option name               default     optional
            "------------------------------------------------
            "g:solarized_termcolors=   16      |   256
            "g:solarized_termtrans =   0       |   1
            "g:solarized_degrade   =   0       |   1
            "g:solarized_bold      =   1       |   0
            "g:solarized_underline =   1       |   0
            "g:solarized_italic    =   1       |   0
            "g:solarized_contrast  =   "normal"|   "high" or "low"
            "g:solarized_visibility=   "normal"|   "high" or "low"
            "------------------------------------------------
            set background=dark
            if $TRANSPARENT_TERM != "true" && $BRIGHT_TERM != "true"
                let g:solarized_termtrans =1
            endif
            let g:solarized_degrade   =0
            let g:solarized_bold      =1
            let g:solarized_underline =0
            let g:solarized_italic    =1
            let g:solarized_contrast  ="high"
            let g:solarized_visibility="high"
            let g:solarized_termcolors=256

        elseif (color_scheme == 'xterm16' )
            let xterm16_brightness = 'high'
            let xterm16_colormap = 'allblue'
            let xterm16bg_Normal = 'none'
        elseif (color_scheme == 'kolor' )
            let g:kolor_italic=1                    " Enable italic. Default: 1
            let g:kolor_bold=1                      " Enable bold. Default: 1
            let g:kolor_underlined=0                " Enable underline for 'Underlined'. Default: 0
            let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0'
        elseif (color_scheme == 'hemisu')
            set background=dark
            autocmd ColorScheme hemisu hi Normal ctermbg=NONE
        " elseif (color_scheme == 'matrix_modified')
            " " http://bytefluent.com/vivify/index.php
            " set background=dark
            " source ~/.vim/matrix_modified.vim
            " autocmd ColorScheme matrix_modified hi Normal ctermbg=NONE
        endif
    endif
    " Load the scheme
    execute 'colorscheme '.color_scheme

    "highlight Comment    term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    "highlight Visual     term=NONE cterm=NONE ctermfg=Grey ctermbg=24 gui=NONE guifg=Grey guibg=#005f87
    highlight IncSearch   term=NONE cterm=NONE ctermfg=Cyan ctermbg=DarkBlue gui=NONE guifg=LightBlue guibg=DarkBlue
    highlight MatchParen  term=reverse cterm=bold ctermbg=darkblue guibg=DarkCyan
    "highlight CursorLine term=NONE ctermbg=234 cterm=NONE

    "Invisible character colors
    " highlight NonText    ctermbg=NONE guibg=NONE ctermfg=237 guifg=#000c0f
    highlight NonText    ctermbg=NONE guibg=NONE ctermfg=237 guifg=#073642
    " highlight SpecialKey ctermbg=234 guibg=NONE ctermfg=237 guifg=#000c0f
    " highlight SpecialKey ctermbg=NONE guibg=NONE ctermfg=237 guifg=#000c0f
    highlight SpecialKey ctermbg=NONE guibg=NONE ctermfg=237 guifg=#073642
endif
" >>>

noremap <leader>s :shell<cr>
noremap <leader>m :make<cr>

" Load .vimrc.project from Root Directory
" <<<
" This relies on FindRootDirectory() from vim-rooter
function! LoadProjectVimRc()
    let b:thisdir=expand("%:p:h")
    let b:vimrc=b:thisdir."/.vimrc.project"
    if (filereadable(b:vimrc))
        execute "source ".b:vimrc
    elseif exists("*FindRootDirectory")
        let b:proj_dir=FindRootDirectory()
        if !empty(b:proj_dir)
            let b:vimrc=b:proj_dir."/.vimrc.project"
            if (filereadable(b:vimrc))
                execute "source ".b:vimrc
            endif
        endif
    endif
endfunction
autocmd BufEnter * :call LoadProjectVimRc()
" >>>

let g:rooter_autocmd_patterns = '*.htm,*.js,*.css,*.cpp,*.hpp,*.h,*.php,*.sh,*.bash'
let g:rooter_patterns = ['.git', '.git/', '*.spec', 'Makefile', 'composer.lock', 'main.cpp', '.vimrc.project']
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" VIMFiler settings
" <<<
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
            \ 'force_hide': 1,
            \ })
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
            \ "\<Plug>(vimfiler_expand_tree)",
            \ "\<Plug>(vimfiler_edit_file)")
nmap <silent> <F2> :VimFilerExplorer<CR>
" >>>

" NERDCommenter settings
" <<<
" add extra space around the text
let g:NERDSpaceDelims = 1
" "\/" to toggle lines or selected region
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
" >>>

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'airlineish'
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0

" Press <N>fj Format JSON
" <<<
function! FormatJSON(...)
    let code="\"
                \ var i = process.stdin, d = '';
                \ i.resume();
                \ i.setEncoding('utf8');
                \ i.on('data', function(data) { d += data; });
                \ i.on('end', function() {
                \     console.log(JSON.stringify(JSON.parse(d), null,
                \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
                \ });\""
    execute "%! node -e " . code
endfunction
nmap fj :<C-U>call FormatJSON(v:count)<CR>
" >>>

" text-objects
" <<<
xmap q iq
omap q iq
" >>>

" Regenerate tags when notes file(s) is updated
" <<<
" Source: http://vim.wikia.com/wiki/Add_your_note_files_to_Vim_help
augroup notes_tag
    autocmd!
    autocmd BufEnter ~/.vim/doc/* setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=78
    autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc
augroup END
" >>>

" load and edit this file
" <<<
nnoremap <leader>rc :tabedit $MYVIMRC<CR>
augroup vimrc
    autocmd!
    " autocmd BufReadPost $MYVIMRC :foldclose
    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
" >>>

" Exit insert mode, if left unused
" <<<
" set 'updatetime' to 15 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=30000
au InsertLeave * let &updatetime=updaterestore
au! CursorHoldI * stopinsert
" >>>

" Make views automatic
" <<<
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END
" >>>

" Make arrow key navigation behave in wrapped mode
" <<<
" imap <silent> <Down> <C-o>gj
" imap <silent> <Up> <C-o>gk
" nmap <silent> <Down> gj
" nmap <silent> <Up> gk
" >>>

augroup ColorcolumnOnlyInInsertMode
autocmd!
autocmd InsertEnter * if &textwidth | let b:mytw=0 | else | let b:mytw=1 | setlocal textwidth=120 | endif
autocmd InsertLeave * if b:mytw == 1 | setlocal textwidth=0 | endif
augroup END

" " if you want to use rgb color formatting:
" "   konsoleprofile CustomCursorColor=#255255255
autocmd VimEnter * silent !konsoleprofile UseCustomCursorColor=0
let &t_SI = "\<Esc>]50;CustomCursorColor=white;BlinkingCursorEnabled=1\x7"
let &t_EI = "\<Esc>]50;CustomCursorColor=none;BlinkingCursorEnabled=0\x7"
silent !konsoleprofile CustomCursorColor=white
autocmd VimLeave * silent !konsoleprofile UseCustomCursorColor=0;BlinkingCursorEnabled=1



" vim: tabstop=4 shiftwidth=4 expandtab foldmethod=marker foldmarker=<<<,>>> :
