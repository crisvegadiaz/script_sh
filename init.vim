"CONFIGURACIONES DE NVIM"
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode



" Directorio de plugins call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar call plug#end()
" Luego de esta línea puedes agregar tus configuraciones y mappings



"ARBOL DE CARPETAS"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
"COMBINACION DE TECLA"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p



"AUTOCOMPLETADO"
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'


"DEOPLETE.NVIM(AUTOCOMPLETADO DE NEOVIM)"

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()


