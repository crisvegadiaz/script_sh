" ==========================================
" 1. OPCIONES BÁSICAS
" ==========================================
let mapleader = " "          " Tecla Leader (Espacio)

set number
set relativenumber
set numberwidth=1
set mouse=a
set clipboard=unnamedplus    " Copia/pega con el portapapeles del sistema
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set tabstop=2
set expandtab
set smartindent
set laststatus=2
set noshowmode
set termguicolors

" ==========================================
" 2. GESTOR DE PLUGINS (vim-plug)
" ==========================================
call plug#begin('~/.local/share/nvim/plugged')

" Árbol de archivos lateral (NvimTree)
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Menú buscador interactivo de archivos y carpetas (Telescope)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Menú emergente de ayuda para atajos de teclado (Which-Key)
Plug 'folke/which-key.nvim'

" Resaltado de sintaxis avanzado para JS, TS, Java, HTML, CSS, SQL, Docker, Bash
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master', 'do': ':TSUpdate' }

" Autocompletado rápido para HTML/CSS
Plug 'mattn/emmet-vim'

" Tema visual
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" ==========================================
" 3. CONFIGURACIÓN DE PLUGINS
" ==========================================

" Tema de color
colorscheme catppuccin-mocha

" Emmet config
let g:user_emmet_leader_key='<C-Z>'

" Configuración de Nvim-Tree (Árbol de carpetas lateral)
lua << EOF
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if status_ok then
  nvim_tree.setup({
    sort_by = "case_sensitive",
    view = { width = 30 },
    renderer = { group_empty = true },
    filters = { dotfiles = false },
  })
end
EOF

" Configuración de Telescope (Buscador visual de archivos y contenido)
lua << EOF
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Buscar archivos por nombre' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Buscar texto en archivos' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Ver archivos abiertos (buffers)' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Buscar ayuda' })
EOF

" Configuración de Which-Key (Menú emergente de atajos)
lua << EOF
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.setup({
    preset = "classic"
  })
end
EOF

" Atajos de teclado para navegación de carpetas y archivos
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>ef :NvimTreeFindFile<CR>

" Configuración de Treesitter (Sintaxis para tus lenguajes)
lua << EOF
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
  treesitter.setup({
    ensure_installed = { 
      "javascript", "typescript", "java", "html", 
      "css", "bash", "sql", "dockerfile", "yaml", "json" 
    },
    highlight = { enable = true },
    indent = { enable = true }
  })
end
EOF