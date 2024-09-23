filetype plugin indent on
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"========================================================
call plug#begin('~/.vim/bundle')
"--------------------------------------------------------
Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
"--------------------------------------------------------
call plug#end()
"========================================================
set background=dark
colorscheme sonokai

syntax enable

set number
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set incsearch
set hlsearch
set cursorline
set wrap linebreak nolist
set textwidth=80

"autocmd vimenter * NERDTree
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :PlugUpdate<CR>

map <F2> <Esc>:w<CR>
map <F3> <Esc>:q<CR>
map <F4> <Esc>:vsplit<CR>
map <F5> <Esc>:split<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key

    if(t:curwin == winnr())
        if(match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
            exec "wincmd ".a:key
    endif
endfunction

"Не в список плагинов
"let c_syntax_for_h=""
"let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
"let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
"let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
"let g:Powerline_symbols='unicode' "Поддержка unicode
"let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажурасскажу
