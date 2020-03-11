"
" Personal vim configuration
" Iván Mayoral
"
call plug#begin('~/.vim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins
""""""""""""""""""""""
" visual
Plug 'godlygeek/csapprox'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'blueyed/vim-diminactive'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" enhancements
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'vimwiki/vimwiki'
" webdev
Plug 'shawncplus/phpcomplete.vim'
Plug 'beyondwords/vim-twig'
Plug 'lukaszb/vim-web-indent'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
if has("python3")
  Plug 'vim-vdebug/vdebug'
endif

" SuperTab/Deoplete
""""""""""""""""""""""
if has("python3")
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
else
  Plug 'ervandew/supertab'
endif

call plug#end()

" General Preferences
""""""""""""""""""""""
filetype plugin indent on
syntax on
let mapleader=" "
set encoding=utf-8
set ruler
set nowrap
set ignorecase
set number
set showcmd
set mouse=a
set switchbuf=usetab
set laststatus=2
set completeopt=menu,preview
set nofoldenable
set listchars=tab:>-,space:·
set list
set wildmenu
set noeb novb t_vb=
set hlsearch
set incsearch
set showmatch
set smartindent
set backspace=indent,eol,start
set nobackup
set noswapfile
set hidden
set timeout timeoutlen=1000 ttimeoutlen=0
set swapfile
set dir=~/.swap-files

" Indentation
""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
" Comment to use tabs. Uncomment to use spaces
set expandtab

" Theme
""""""""""""""""""""""
set background=dark
" set termguicolors
let g:quantum_black=1
let g:airline_theme='quantum'
colorscheme quantum
" colorscheme onedark

" Set tip when inserting
""""""""""""""""""""""
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" Press ee to open current dir
""""""""""""""""""""""
:cnoremap eee e <c-r>=expand("%:h")<cr>/

" Copying uses common C-C and C-X shortcuts
""""""""""""""""""""""
set clipboard=unnamed
set history=500
nnoremap dd "_dd
nnoremap d "_d
vnoremap <Del> "_d
nnoremap <Del> "_x
vnoremap x "_x
nnoremap x "_x
nnoremap <C-C> "+Y
vnoremap <C-C> "+y
nnoremap <C-X> "+dd
vnoremap <C-X> "+d
nnoremap <C-V> "+P
" nnoremap <C-V> "+gP
inoremap <C-V> <left><C-O>"+p
vnoremap <BS> "_d

" Duplicate
""""""""""""""""""""""
noremap <C-D> "aY"aP

" Comment
""""""""""""""""""""""
nnoremap <silent> <C-L> :TComment<CR>
vnoremap <C-L> :TComment<CR>
inoremap <C-L> <C-O>:TComment<CR>

" Insert tabs wherever you are
"""""""""""""""""""""""
nnoremap <Tab> i<Tab><ESC><right>
nnoremap <S-Tab> <<<left>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Tabbing shortcuts
"""""""""""""""""""""""
nnoremap <C-T> :tabnew<CR>:e .<CR>
noremap <C-K> :tabprev<CR>
noremap <C-J> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-Tab> :tabnext<CR>
nnoremap <C-Q> :q!<CR>

" Moving shortcuts
"""""""""""""""""""""""
map <Esc>[1;5C <C-right>
map <Esc>[1;5D <C-left>
map <Esc>[1;5A <C-up>
map <Esc>[1;5B <C-down>
nnoremap <C-right> <C-W><right>
nnoremap <C-left>  <C-W><left>
nnoremap <C-up> <C-W><up>
nnoremap <C-down>  <C-W><down>

" Stupid finger fix
"""""""""""""""""""""""
nnoremap ; :

" Hit '/' highlights then enter search mode
"""""""""""""""""""""""
nnoremap / :set hlsearch<CR>/

" Leader Keys
"""""""""""""""""""""""
" Open Dir
nnoremap <leader>o :!xdg-open %:h<CR>
" Select All
nnoremap <leader>a ggVG
" Divide shortcuts
nnoremap <leader><right> :rightbelow vnew .<CR><CR>
nnoremap <leader><left>  :leftabove  vnew .<CR>
nnoremap <leader><up> :leftabove  new .<CR>
nnoremap <leader><down>  :rightbelow new .<CR>
nnoremap <leader><leader><right> :rightbelow vnew %:h<CR><CR>
nnoremap <leader><leader><left>  :leftabove  vnew %:h<CR>
nnoremap <leader><leader><up> :leftabove  new %:h<CR>
nnoremap <leader><leader><down>  :rightbelow new %:h<CR>
" Explore
nnoremap <leader>e :e %:h<CR>
nnoremap <leader>d :NERDTreeFocus<CR>
" Faster switch
nnoremap <leader><CR> <C-W><C-W>
" Clear search
nnoremap <silent> <leader>/ :let @/ = ""<CR>
" Vimwiki
nmap <leader>k <Plug>VimwikiDiaryPrevDay
nmap <leader>j <Plug>VimwikiDiaryNextDay
" Ale
nmap <leader>f :ALEFix<CR>

" Plugin NERDTree
"""""""""""""""""""""""
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = ' '

" Plugin ALE
"""""""""""""""""""""""
let g:ale_fixers = { 'javascript': ['eslint', 'prettier']}
" let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Plugin - Airline
""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#layout = [
  \ [ 'a' , 'c'],
  \ [ 'x', 'y', 'z', 'warning']
  \ ]

let g:airline#extensions#default#section_truncate_width = {
    \ 'x': 70,
    \ 'y': 70,
    \ 'z': 70,
    \ }

" Plugin - Indent guides
"""""""""""""""""""""""
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1

" Plugin - Indent
""""""""""""""""""""""
let g:html_indent_inctags="head,body"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" Plugin - Expand Region
""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Plugin - Syntastic
"""""""""""""""""""""""
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_phpcs_args = "--standard=PSR2 --encoding=utf-8"
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map={ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers=['eslint']

" Plugin - Deoplete
"""""""""""""""""""""""
if has("python3")
  let g:deoplete#enable_at_startup = 1

  inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

  inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "\<CR>"
  inoremap <expr><TAB>  pumvisible() ? "\<down>" : "\<TAB>"

  call deoplete#custom#option({
        \ 'auto_complete': v:false,
        \ 'smart_case': v:true,
        \ })

else
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabMappingForward ="<s-tab>"
  let g:SuperTabMappingBackward = "<s-c-tab>"
  inoremap <Nul> <C-X><C-O>
  inoremap <C-Space> <C-X><C-O>
endif
