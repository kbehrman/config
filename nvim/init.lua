-- require("kbehrman.core")
require("kbehrman.lazy")






vim.cmd[[


" Buffer
set hid "Hide abandon buffers to not lose undo history.
set switchbuf-=split
set history=1000
set directory=~/tmp/vim_working//,$VIMHOME/tmp//,/tmp//


" -----------------------------------------------------------------------------
" | Display |
" -----------------------------------------------------------------------------
syntax on
set number
set cursorline
set showcmd
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set t_Co=256 " 256 colors
set background=dark
" colorscheme ir_black
" set foldmethod=syntax



" -----------------------------------------------------------------------------
" | Insert |
" -----------------------------------------------------------------------------
" indent called in plugins
set cino=(0
set backspace=indent,eol,start
let loaded_matchparen = 1 "get rid of jumping parenthesis
set tabstop=4     
set shiftwidth=4 
set softtabstop=4     
set smarttab       
set expandtab        



" -----------------------------------------------------------------------------
" | Command |
" -----------------------------------------------------------------------------
set wildmenu
set hlsearch  " highlight search
set incsearch " incremental search, search as you type
set showmatch
set scrolloff=5
set noignorecase 
set smartcase


" -----------------------------------------------------------------------------
" | Pluggins |
" -----------------------------------------------------------------------------
filetype off
filetype on
filetype plugin on
filetype indent on


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" Nerd Commenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Mason
" lua require("Mason").setup( opts:{ensure_installed:{"pyright",}})



" -----------------------------------------------------------------------------
"  | Functions |
" -----------------------------------------------------------------------------
if !exists("*gtd_open()")
  function! s:gtd_open()
    tabnew
    lcd ~/gprojects/GTD
    e ~/Documents/Notes
  endfunction

  command! GTDOpen :call <SID>gtd_open()
endif

" http://vim.wikia.com/wiki/Underline_using_dashes_automatically
function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

if !exists("*insert_date_line()")
  function! s:insert_date_line()
    :normal i## <datehere>
    let a=system("date") | exec ".s/<datehere>/".a."/g" | .s/\%x00//g
    Underline
  endfunction

  command! Date :call <SID>insert_date_line()
endif




" -----------------------------------------------------------------------------
" | Mappings |
" -----------------------------------------------------------------------------
nnoremap <space> za
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>

:" The leader defaults to backslash, so (by default) this
:" maps \* and \g* (see :help Leader).
:" These work like * and g*, but do not move the cursor and always set hls.
:map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
:map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>


"resize horzontal split window
map + <C-W>+
map - <C-W>-
map <c-n> <c-w><
map <c-m> <c-w>>

" cmap W w

map <Leader><F4> :TlistToggle<CR>
"map <Leader><F5> :FufCoverageFile <CR>
map <Leader><F5> "= "= " .strftime("%Y-%m-%d") . " ="<CR>P

map <Leader><F6> :FufTag <CR>
map <Leader><F8> :!/opt/local/bin/ctags  --c++-kinds=+p -R --fields=+iaS --extra=+q --languages=-javascript,-html,-C,-C++,-vim,-make .<CR>
]]
