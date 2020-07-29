" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Load vim-plug " <<<
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" collection of language packs for Vim (indent, syntax etc
Plug 'sheerun/vim-polyglot'

" insert mode completions with Tab key
Plug 'ervandew/supertab'

" git things
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" Asynchronous dispatcher (run async commands)
Plug 'tpope/vim-dispatch'

Plug 'vim-airline/vim-airline'

Plug 'vim-scripts/sudo.vim'

" visually select increasingly larger regions of text
" + and _ keys
Plug 'terryma/vim-expand-region'

" Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
" Plug 'joshdick/onedark.vim'
Plug 'ajh17/spacegray.vim'

" intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" " Align text
" " See http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" Plug 'godlygeek/tabular'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" Surround selection with quote, brackets, etc
Plug 'tpope/vim-surround'
" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'
" Pairs of handy bracket mappings
" " Plug 'tpope/vim-unimpaired'
" toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'vim-syntastic/syntastic'
" C++ stuff
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    ! CC=clang CXX=clang++ python3 ./install.py --go-completer --clang-completer --clang-tidy
  endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rhysd/vim-clang-format'

" Mark errors in margin
Plug 'mh21/errormarker.vim'

" Plug 'vim-scripts/DirDiff.vim'
Plug 'will133/vim-dirdiff'

" Changes Vim working directory to project root
Plug 'airblade/vim-rooter'

Plug 'StanAngeloff/php.vim'

Plug 'ekalinin/Dockerfile.vim'

Plug 'ap/vim-css-color'

" jq syntax coloring
Plug 'vito-c/jq.vim'

" golang
Plug 'fatih/vim-go'
" Plug 'mdempsky/gocode', {'rtp': 'vim/'}
" Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" linting
Plug 'w0rp/ale', { 'on':  'ALEToggle' }

call plug#end()

" >>>

" add 'Man' command; distributed with vim
runtime! ftplugin/man.vim

syntax on

" enable loading of indent file for a specific file type
filetype plugin indent on

if &modifiable
    set ff=unix
endif
set nocompatible
set modeline
set lazyredraw

" keep some space near the edges when scrolling
set scrolloff=5
set sidescrolloff=5
set laststatus=2
set suffixesadd=.java,.php,.cpp,.hpp,.h,.c,.lua,.js

" milliseconds nothing is typed the swap file will be written to disk
" Tweaking this to make vim-gitgutter be more snappy
set updatetime=500

set nowrap

" don't automagically write on :next"
set noautowrite

" Enable the use of the mouse in terminal
set mouse=nvh

" control where contents of file can endup " <<<
" think password file ending up on global readable /tmp
if !isdirectory($HOME . "/.vim/backup")
    call mkdir($HOME . "/.vim/backup", "p", 0700)
endif
set backup " make backup file
set backupdir=~/.vim/backup,~/backup,~ " where to put backup file

if !isdirectory($HOME . "/.vim/tmp")
    call mkdir($HOME . "/.vim/tmp", "p", 0700)
endif
set directory=~/.vim/tmp,~/tmp,~ " directory is the directory for temp file
" >>>

set makeef=error.err " When using make, where should it dump the file

set wildignore=*.o,*.obj,*.bak,*.exe,*.d

"ensure every file does syntax highlighting (full)
autocmd BufEnter * :syntax sync fromstart

" right margin marker at 120 and set it grey
set colorcolumn=80,120

" block indent " <<<
vnoremap < <gv
vnoremap > >gv
" >>>

" Silence please!  " <<<
set novisualbell
set noerrorbells
set noerrorbells visualbell t_vb=
au GUIEnter * set vb t_vb=
" >>>

" show matching bracket etc " <<<
set showmatch
" match < and >
set matchpairs+=<:>
set matchtime=1
" >>>

" settings for search " <<<
"case insensitive search
set ignorecase
"smart case - makes search case sensitive only if there is mixed case in search string
set smartcase
set incsearch
set nohlsearch
" Toggle highlight search on and off with `\h`
nmap <silent> <leader>h :set hls!<CR>
" >>>

" line numbers " <<<
set number
set relativenumber
" >>>

" Tab Settings " <<<
" Whats this for??!!
" set textwidth=0
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start
autocmd Filetype yaml     setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html     setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype json     setlocal tabstop=2 softtabstop=2 shiftwidth=2
" >>>

" Set 256 colour mode
" set t_Co=256

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Spell check " <<<
" Toggle spell checking on and off with `\s`
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
set spellfile=~/.vim/spell.add

