if !1 | finish | endif

if has('vim_starting')
  if &compatible
    " vi互換をとらない（viの独自拡張のため）
    set nocompatible
  end

  " runtimepath
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/hahhah-vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'terut/colorscheme'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

runtime! vimrc.d/plugins/*.vimrc
