UsePlugin 'asyncomplete.vim'

" next with tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" prev with shift tab
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" close popup with enter
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

