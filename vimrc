" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline
set pastetoggle=<F1>
set backspace=indent,eol,start

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set number
set hlsearch
set ruler
set conceallevel=0

" Enable indentation matching for =>'s
filetype plugin indent on

" Cursor shape: blinking bar in insert, underline in replace, block in normal
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" Terraform vim Plugin Options
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" Solarized colorscheme
set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
colorscheme solarized

" Highlight tabs and trailing whitespace
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\	/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
