source ~/.config/nvim/keys.vim
source ~/.config/nvim/set.vim
source ~/.config/nvim/plug.vim

call plug#begin()
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
	Plug 'folke/lsp-colors.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'scrooloose/nerdtree'
	Plug 'preservim/nerdcommenter'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'mhinz/vim-startify'
    Plug 'EdenEast/nightfox.nvim' " Vim-Plug
call plug#end()

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
