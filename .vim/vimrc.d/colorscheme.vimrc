" カラースキーマ
if os == 'linux'
  "set term=screen-256color
  set t_Co=256
  colorscheme railscasts
elseif os == 'mac'
  colorscheme railscasts
else
  "colorscheme default
  colorscheme desert
endif

"let g:solarized_termcolors=&t_Co
"set background=dark
"colorscheme solarized
"colorscheme railscasts
