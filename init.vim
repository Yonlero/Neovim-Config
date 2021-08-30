call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'gko/vim-coloresque'
  Plug 'thaerkh/vim-indentguides'
  Plug 'cohama/lexima.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()
  "Config Section
  if (has("termguicolors"))
	   set termguicolors
  endif
  syntax enable
  colorscheme onehalfdark
  let g:airline_theme='onehalfdark'
  " Dracula Config Theme - NO BACKGROUND
  "let g:dracula_colorterm = 0
  hi Normal guibg=NONE ctermbg=NONE
  
  " NerdTree Config
  let g:NERDTreeShowHidden = 0
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Toggle
  nnoremap <silent> <C-b> :NERDTreeToggle<CR>

  
  " Numbers
  set number

  " Configurações do CoC.nvim

  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Fim das configurações do CoC.nvim
  
  " Configurações do Vim IndentGuides

    let g:indentguides_spacechar = '▏'
    let g:indentguides_tabchar = '▏'

  " Fim das configurações do Vim IndentGuides

  " AirLine Config
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline_theme='dalton'

  "Atalhos (MAPS) que uso
  nnoremap <C-s> :w!<CR> 
  nnoremap <C-q> :qa<CR>
  nnoremap <F1> :bprevious<CR>
  nnoremap <F2> :bnext<CR>
  nnoremap <silent> <s-Down> :m +1<CR>
  nnoremap <silent> <s-Up> :m -2<CR>
  vnoremap <C-c> "+y<CR>
  nnoremap <C-l> :tabn<CR>
  nnoremap <C-h> :tabp<CR>
  nnoremap <C-n> :tabnew<CR>
