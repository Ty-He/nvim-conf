set nu

" set tab width
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" set leader key
let mapleader = ","
let g:mapleader = ","

" =============== vim-plug ====================
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'brance': 'release'}
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', {'as':'dracula'}
call plug#end()


" ================ coc.nvim ====================

" set a variable to manage coc-plug
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-cmake', 'coc-sh']

" goto another file while the current file not save
set hidden

" update time
set updatetime=100

" decline infomation which is useless
set shortmess+=c

" set Tab
"inoremap <silent><expr> <TAB>
"		\ pumvisible() ? "\<C-n>" :
"		\ <SID>check_back_space() ? "\<TAB>" :
"		\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" show all completion infomation
inoremap <silent><<expr> <C-o> coc#refresh()

" goto error-code
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goto function
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentatino in preview window
nnoremap <Silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('doHover')
    else 
		call CocACtion('doHover')
    endif
endfunction

" highlight all word which is same to select
auto CursorHold * silent call CocActionAsync('highlight')

" ...
"

"================== nerdtree ======================
" window size
let g:NERDTreeWinSize=25

" show bookmarks
let NERDTreeShowBookmarks=1

" set icon
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

" show line number
let g:NERDTreeShowLineNumbers=0

" not show hidden file
let g:NERDTreeHidden=0

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" open nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>


" ===================== indentLine =====================
" set indentLine size 
let g:indent_guides_guide_size=1
" set visual from 2
let g:indent_guides_start_level=2


" ==================== airline ==========================
" set status-line
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_seq='|'
let g:airline#extensions#tabline#buffer_nr_show=0
let g:airline#extensions#tabline#formatter='default'
" set keymap
let g:airline#extensions#keymap#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#buffer_idx_fotmat = {
    \ '0': '0',
    \ '1': '1',
    \ '2': '2',
    \ '3': '3',
    \ '4': '4',
    \ '5': '5',
    \ '6': '6',
    \ '7': '7',
    \ '8': '8',
    \ '9': '9'
    \}
" <leader> + i to no.i tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" <leader> +/- to next/prev tab
nmap <leader>+ <Plug>AirlineSelectNextTab
nmap <leader>- <Plug>AirlineSelectPrevTab
" <leader> q for quit
nmap <leader>q :bp<cr>:bd #<cr>
" modify symbols
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
" current line for mouse
" let g:airline_symbols.linenr="Row"
let g:airline_symbols.whitespace='|'

" support powerline font
let g:airline_powerline_fonts=1
" set themes, powerline-font need some theme
let g:airline_theme = 'violet'
" some symbols
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep ='❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" set guifont=PowelineSymbols

"================ neovim theme ==============
colorscheme dracula 

" 
" highlight current line
set cursorline 
" hi PMenu ctermfg=40 ctermbg=0
" hi PMenuSel ctermfg=0 ctermbg=4
" hi CocHighlightText ctermfg=40 ctermbg=0
hi CocMenuSel ctermfg=DarkGrey ctermbg=DarkCyan
hi CocSearch ctermfg=Yellow
" set guifont=PowerlineSymbols
