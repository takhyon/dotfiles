" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline
set pastetoggle=<F1>
set backspace=indent,eol,start

syntax on

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
"highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=4
set number
set bg=dark
set hlsearch


" Show me a ruler
set ruler

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Enable indentation matching for =>'s
filetype plugin indent on

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" Terraform vim Plugin Options
let g:terraform_fmt_on_save=1
let g:terraform_align=1

source /Users/salrea/.vim/colors/solarized.vim
set t_Co=256

"autocmd BufEnter *.tf* colorscheme icansee
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
colorscheme solarized

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\	/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

set conceallevel=0
