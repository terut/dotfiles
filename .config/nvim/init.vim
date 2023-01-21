" row number <<
set number
" >>

" tab stop<<
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" >>

" clipbord<<
set clipboard+=unnamedplus
" >>

" highlight<<
if exists('&termguicolors')
  setglobal termguicolors
endif

filetype plugin indent on
syntax enable
" >>

" early return for git commit
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
  finish
end

" plugin<<
let s:data_root= empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let g:plug_shallow = 0

call plug#begin(s:data_root . '/nvim/plugged')

" colorscheme
Plug 'joshdick/onedark.vim'

" lsp

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim
" >>

" load settings depend on os<<
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "osx"
    else
      return "linux"
    endif
  endif
endfunction

let s:os=GetRunningOS()

execute 'runtime! init.' . s:os . '.vim'
" >>

