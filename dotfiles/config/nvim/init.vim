source ~/.config/nvim/set.vim
source ~/.config/nvim/keys.vim

call plug#begin()
    
    " Vim plugin, insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'

    " Distraction-free writing in Vim
    Plug 'junegunn/goyo.vim'

    " A vim plugin to display the indention levels with thin vertical lines
    Plug 'Yggdroot/indentLine'

    " A light and configurable statusline/tabline plugin for Vim
    Plug 'itchyny/lightline.vim'
   
    " Hyperfocus-writing in Vim
    Plug 'junegunn/limelight.vim'
    let g:limelight_conceal_ctermfg = 240
    let g:limelight_conceal_guifg   = '#777777'

    " Lightning fast left-right movement in Vim
    Plug 'unblevable/quick-scope' 

    " Vim script for text filtering and alignment
    Plug 'godlygeek/tabular'

    " The ultimate snippet solution for Vim
    Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>' 
    let g:UltiSnipsSnippetDirectories=["~/.config/nvim"]

    " Comment stuff out
    Plug 'tpope/vim-commentary'

    " A solid language pack for Vim 
    Plug 'sheerun/vim-polyglot' 

    " Multiple cursors plugin for vim/neovim
    Plug 'mg979/vim-visual-multi' 

    " A modern Vim and neovim filetype plugin for LaTeX files.
    Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_matchparen_enabled=0
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:tex_conceal='abdmg'
    autocmd BufEnter * set conceallevel=2
    autocmd BufEnter * set concealcursor=""
    autocmd BufEnter * hi clear Conceal
    inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
    nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

call plug#end()