" ON by default for markdown
autocmd FileType markdown setlocal spell
" >>>

" git commit message settings " <<<
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell colorcolumn=50,72
" >>>

map <C-d> <Esc><Esc>yyp
nmap <silent> <F12> :set wrap!<CR>

" more visible vertical window split " <<<
set fillchars+=vert:┃
au WinEnter * highlight VertSplit ctermfg=53 ctermbg=NONE
" >>>

" gvim specific settings " <<<
if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=m
    set showtabline=1
    set guioptions-=L
    " set lines=55 columns=150

    " set guifont=PragmataPro\ Mono\ 10.5
    set guifont=Iosevka\ Term\ Light\ 11
    " set guifont=Iosevka\ Term\ SS08\ 11
    " set guifont=mononoki\ Italic\ 11
    " set guifont=Sudo\ 13
    " set guifont=Fantasque\ Sans\ Mono\ 12
    " set guifont=CamingoCode\ Italic\ 10
    " set guifont=Source\ Code\ Pro\ 10
endif
" >>>

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

nnoremap <C-t>     :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>

" Ctrl + \ to toggle previous tab
let g:lasttab = 1
nmap <C-\> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" SmartHome keys "<<<
" Ref: https://vim.fandom.com/wiki/Smart_home
" noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
" imap <silent> <Home> <C-O><Home>
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
" noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
" vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
" imap <End> <C-o><End>
" >>>

" XTerm mouse behaviour
" Left mouse click    position the cursor
" Left mouse drag     select text in Visual mode
" Middle mouse click  paste text from the clipboard
" Right mouse click   extend the selected text until the mouse pointer
behave xterm

" cut / yank from vim (terminal) into DE clipboard
" " MacOS
" vnoremap <C-c> :w !pbcopy<CR><CR>
" noremap <C-v> :r !pbpaste<CR><CR>
" Linux
if !executable('xclip')
    echoerr "'xclip' not found; copying to system clipboard wouldn't work"
endif
vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
" noremap <C-v> :r !xclip -o -sel -c<CR><CR>

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
"set viminfo='100,f1,\"500
set viminfo='100,\"100,:20,n~/.vim/viminfo

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufReadPost * redraw
au QuickfixCmdPost grep :copen
au QuickfixCmdPost make :copen

" Search selected (visual) " <<<
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

" Remove annoying 'Thanks for flying...' " <<<
set title
set titleold=""
set titlestring=VIM:\ %F
" >>>

" Open help in new tab " <<<
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

