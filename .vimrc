function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os=GetRunningOS()

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.vim/bundles'))
  call dein#begin(expand('~/.vim/bundles'))

  " Let dein manage dein
  " Required:
  call dein#add(expand('~/.vim/bundles/repos/github.com/Shougo/dein.vim'))

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('fatih/vim-go')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('vim-scripts/sudo.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('slim-template/vim-slim')
  call dein#add('terut/colorscheme')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

source ~/.vim/vimrc.d/tiny.vimrc

" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp,cp932

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □ とか○ の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

set showtabline=2
set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i+1) . 'T' 
    let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return pathshorten(bufname(buflist[winnr - 1]))
endfunction

"autocmd BufNewFile,BufRead *mkd setfiletype mkd
"autocmd BufNewFile,BufRead *md setfiletype mkd
autocmd BufNewFile,BufRead *cnf setfiletype conf

" 保存時に行末の空白を削除する
"autocmd BufWritePre * :%s/\s\+$//ge

" 対応する括弧の補完
noremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby

command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
