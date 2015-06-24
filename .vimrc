set nocompatible
filetype off
" filetype indent plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Start Plugin includes
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-surround'
" surround.vim example: cs"'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
" End Plugin includes·
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set modeline
set backspace=2
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set relativenumber
set number

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

set background=dark
colorscheme vividchalk
" colorscheme solarized

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Buffer management shortcuts
" new buffer
nmap <leader>k :enew<cr>
" next buffer
nmap <leader>l :bn!<cr>
" previous buffer
nmap <leader>h :bp!<cr>
" quit buffer
nmap <leader>bq :bp <BAR> bd #<CR>·
" <leader>b Default buffergator tab window

map <C-N><C-t> :NERDTreeToggle<CR>

set numberwidth=3
highlight LineNr ctermfg=LightBlue
nmap <C-N><C-N> :set invnumber norelativenumber!<CR>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

set foldmethod=syntax
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
