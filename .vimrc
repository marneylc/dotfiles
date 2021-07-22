set nocompatible
filetype off " required
set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" set indenting
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Plugins 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'docker/docker'
Plugin 'altercation/vim-colors-solarized'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'fatih/vim-go'
call vundle#end()

" behavior and appearance
let g:ctrlp_map = '<c-p>'
let g:NERDTreeDirArrows=0 " fix directory enter ui
set backspace=indent,eol,start
syntax on
filetype plugin indent on
set number
set hidden
syntax enable
colorscheme elflord
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " fixing yaml indentation errors
set clipboard=unnamedplus

" key mappings
map <tab> :NERDTreeToggle<CR>
" need to do these
" :split or Ctrl-w s will split the Vim view into two viewports, horizontally.
" :vsplit or Ctrl-w v will split the Vim view into two viewports, vertically.
" :split filename will split the Vim view into two viewports, horizontally,
" and open filename in the new viewport.
" :vsplit filename will split the Vim view into two viewports, vertically, and
" open filename in the new viewport.
" Ctrl-w r moves viewports clockwise.
" Ctrl-w R moves viewports counter-clockwise.