" "Use one of the following to define the camel characters.
" "Include '.' for class member, ',' for separator, ';' end-statement, and <[< bracket starts and "'` quotes.
" let g:camelchar = "A-Z0-9.,;:{([`'\"_"
"
" nnoremap <silent>[1;5D :<C-u>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
" nnoremap <silent>[1;5C :<C-u>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
" inoremap <silent>[1;5D <C-o>:cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
" inoremap <silent>[1;5C <C-o>:cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
" "vnoremap <silent>[1;5C <Esc>`>:<C-U>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o
" "vnoremap <silent>[1;5D :<C-U>cal search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

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
    set guifont=PragmataPro\ Mono\ 9
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

" Good indentions ... Fix current file's indents
nnoremap <F7> mzgg=G`z

" Load ycm_confirm_extra_conf automatically
let g:ycm_confirm_extra_conf = 0

" au BufRead,BufNewFile *.conf set filetype=cfg
au BufRead,BufNewFile Makefile* set filetype=make
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

" Syntastic config " <<<
let g:syntastic_sh_checkers = ['sh']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"
" let g:syntastic_sh_checkers = ['/home/dkorah/.cabal/bin/shellcheck']
let g:syntastic_dockerfile_checkers = ['hadolint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
" >>>

" YouCompleteMe settings " <<<
set conceallevel=2
set concealcursor=vin
let g:clang_use_library=1
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine = 'ultisnips'
let g:UltiSnipsExpandTrigger="<c-t>"
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
map <leader>f :YcmCompleter FixIt<CR>

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20
" >>>

" TagBar " <<<
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
" autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_autofocus = 0
let g:tagbar_compact = 1
" >>>

" delimitMate " <<<
au FileType xml let b:loaded_delimitMate = 1
au FileType c,cpp let b:delimitMate_matchpairs = "(:),[:],{:}"
" >>>

" Set perldoc / pman as <K> over function name..
au FileType php set keywordprg=pman
au BufNewFile,BufRead *.php set keywordprg=pman

au BufNewFile,BufRead *.pl,*.pm set keywordprg=perldoc\ -f

" Use the same symbols as TextMate for tabstops and EOLs
" Shortcut to rapidly toggle `set list`
nmap <leader>. :set list!<CR>
set listchars=tab:‹—,eol:¶,trail:×,nbsp:¤

" Colour Schemes etc.  " <<<
if has("gui_running") && &diff
    set background=dark
    colorscheme github
else
    " Select the color scheme
    " let color_scheme = 'dracula'
    " let color_scheme = 'solarized'
    " let color_scheme = 'PaperColor'
    " let color_scheme = 'kolor'
    " let color_scheme = 'yowish'
    " let color_scheme = 'hemisu'
    " let color_scheme = 'distinguished'
    " let color_scheme = 'vividchalk'
    " let color_scheme = '256_adaryn'  "    <------- ex-fav -------
    " let color_scheme = 'freya'       "    <------- another fav --
    " let color_scheme = 'aldmeris'
    " let color_scheme = 'Tomorrow-Night-Blue'
    " let color_scheme = 'Tomorrow-Night-Bright'
    " let color_scheme = 'Tomorrow-Night-Eighties'
    " let color_scheme = 'Tomorrow-Night'
    " let color_scheme = 'Tomorrow'
    " let color_scheme = 'zazen'
    " let color_scheme = 'janah'
    let color_scheme = 'onedark'
    let color_scheme = 'spacegray'

    " Pre colorscheme loading
    if ( $USER == "dkorah" || $USER == "dino.korah" )
        if ( color_scheme == "aldmeris" )
            " let g:aldmeris_termcolors = "tango"
            let g:aldmeris_transparent = 1
            highlight Pmenu ctermfg=NONE ctermbg=0 guifg=NONE guibg=#000000
        elseif ( color_scheme == "solarized" )
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
            let g:solarized_termtrans =1
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
        elseif (color_scheme == 'PaperColor')
            set background=dark
            autocmd ColorScheme PaperColor hi Folded ctermbg=NONE
            let g:PaperColor_Theme_Options = {
            \   'theme': {
            \     'default': {
            \       'allow_bold': 1,
            \       'allow_italic': 1,
            \     },
            \     'default.dark': {
            \       'transparent_background': 1
            \     }
            \   }
            \ }
        elseif (color_scheme == 'onedark')
            set background=dark
            let g:onedark_terminal_italics=1
            " " onedark.vim override: Don't set a background color when running in a terminal;
            " " just use the terminal's background color
            " " `gui` is the hex color code used in GUI mode/nvim true-color mode
            " " `cterm` is the color code used in 256-color mode
            " " `cterm16` is the color code used in 16-color mode
            " if (has("autocmd") && !has("gui_running"))
            "   augroup colorset
            "     autocmd!
            "     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
            "     autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
            "   augroup END
            " endif
        elseif (color_scheme == 'hemisu')
            set background=dark
            autocmd ColorScheme hemisu hi Normal ctermbg=NONE
        elseif (color_scheme == 'spacegray')
            let g:spacegray_use_italics = 1
        endif
    endif

    " Load the scheme
    execute 'colorscheme '.color_scheme

    "highlight Comment    term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    "highlight Visual     term=NONE cterm=NONE ctermfg=Grey ctermbg=24 gui=NONE guifg=Grey guibg=#005f87
    highlight IncSearch   term=NONE cterm=NONE ctermfg=Cyan ctermbg=DarkBlue gui=NONE guifg=LightBlue guibg=DarkBlue
    highlight MatchParen  term=reverse cterm=bold ctermbg=darkblue guibg=DarkCyan

    "Invisible character colors
    " highlight NonText    ctermbg=NONE guibg=NONE ctermfg=237 guifg=#000c0f
    highlight NonText    ctermbg=NONE guibg=NONE ctermfg=237 guifg=#073642
    " highlight SpecialKey ctermbg=234 guibg=NONE ctermfg=237 guifg=#000c0f
    " highlight SpecialKey ctermbg=NONE guibg=NONE ctermfg=237 guifg=#000c0f
    highlight SpecialKey ctermbg=NONE guibg=NONE ctermfg=237 guifg=#073642
endif
" >>>

noremap <leader>t :shell<cr>
" noremap <leader>m :make<cr>
nnoremap <leader>m :Dispatch! make -C cmake-build-debug

" Load .vimrc.project from Root Directory " <<<
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

" vim-rooter settings " <<<
let g:rooter_targets = '*.htm,*.js,*.css,*.cpp,*.hpp,*.h,*.php,*.sh,*.bash'
let g:rooter_patterns = ['.git', '.git/', '*.spec', 'Makefile', 'composer.lock', 'main.cpp', '.vimrc.project', 'Gopkg.toml', 'README.md']
let g:rooter_cd_cmd="lcd"
let g:rooter_silent_chdir = 0
" >>>

" ALE settings " <<<
let g:ale_completion_enabled = 0
let g:ale_go_bingo_executable = 'gopls'
let g:ale_sh_shellcheck_options = '-x'
" >>>

" VIMFiler settings " <<<
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
            \ 'force_hide': 1,
            \ })
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
            \ "\<Plug>(vimfiler_expand_tree)",
            \ "\<Plug>(vimfiler_edit_file)")
nmap <silent> <F2> :VimFilerExplorer<CR>
nmap <silent> <leader><F2> :VimFilerExplorer -find<CR>
" >>>

" FZF settings " <<<
nmap <silent> <S-F2> :Files<CR>
" make 'return' to open in a new tab
let g:fzf_action = {
  \ 'return': 'tab split',
  \ 'ctrl-j': 'split',
  \ 'ctrl-k': 'vsplit' }
" >>>

" netrw settings " <<<
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" function! ToggleVExplorer()
"   if exists("t:expl_buf_num")
"       let expl_win_num = bufwinnr(t:expl_buf_num)
"       if expl_win_num != -1
"           let cur_win_nr = winnr()
"           exec expl_win_num . 'wincmd w'
"           close
"           exec cur_win_nr . 'wincmd w'
"           unlet t:expl_buf_num
"       else
"           unlet t:expl_buf_num
"       endif
"   else
"       exec '1wincmd w'
"       Vexplore
"       let t:expl_buf_num = bufnr("%")
"   endif
" endfunction
" map <silent> <F2> :call ToggleVExplorer()<CR>
" >>>

" NERDCommenter settings " <<<
" add extra space around the text
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" "\/" to toggle lines or selected region
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
" >>>

" vim-airline settings " <<<
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'airlineish'
" let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
" >>>

" Press <N>fj Format JSON " <<<
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

" text-objects " <<<
xmap q iq
omap q iq
" >>>

" Regenerate tags when notes file(s) is updated " <<<
" Source: http://vim.wikia.com/wiki/Add_your_note_files_to_Vim_help
augroup notes_tag
    autocmd!
    autocmd BufEnter ~/.vim/doc/* setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=78
    autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc
augroup END
" >>>

" load and edit this file " <<<
nnoremap <leader>rc :tabedit $MYVIMRC<CR>
augroup vimrc
    autocmd!
    " autocmd BufReadPost $MYVIMRC :foldclose
    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
" >>>

" Exit insert mode, if left unused " <<<
" set 'updatetime' to 15 seconds when in insert mode
" au InsertEnter * let updaterestore=&updatetime | set updatetime=30000
" au InsertLeave * let &updatetime=updaterestore
" au! CursorHoldI * stopinsert
" >>>

" Make views automatic " <<<
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

" Make arrow key navigation behave in wrapped mode " <<<
" imap <silent> <Down> <C-o>gj
" imap <silent> <Up> <C-o>gk
" nmap <silent> <Down> gj
" nmap <silent> <Up> gk
" >>>

" GitGutter " <<<
" let g:gitgutter_sign_added = '│'
" let g:gitgutter_sign_modified = '│'
" let g:gitgutter_sign_removed = '│'
" let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_sign_added = '▕'
let g:gitgutter_sign_modified = '▕'
let g:gitgutter_sign_removed = '▕'
let g:gitgutter_sign_modified_removed = '▕'

highlight GitGutterAdd    guifg=#4D8000
highlight GitGutterChange guifg=#004D80
highlight GitGutterDelete guifg=#80000D
" >>>

" vCoolor - colour picker options " <<<
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<leader>#'
let g:vcoolor_custom_picker = '/usr/bin/kdialog --getcolor --default '
" >>>

" vim-go " <<<
let g:go_def_mode='gopls'
" >>>

" errormarker.vim " <<<
nmap <silent> <unique> <leader>c@ :ErrorAtCursor<CR>
" >>>

" vim: tabstop=4 shiftwidth=4 expandtab foldmethod=marker foldmarker=<<<,>>> :
