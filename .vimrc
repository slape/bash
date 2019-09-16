" Standard settings - colorscheme set at end
set number
set runtimepath+=$HOME/.dotfiles/.vim
syntax on
filetype plugin indent on

" vim-plug autoinstallation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" dope conveniences
" auto-run current python file by clicking Ctrl+r
nnoremap <buffer> <c-r> :exec '!python3' shellescape(@%, 1)<cr>

" assume located in ~/.dotfiles
call plug#begin('$HOME/.dotfiles/.vim/plugged')

" default configuration (thanks, tim) and color scheme
Plug 'tpope/vim-sensible'
Plug 'danilo-augusto/vim-afterglow'
Plug 'romainl/Apprentice'

" nerdtree and git wrapper
Plug 'tpope/vim-fugitive' | Plug 'scrooloose/nerdtree'

" easy alignment, surround, auto-(de)comment
Plug 'junegunn/vim-easy-align' | Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'hdima/python-syntax'

" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" lang-specific nonsense
Plug 'neovimhaskell/haskell-vim'

" colorscheme management, bejeezus
Plug 'Taverius/vim-colorscheme-manager' | Plug 'xolox/vim-colorscheme-switcher' | Plug 'xolox/vim-misc'

" Markdown preview whaaat
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_browser='Brave Browser'

" Markdown conveniences
Plug 'plasticboy/vim-markdown/'

" VimWiki why not
Plug 'https://github.com/vimwiki/vimwiki'


call plug#end()

" Must follow plugins
colorscheme apprentice
