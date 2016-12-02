colorscheme lyla		" color
set number			" show line numbers
set showcmd			" show command in bottom bar
set hlsearch			" highlight search matches
set showmatch			" highlight syntax matches
syntax on			" enable syntax highlight

" adds spell checking and automatic wrapping at 72 columns to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
