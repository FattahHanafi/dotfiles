set nu rnu ma
set mouse=a

call plug#begin()
Plug 'preservim/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'bfrg/vim-cpp-modern'
Plug 'derekwyatt/vim-fswitch'
Plug 'neovim/nvim-lspconfig'
call plug#end()

 " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Enable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='gruvbox'

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

nmap <F8> :TagbarOpenAutoClose<CR>

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

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

nnoremap <A-a> <Esc>:NERDTreeToggle<CR>

let g:coc_global_extensions = ['coc-pairs']
nnoremap <silent> <F5> <Esc>:call CocActionAsync('doHover')<CR>

let g:vimtex_view_method = 'zathura'

let g:clang_format#style_options = {
			\ "AlignAfterOpenBracket" : "Align",
            \ "AccessModifierOffset" : -2,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
			\ "BreakBeforeBraces" : "Stroustrup",
			\ "ColumnLimit" : 150,
			\ "UseTab" : "Never"}

nnoremap <silent> <F3> <Esc>:ClangFormat<CR>

set path+=/usr/include/c++/12/
set path+=/opt/ros/humble/include/
