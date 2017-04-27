if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/dein.vim

if dein#load_state(expand('~/.vim/bundles/dein.vim'))
  call dein#begin(expand('~/.vim/bundles/dein.vim'))

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('vim-scripts/sudo.vim')
  call dein#add('terut/colorscheme')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
