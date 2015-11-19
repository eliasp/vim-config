execute pathogen#infect()
filetype plugin on
filetype indent on
set expandtab
set shiftwidth=4
set tabstop=4

" set terminal title
set title

" set spaces as '.'
set list
set listchars=tab:\|·,trail:·

"Highlight spaces at the end of lines
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" show <tab> completion all alternatives
set wildmenu
set wildmode=list:longest,full

" enable line numbers
set nu

" adapt colorscheme to dark terminal backgrounds
set background=dark
colorscheme solarized
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

" highlight search results
set hlsearch

" always populate the location list when there are errors found by syntastic
let syntastic_auto_loc_list=1
let syntastic_always_populate_loc_list=1
let g:syntastic_python_pylint_post_args='--disable=line-too-long,too-few-public-methods'

syntax on
filetype plugin indent on

" always show status line
set ls=2

" git information
set statusline=%{fugitive#statusline()}
" file encoding
set statusline+=[%{strlen(&fenc)?&fenc:'none'},
" file format
set statusline+=%{&ff}]
" help file flag
set statusline+=%h
" modified flag
set statusline+=%m
" read only flag
set statusline+=%r
" filetype
set statusline+=%y
" left/right separator
set statusline+=%=
" cursor column
set statusline+=%c,
" cursor line/total lines
set statusline+=%l/%L
" percent through file
set statusline+=\ %P

augroup filetypedetect
    au BufNewFile,BufRead *.tjp,*.tji  setf tjp
    au BufNewFile,BufRead *rb           set tabstop=2 shiftwidth=2
    au BufNewFile,BufRead *.yml         set tabstop=2 shiftwidth=2
augroup END

" enable neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

set nobackup
set nowritebackup

" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" use ctrl+j instead of ctrl+w, j for window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set pastetoggle=<F2>

" disable arrow keys to enforce usage of hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable hjkl as aswell - vimcast 2013/02 (Habit breaking, habit making) tells you why :)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
