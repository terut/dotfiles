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

runtime! vimrc.d/plugins/*.vimrc

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
