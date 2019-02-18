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

" dein settings {{{
if &compatible
  set nocompatible
endif
" directory of dein.vim
let s:dein_dir = expand('~/.nvim/bundles')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" clone if dein doesn't exist
if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " plugin setting
  " ${XDG_CONFIG_HOME:-~/.config}
  let s:config_dir = (empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME) . "/nvim"
  let s:toml = s:config_dir . '/.dein.toml'
  let s:lazy_toml = s:config_dir . '/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Optional: install all plugins
if dein#check_install()
  call dein#install()
endif
" }}}

" $ pyenv global 2.7.11 3.6.0
" $ pip2 install --user --upgrade neovim
" $ pip3 install --user --upgrade neovim
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:python_host_prog = $PYENV_ROOT . '/shims/python2'

" Load settings depend on OS
execute 'runtime! init.' . s:os . '.vim'

" Required:
filetype plugin indent on
syntax enable
colorscheme onedark

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" row number
set number

" tab stop
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" disable scratch baffer for omni
" set completeopt-=preview
