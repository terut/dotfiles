set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'terut/colorscheme'

" カラースキーマ
"colorscheme desert
colorscheme railscasts
" vi互換をとらない（viの独自拡張のため）
set nocompatible
" ビープ音をならさない
set vb t_vb=
" バックスペースで削除できるものを指定
" indent：行頭の空白
" eol：改行
" start：挿入モードの開始位置より手前の文字
set backspace=indent,eol,start
" ファイル内の<TAB>が対応する空白の数
set tabstop=2
" Shift移動幅
set shiftwidth=2
" タブの代わりに空白文字を挿入
set expandtab
" 新しい行のインデントを現在の行と同じにする
set autoindent
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" タイトルをウィンドウ枠に表示する
set title
" 行番号を表示する
set number
" ルーラーを表示する
set ruler
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" カッコ入力時の対応するカッコを表示
set showmatch
" 対応するカッコの表示時間を2にする
set matchtime=2
" カラーを有効化する
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメントの色を変更
"highlight Comment ctermfg=DarkGrey
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅（それ以上長くなると空白で改行）を無効
set textwidth=0
" 全角スペースの表示
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" バッファを切り替えてもundo可能
set hidden
" ファイルタイプ別インデント&プラグインを有効化する
filetype on
filetype indent on
filetype plugin on

" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
" set encoding=utf-8
" set termencoding=utf-8
" set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
" set fileencodings+=,ucs-2le,ucs-2

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □ とか○ の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

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