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
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
call plug#end()


" ================ coc.nvim ====================

" set a variable to manage coc-plug
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-cmake', 'coc-sh', 'coc-go']

" goto another file while the current file not save
set hidden

" close backup 
set nobackup
set nowritebackup


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
inoremap <silent><<expr><C-space> coc#refresh()


" goto error-code
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goto function
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentatino in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> H :call CocActionAsync('doHover')<CR> 

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('doHover')
    else 
	    call CocAction('doHover')
    " endif
    " if CocAction('hasProvider', 'hover')
    "     call CocActionAsync('doHover')
    " else
    "     call feedkeys('K', 'in')
    endif
endfunction

" highlight all word which is same to select
autocmd CursorHold * silent call CocActionAsync('highlight')

" inoremap <silent><expr> <C-Space> pumvisible() ? coc#select_confirm() : "\<C-R>=coc#rpc#request('doKeymap', ['snippets-expand-jump']\<CR>)"
" nnoremap <silent><expr> <C-Space> pumvisible() ? coc#select_confirm() : "\<C-R>=coc#rpc#request('doKeymap', ['snippets-expand-jump']\<CR>)"
" xnoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> Q: call CocActionAsync('doHover')<CR>

" ...
"

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" nmap <leader>c <Plug>(documentSymbol)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
" let g:airline_symbols.linenr = 'ln'
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


" ==============  commenter ====================
let g:NERDCreateDefaultMappings = 0
" add spaces when commenting
let g:NERDSpaceDelims = 1

" for beauty
let g:NERDCompactSexyComs = 1 
" 
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

let g:NERDCustomDelimiters = {
            \ 'c' : {'left' : '//'},
            \ 'cpp' : {'left' : '//'},
            \ 'go' : {'left' : '//'}
            \}

" remove space when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" 
let g:NERDTogglecCheckAllLines = 1

noremap gcc :call nerdcommenter#Comment(0, "toggle")<C-m>
vnoremap gc :call nerdcommenter#Comment(0, "toggle")<C-m>
" =================== rainbow ==============================

let g:rainbow_active = 1


let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	        \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	        \	'operators': '_,_',
	        \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	        \	'separately': {
	        \		'*': {},
	        \		'tex': {
	        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	        \		},
	        \		'lisp': {
	        \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	        \		},
	        \		'vim': {
	        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	        \		},
	        \		'html': {
	        \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	        \		},
	        \		'css': 0,
	        \		'nerdtree': 0, 
	        \	}
	        \}

