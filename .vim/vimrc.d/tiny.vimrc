" minimal settings of vim
" TODO about hahaha, fugitive

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
" set cindent
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
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメントの色を変更
"highlight Comment ctermfg=DarkGrey
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅（それ以上長くなると空白で改行）を無効
set textwidth=0
" 外部grepを使用する
set grepformat=%f:%l:%m,%f:%l:%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" バッファを切り替えてもundo可能
set hidden

" 全角スペースの表示
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=gray

" ステータスラインの表示
  set statusline=%<     " 行が長すぎるときに切り詰める位置
  set statusline+=[%n]  " バッファ番号
  set statusline+=%m    " %m 修正フラグ
  set statusline+=%r    " %r 読み込み専用フラグ
  set statusline+=%h    " %h ヘルプバッファフラグ
  set statusline+=%w    " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
  set statusline+=%y    " バッファ内のファイルのタイプ
  set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
  set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%1l   " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L    " バッファ内の総行数
  set statusline+=,
  set statusline+=%c    " 何列目にカーソルがあるか
  set statusline+=%V    " 画面上の何列目にカーソルがあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%P    " ファイル内の何％の位置にあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%{hahhah#get_text()}

" カラーを有効化する
syntax on
" ファイルタイプ別インデント&プラグインを有効化する
filetype plugin indent on

hi Pmenu ctermbg=7
hi PmenuSel ctermbg=225
hi PmenuSbar ctermbg=0
