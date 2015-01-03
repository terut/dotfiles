" ### 言語別設定
" golang
if os == 'mac'
  set rtp+=/usr/local/Cellar/go/1.2.2/libexec/misc/vim
else
  set rtp+=/usr/share/go/misc/vim
endif

" filetype=go が設定された時に呼ばれる関数
"Vim で Go の設定を行う場合はこの関数内で記述する
function! s:golang()
  exe "setlocal rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
  setlocal completeopt=menu,preview
endfunction

augroup vimrc-golang
  autocmd!
  " filetype=go が設定された場合に関数を呼ぶ
  autocmd FileType go call s:golang()
augroup END
